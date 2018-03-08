using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class Search : System.Web.UI.Page
    {
        // ----------------------------------------------------------------------------
        // Load 
        // ----------------------------------------------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            if (string.IsNullOrEmpty(Request.QueryString["AranacakDeger"])==false)
            {
                // Anasayfamdaki arama TextBox'ındaki velue buradak TextBaox'ta da dolu gelsin
                txtAra.Text = Request.QueryString["AranacakDeger"].ToString();

                Arama(Request.QueryString["AranacakDeger"].ToString());
            }
        }

        // ----------------------------------------------------------------------------
        // Arama İşlemi
        // ----------------------------------------------------------------------------
        Web.Library.E_TicaretDataContext db = new Web.Library.E_TicaretDataContext();
        private void Arama(string parameter)
        {
            string aranacakDeger = parameter.Replace("-", "").Replace("/", "").Replace("<", "").Replace("?", "");

            var result = from x in db.Products
                         where x.ProductName.Contains(aranacakDeger) == true || x.Category.CategoryName.Contains(aranacakDeger) == true
                         select x;
            DataList1.DataSource = result;
            DataList1.DataBind();

           
        }

        protected void btnAra_Click(object sender, EventArgs e)
        {
            Arama(txtAra.Text);
        }

        // ----------------------------------------------------------------------------
        // DataList, ProductDetails ve Sepetim
        // ----------------------------------------------------------------------------
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
                        // Response.Write("Ürününüz Sepete Eklenmiştir ...");

                        DropDownList drpStokAdedi = e.Item.FindControl("drpQuantity") as DropDownList;

                        db = new Web.Library.E_TicaretDataContext();
                        Web.Library.Product selectedProd = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt32(e.CommandArgument));

                        List<Web.Library.Cart.CartProduct> currentItemsEnd = Web.Library.Cart.CartTools.GetAllCartProduct(Session["myCart"]);

                        currentItemsEnd.Add(new Web.Library.Cart.CartProduct()
                        {
                            Quantity = 1,
                            selectedProduct = (Web.Library.Product)selectedProd
                        });
                        selectedProduct = selectedProd;
                        Session["mycart"] = currentItemsEnd;
                        Response.Redirect(Page.Request.Url.ToString());
                    }
                    break;
            }
        }
    }
}