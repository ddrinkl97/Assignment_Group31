using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Assignment_Group31
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (string.IsNullOrWhiteSpace(firstname.Text))
            {
                Response.Write("<script>alert('First name is required.');</script>");
                return;
            }

            if (string.IsNullOrWhiteSpace(lastname.Text))
            {
                Response.Write("<script>alert('Last name is required.');</script>");
                return;
            }

            if (string.IsNullOrWhiteSpace(email.Text))
            {
                Response.Write("<script>alert('Email is required.');</script>");
                return;
            }

            if (string.IsNullOrWhiteSpace(username.Text))
            {
                Response.Write("<script>alert('Username is required.');</script>");
                return;
            }

            if (string.IsNullOrWhiteSpace(password.Text))
            {
                Response.Write("<script>alert('Password is required.');</script>");
                return;
            }

            if (string.IsNullOrWhiteSpace(gender.SelectedValue))
            {
                Response.Write("<script>alert('Please select a gender.');</script>");
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                string checkSql = "SELECT COUNT(*) FROM UserTable WHERE username = @username OR email = @email";

                using (SqlCommand checkCmd = new SqlCommand(checkSql, conn))
                {
                    checkCmd.Parameters.AddWithValue("@username", username.Text.Trim());
                    checkCmd.Parameters.AddWithValue("@email", email.Text.Trim());

                    int existingCount = (int)checkCmd.ExecuteScalar();

                    if (existingCount > 0)
                    {
                        Response.Write("<script>alert('Username or email already exists. Please use a different one.');</script>");
                        return;
                    }
                }

                string insertSql = "INSERT INTO UserTable (username, password, firstname, lastname, usertype, gender, email) " +
                                   "VALUES (@username, @password, @firstname, @lastname, @usertype, @gender, @email)";

                using (SqlCommand cmd = new SqlCommand(insertSql, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", password.Text.Trim());
                    cmd.Parameters.AddWithValue("@firstname", firstname.Text.Trim());
                    cmd.Parameters.AddWithValue("@lastname", lastname.Text.Trim());
                    cmd.Parameters.AddWithValue("@usertype", usertype.SelectedValue);
                    cmd.Parameters.AddWithValue("@gender", gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@email", email.Text.Trim());

                    try
                    {
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Registration Successful!'); window.location='Login.aspx';</script>");
                    }
                    catch (Exception ex)
                    {
                        string safeMessage = ex.Message.Replace("'", "").Replace("\r", " ").Replace("\n", " ");
                        Response.Write("<script>alert('Error: " + safeMessage + "');</script>");
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