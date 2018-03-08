using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web;

namespace E_Ticaret
{
    public partial class Products : System.Web.UI.Page
    {
        // ----------------------------------------------------------------------------
        // Load
        // ----------------------------------------------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            ProductFill();
        }
        Web.Library.E_TicaretDataContext db = new Web.Library.E_TicaretDataContext();
        private void ProductFill()
        {
            if (string.IsNullOrEmpty(Request.QueryString["CategoryID"]) != true)
            {
                var result = from x in db.Products
                             where x.CategoryID == Convert.ToInt32(Request.QueryString["CategoryID"])
                             select x;
                DataList1.DataSource = result;
            }
            else
            {
                var result = from x in db.Products
                             select x;
                DataList1.DataSource = result;
            }
            DataList1.DataBind();
        }

        // ----------------------------------------------------------------------------
        // DataList Command
        // ----------------------------------------------------------------------------
        public Web.Library.Product selectedProduct { set; get; }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument.ToString());
            switch (e.CommandName)
            {
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
                        //Web.Library.Cart.CartTools.GetAllCartProduct(Session["myCart"]);

                        Session["mycart"] = listemiz;
                        Response.Redirect(Page.Request.Url.ToString());
                    }
                    break;
            }
        }

        // ----------------------------------------------------------------------------
        // DataList 
        // ----------------------------------------------------------------------------
        protected void DataList1_ItemCreated(object sender, DataListItemEventArgs e)
        {
            // dropdownlist içine stok adetini getireceğiz. sotokta yok ve ya tükendi de yazdırılacak
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Web.Library.Product prod = e.Item.DataItem as Web.Library.Product;
                    int? stok = prod.UnitsInStock; // stukta ürün kalmadığında -> "?" Nullable hata vermeyecek
                    DropDownList drpStokAdedi = e.Item.FindControl("drpQuantity") as DropDownList;
                    if (IsPostBack == true && drpStokAdedi.SelectedItem != null) return;
                    if (stok == null || stok == 0)
                    {
                        ListItem li = new ListItem("Stokta Yok", "0");
                        drpStokAdedi.Items.Add(li);
                    }
                    else
                    {
                        for (int i = 0; i < stok; i++)
                        {
                            drpStokAdedi.Items.Add(i.ToString());
                        }
                    }
                }
            }
            catch
            {

            }
        }
    }
}