using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class ComparedProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            KarsilastirilacakUrunlariGetir();
        }

        private void KarsilastirilacakUrunlariGetir()
        {
            List<Web.Library.Product> listemiz = Web.Library.Compare.CompareTools.GetComparables(Session["myComparable"]);

            dGwUrunKarsilastirma.DataSource = listemiz;
            dGwUrunKarsilastirma.DataBind();
        }

        Web.Library.E_TicaretDataContext db = new Web.Library.E_TicaretDataContext();
        protected void lbtnSecilenleriKaldir_Click(object sender, EventArgs e)
        {
            List<Web.Library.Product> currentItems = Web.Library.Compare.CompareTools.GetComparables(Session["myComparable"]);

            foreach (GridViewRow dGwR in dGwUrunKarsilastirma.Rows)
            {
                CheckBox chk = dGwR.FindControl("chkCheck") as CheckBox;

                if (chk.Checked)
                {
                    int prodId = Convert.ToInt32((dGwR.FindControl("hfProductID") as HiddenField).Value);

                    Web.Library.Product kaldirilanUrun = currentItems.FirstOrDefault(x=> x.ProductID == prodId);

                    currentItems.Remove(kaldirilanUrun);
                }
            }
            Session["myComparable"] = currentItems;
            Response.Redirect(Page.Request.Url.ToString());
            //KarsilastirilacakUrunlariGetir();
        }

        protected void Genel_Command(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "detailsFromProductName":
                    {
                        Response.Redirect("~/ProductDetails.aspx?ProductId=" + e.CommandArgument.ToString());
                    }
                    break;
            }
        }
    }
}