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
            // 1. Check the Secret Key FIRST
            if (adminSecret.Text != "admin1234")
            {
                Response.Write("<script>alert('Invalid Admin Secret Key! Access Denied.');</script>");
                return; // Stop the code here
            }

            // 2. If key is correct, proceed with Database Insert
            string connString = ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = "INSERT INTO UserTable (username, password, firstname, lastname, usertype, gender, email) " +
                             "VALUES (@username, @password, @firstname, @lastname, @usertype, @gender, @email)";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", password.Text.Trim());
                    cmd.Parameters.AddWithValue("@firstname", firstname.Text.Trim());
                    cmd.Parameters.AddWithValue("@lastname", lastname.Text.Trim());

                    // DIRECTLY STATE the usertype as "Admin"
                    cmd.Parameters.AddWithValue("@usertype", "Admin");

                    cmd.Parameters.AddWithValue("@gender", gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@email", email.Text.Trim());

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Admin Account Created Successfully!'); window.location='Login.aspx';</script>");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                }
            }
        }
    }
}