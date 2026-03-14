using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCrypt.Net;

namespace Assignment_Group31
{
    public partial class AdminRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void adminSecret_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnConfirmAdmin_Click(object sender, EventArgs e)
        {
            // Check the Secret Key
            if (adminSecret.Text != "admin1234")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Admin Secret Key! Access Denied.');", true);
                return;
            }

            // Hash the Admin Password
            string hashedAdminPassword = BCrypt.Net.BCrypt.HashPassword(password.Text.Trim());

            // Database Insert
            string connString = ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = "INSERT INTO UserTable (username, password, firstname, lastname, usertype, gender, email) " +
                             "VALUES (@username, @password, @firstname, @lastname, @usertype, @gender, @email)";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", hashedAdminPassword); 
                    cmd.Parameters.AddWithValue("@firstname", firstname.Text.Trim());
                    cmd.Parameters.AddWithValue("@lastname", lastname.Text.Trim());
                    cmd.Parameters.AddWithValue("@usertype", "Admin"); // Hardcoded for Admin
                    cmd.Parameters.AddWithValue("@gender", gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@email", email.Text.Trim());

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();

                        string script = "alert('Admin Account Created Successfully!'); window.location='Login.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    }
                    catch (SqlException ex)
                    {
                        // Handle duplicate username for admin
                        string msg = ex.Number == 2627 ? "Username already exists!" : ex.Message;
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + msg.Replace("'", "") + "');", true);
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