using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret.Admin
{
    public partial class DefaultAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated == false)
            {
                Response.Redirect("adminlogin.aspx");
            }
            if (Page.User.Identity.Name != "admin")
            {
                FormsAuthentication.SignOut();
                Response.Redirect("adminlogin.aspx");
            }
        }
    }
}