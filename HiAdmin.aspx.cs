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
    public partial class HiAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 1. Check if session exists (prevents unauthorized access)
            if (Session["LoggedUser"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string currentUser = Session["LoggedUser"].ToString();
            string connString = ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Select all columns for this specific user
                string sql = "SELECT * FROM UserTable WHERE username = @username";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@username", currentUser);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // 2. Output the data to the labels
                    lblFirstName.Text = reader["firstname"].ToString();
                    lblUser.Text = reader["username"].ToString();
                    lblEmail.Text = reader["email"].ToString();
                    lblGender.Text = reader["gender"].ToString();
                }
            }
        }
    }
}