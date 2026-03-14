using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Assignment_Group31
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = "SELECT usertype FROM UserTable WHERE username = @username AND password = @password";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", password.Text.Trim());

                    try
                    {
                        conn.Open();
                        object result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            string type = result.ToString().Trim();

                            Session["LoggedUser"] = username.Text.Trim();
                            Session["UserID"] = username.Text.Trim();
                            Session["FullName"] = username.Text.Trim();
                            Session["RoleName"] = type;

                            if (type == "Student")
                            {
                                Response.Redirect("StudentDashboard.aspx");
                            }
                            else if (type == "Teacher")
                            {
                                Response.Redirect("TeacherDashboard.aspx");
                            }
                            else if (type == "Admin")
                            {
                                Response.Redirect("~/Admin/AdminDashboard.aspx");
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(
                                    this.GetType(),
                                    "unknownType",
                                    "alert('Unknown user type.');",
                                    true
                                );
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(
                                this.GetType(),
                                "invalidLogin",
                                "alert('Invalid Username or Password!');",
                                true
                            );
                        }
                    }
                    catch (Exception ex)
                    {
                        string safeMessage = ex.Message.Replace("'", "").Replace("\r", " ").Replace("\n", " ");
                        ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "dbError",
                            "alert('Error: " + safeMessage + "');",
                            true
                        );
                    }
                }
            }
        }
    }
}