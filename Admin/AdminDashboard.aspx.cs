using System;

namespace Assignment_Group31
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: extra protection (master page already checks)
            if (Session["UserID"] == null || Session["RoleName"] == null
                || Session["RoleName"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack && Session["FullName"] != null)
            {
                lblAdminName.Text = Session["FullName"].ToString();
            }
        }
    }
}