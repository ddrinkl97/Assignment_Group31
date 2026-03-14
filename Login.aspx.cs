using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using BCrypt.Net;

namespace Assignment_Group31
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                // fetch both the password and the usertype for the given username
                string sql = "SELECT password, usertype FROM UserTable WHERE username = @username";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username.Text.Trim());

                    try
                    {
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read()) // If the username exists
                        {
                            string storedHash = reader["password"].ToString();
                            string type = reader["usertype"].ToString();

                            // Verify the plain-text input against the stored hash
                            bool isPasswordCorrect = BCrypt.Net.BCrypt.Verify(password.Text, storedHash);

                            if (isPasswordCorrect)
                            {
                                // Success. Setup Session and Redirect
                                Session["LoggedUser"] = username.Text;
                                Session["UserType"] = type; // Storing type in session

                                if (type == "Student")
                                {
                                    Response.Redirect("HiStudent.aspx");
                                }
                                else if (type == "Teacher")
                                {
                                    Response.Redirect("HiTeacher.aspx");
                                }
                                else if (type == "Admin")
                                {
                                    Response.Redirect("HiAdmin.aspx");
                                }
                            }
                            else
                            {
                                // Password mismatch
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Username or Password!');", true);
                            }
                        }
                        else
                        {
                            // Username not found
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Username or Password!');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "") + "');", true);
                    }
                }
            }
        }
    }
}