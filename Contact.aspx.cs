using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_Group31
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            // For now, just show a success alert
            Response.Write("<script>alert('Thank you! Your message has been sent to Group 31.'); window.location='FrontPage.aspx';</script>");
        }
    }
}