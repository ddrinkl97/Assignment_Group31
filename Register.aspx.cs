using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using BCrypt.Net;

using System.Configuration;

namespace Assignment_Group31
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Validation check to ensure required fields aren't just whitespace
            if (string.IsNullOrWhiteSpace(username.Text) || string.IsNullOrWhiteSpace(password.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill in all required fields.');", true);
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString;

            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password.Text);

            using (SqlConnection conn = new SqlConnection(connString))
            {
                // UserTable
                string sql = "INSERT INTO UserTable (username, password, firstname, lastname, usertype, gender, email) " +
                             "VALUES (@username, @password, @firstname, @lastname, @usertype, @gender, @email)";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", hashedPassword);
                    cmd.Parameters.AddWithValue("@firstname", firstname.Text.Trim());
                    cmd.Parameters.AddWithValue("@lastname", lastname.Text.Trim());
                    cmd.Parameters.AddWithValue("@usertype", usertype.SelectedValue);
                    cmd.Parameters.AddWithValue("@gender", gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@email", email.Text.Trim());

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();

                        string script = "alert('Registration Successful! Welcome to Math Leveling.'); window.location='Login.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    }
                    catch (SqlException ex)
                    {
                        // Specifically catch duplicate primary key (Username) errors
                        if (ex.Number == 2627)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('That username is already taken. Please try another.');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Database Error: " + ex.Message.Replace("'", "") + "');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred: " + ex.Message.Replace("'", "") + "');", true);
                    }
                }
            }
        }

        protected void btnAdminRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminRegister.aspx");
        }
    }
}