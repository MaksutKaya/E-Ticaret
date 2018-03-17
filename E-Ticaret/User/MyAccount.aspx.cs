using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret.User
{
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
            if (Page.User.Identity.IsAuthenticated == false)
            {
                Response.Redirect("~/Default.aspx");
            }
            if (Page.User.Identity.Name!="admin")
            {
                lbtnAdminPaneli.Visible = false;
            }
            else
            {
                lbtnAdminPaneli.Visible = true;
            }
            MultiView1.ActiveViewIndex = -1;
        }

        protected void Genel_Command(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "SifreDegistir":
                    {
                        MultiView1.ActiveViewIndex = 0;
                    }
                    break;
                case "AdminPaneli":
                    {
                        Response.Redirect("~/admin/DefaultAdmin.aspx");
                    }
                    break;
            }
        }

        protected void ChangePassword1_ContinueButtonClick(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect(Page.Request.Url.ToString());
        }

        protected void ChangePassword1_CancelButtonClick(object sender, EventArgs e)
        {
            Response.Redirect(Page.Request.Url.ToString());
        }
    }
}