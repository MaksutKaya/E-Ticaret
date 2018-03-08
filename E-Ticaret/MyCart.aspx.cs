using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    // ----------------------------------------------------------------------------
    // Load
    // ----------------------------------------------------------------------------
    public partial class MyCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            sepetiDoldur();
        }

        private void sepetiDoldur()
        {
            List<Web.Library.Cart.CartProduct> listemiz = (List<Web.Library.Cart.CartProduct>)Session["myCart"];

            if (listemiz != null)
            {
                rptMyCart.DataSource = listemiz;
                rptMyCart.DataBind();

                decimal? total = 0;

                foreach (var li in listemiz)
                {
                    total += li.Quantity * li.UnitPrice;
                }
                this.TotalPrice = total;
            }
        }

        public decimal? TotalPrice { get; set; } // ? -> Nullable boş olum durumunda hata vermez

        // ----------------------------------------------------------------------------
        // Sepetten Ürün silme
        // ----------------------------------------------------------------------------
        protected void btnSecilenleriKaldir_Click(object sender, EventArgs e)
        {
            List<Web.Library.Cart.CartProduct> listemiz = (List<Web.Library.Cart.CartProduct>)Session["myCart"];

            if (listemiz != null)
            {
                List<Web.Library.Cart.CartProduct> kaldirilacaklar = new List<Web.Library.Cart.CartProduct>();
                foreach (RepeaterItem rpt in rptMyCart.Items)
                {
                    CheckBox chk = rpt.FindControl("chkCheck") as CheckBox;
                    if (chk.Checked)
                    {
                        HiddenField hf = rpt.FindControl("hfProductID") as HiddenField;

                        if (string.IsNullOrEmpty(hf.Value) == false)
                        {
                            int id = Convert.ToInt32(hf.Value);

                            Web.Library.Cart.CartProduct prod = new Web.Library.Cart.CartProduct();
                            prod = listemiz.FirstOrDefault(x => x.ProductID == id);
                            listemiz.Remove(prod);
                        }
                    }
                }

                Session["myCart"] = listemiz;

                Response.Redirect(Page.Request.Url.ToString());

                sepetiDoldur();
            }
        }

        // ----------------------------------------------------------------------------
        // Load
        // ----------------------------------------------------------------------------
        Web.Library.E_TicaretDataContext db = new Web.Library.E_TicaretDataContext();
        protected void rptMyCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "addToCart":
                    {
                        int productId = Convert.ToInt32(e.CommandArgument.ToString());
                        List<Web.Library.Cart.CartProduct> currentItems = Web.Library.Cart.CartTools.GetAllCartProduct(Session["myCart"]);

                        Web.Library.Product selectedProd = db.Products.FirstOrDefault(p => p.ProductID == productId);

                        currentItems.Add(new Web.Library.Cart.CartProduct()
                        {
                            Quantity = 1,
                            selectedProduct = (Web.Library.Product)selectedProd
                            
                        });

                        Session["mycart"] = currentItems;
                    }
                    break;
                case "detailsFromProductName":
                    {
                        Response.Redirect("~/ProductDetails.aspx?ProductId=" + e.CommandArgument.ToString());
                    }
                    break;
            }
        }
    }
}