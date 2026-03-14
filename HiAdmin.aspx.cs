using System;

public partial class HiAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Optional: keep the same admin protection pattern
        if (Session["UserID"] == null || Session["RoleName"] == null || Session["RoleName"].ToString() != "Admin")
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        Response.Redirect("~/Admin/AdminDashboard.aspx");
    }
}