using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class Default : System.Web.UI.Page
    {
        Random rnd = new Random();
        public string SelectCommandDefaultPage  { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
        }

        Web.Library.E_TicaretDataContext db = new Web.Library.E_TicaretDataContext();

        public Web.Library.Product selectedProduct { set; get; }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument.ToString());
            switch (e.CommandName)
            {
                case "detailsFromProductName":
                    {
                        Response.Redirect("~/ProductDetails.aspx?ProductId=" + productId.ToString());
                    }
                    break;
                case "details":
                    {
                        Response.Redirect("~/ProductDetails.aspx?ProductId=" + productId.ToString());
                    }
                    break;
                case "addToCart":
                    {
                        db = new Web.Library.E_TicaretDataContext();
                        Web.Library.Product selectedProd = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt32(e.CommandArgument));

                        Web.Library.Cart.CartProduct currentItem = new Web.Library.Cart.CartProduct();
                        currentItem.selectedProduct = selectedProd;
                        currentItem.Quantity++;

                        List<Web.Library.Cart.CartProduct> listemiz = Web.Library.Cart.CartTools.AddItem(currentItem, Session["myCart"]);

                        Session["mycart"] = listemiz;
                        Response.Redirect(Page.Request.Url.ToString());
                    }
                    break;
            }
        }
    }
}