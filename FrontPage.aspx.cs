using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_Group31
{
    public partial class FrontPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            // Simple popup to show it worked
            string script = "alert('Thank you! Your message/request has been sent to our team.');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
    }
}