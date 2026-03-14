using System;

namespace Assignment_Group31
{
    public partial class Admin_Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // SECURITY CHECK:
            // Once login is hooked up, this ensures only Admin role can access admin pages.
            // While you're still testing, you can comment this block out if needed.
            if (Session["UserID"] == null || Session["RoleName"] == null
                || Session["RoleName"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}