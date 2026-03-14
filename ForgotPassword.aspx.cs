using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_Group31
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            // Check if passwords match
            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Passwords do not match!');", true);
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Verify identity and update
                // check username and email; if match, update the password
                string sql = "UPDATE UserTable SET password = @newPassword WHERE username = @username AND email = @email";

                SqlCommand cmd = new SqlCommand(sql, conn);
                string hashedPass = BCrypt.Net.BCrypt.HashPassword(txtNewPassword.Text);

                cmd.Parameters.AddWithValue("@newPassword", hashedPass);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Success! Your password has been updated.'); window.location='Login.aspx';", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Verification failed. Username or Email is incorrect.');", true);
                }
            }
        }
    }
}