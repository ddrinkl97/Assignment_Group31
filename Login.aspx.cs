using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

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
                // SQL query using your exact column names: username, password, usertype
                string sql = "SELECT usertype FROM UserTable WHERE username = @username AND password = @password";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    // Mapping your IDs (username and password) to the SQL query
                    cmd.Parameters.AddWithValue("@username", username.Text);
                    cmd.Parameters.AddWithValue("@password", password.Text);

                    try
                    {
                        conn.Open();
                        // ExecuteScalar is used because we only need to fetch one value (usertype)
                        object result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            string type = result.ToString();

                            // Redirect users based on their role stored in the database
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
                            // If no match is found
                            Response.Write("<script>alert('Invalid Username or Password!');</script>");
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error: " + ex.Message);
                    }
                }
            }
        }
    }
}