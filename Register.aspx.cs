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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Using your connection string name
            string connString = ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                // SQL query using your exact column names
                string sql = "INSERT INTO UserTable (username, password, firstname, lastname, usertype, gender, email) " +
                             "VALUES (@username, @password, @firstname, @lastname, @usertype, @gender, @email)";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    // Mapping your Control IDs directly to the SQL Parameters
                    // Since your IDs match the columns, it looks like this:
                    cmd.Parameters.AddWithValue("@username", username.Text);
                    cmd.Parameters.AddWithValue("@password", password.Text);
                    cmd.Parameters.AddWithValue("@firstname", firstname.Text);
                    cmd.Parameters.AddWithValue("@lastname", lastname.Text);
                    cmd.Parameters.AddWithValue("@usertype", usertype.SelectedValue);
                    cmd.Parameters.AddWithValue("@gender", gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@email", email.Text);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();

                        // Alert user and redirect
                        Response.Write("<script>alert('Registration Successful!'); window.location='Login.aspx';</script>");
                    }
                    catch (Exception ex)
                    {
                        // This will catch errors like "Duplicate Username" if you set it as a Primary Key
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                }
            }
        }
    }
}