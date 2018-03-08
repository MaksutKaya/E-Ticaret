using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        // ----------------------------------------------------------------------------
        // Load
        // ----------------------------------------------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            UrunBilgisiniAl();
            BenzerUrunleriGetir();
        }

        Web.Library.E_TicaretDataContext db = new Web.Library.E_TicaretDataContext();

        public Web.Library.Product selectedProduct { set; get; }

        public string stokDurumu = "";
        public string kargoUcreti = "";
        public string yaziColor = "";
        private void UrunBilgisiniAl()
        {
            if (string.IsNullOrEmpty(Request.QueryString["ProductID"]) == true)
            {
                Response.Redirect("Default.aspx");
            }
            // ID'yi kaybolmasın diye sanalda biryerde tutalım. HiddenField kullanacağız
            hdfProductID.Value = Request.QueryString["ProductID"];
            int prodID = Convert.ToInt32(hdfProductID.Value);

            selectedProduct = db.Products.FirstOrDefault(x => x.ProductID == prodID);
            LinkButton1.CommandArgument = selectedProduct.CategoryID.ToString();

            if (selectedProduct.UnitsInStock > 5)
            {
                yaziColor = "green";
                stokDurumu = "Stokta";
            }
            else if (selectedProduct.UnitsInStock > 0)
            {
                yaziColor = "orange";
                stokDurumu = "Son " + selectedProduct.UnitsInStock.ToString() + " Urun !";
            }
            else
            {
                yaziColor = "red";
                stokDurumu = "Tükendi";
            }

            if (selectedProduct.UnitPrice > 100)
            {
                kargoUcreti = "Kargo ücretsizdir";
            }
            else
            {
                kargoUcreti = "7.90";
            }
        }

        // ----------------------------------------------------------------------------
        // DataList DataSource (BenzerUrunler Datalist)
        // ----------------------------------------------------------------------------
        public int? benzerCateID { get; set; }
        public int? benzerProdID { get; set; }
        public string benzerConnectionString { get; set; }
        public string digerConnectionString { get; set; }
        private void BenzerUrunleriGetir()
        {
            benzerCateID = selectedProduct.CategoryID;
            benzerProdID = selectedProduct.ProductID;

            benzerConnectionString = string.Format("Select top 3 * from Products where CategoryID = {0} and ProductID != {1} order by NEWID()", benzerCateID, benzerProdID);
            BenzerUrunler.SelectCommand = benzerConnectionString;
            digerConnectionString = string.Format("Select top 3 * from Products where CategoryID != {0} order by NEWID()", benzerCateID );
            RastgeleUrunler.SelectCommand = digerConnectionString;

            //SELECT TOP 9 * FROM PRODUCTS ORDER BY NEWID() // rastgele sıralama order by newID()

            //db = new Web.Library.E_TicaretDataContext();

            //var result = from x in db.Products where x.CategoryID == categoryId && x.ProductID != prodID  select x;


            //DataList1.DataSource = result.Take(3).ToList();
            //DataList1.DataBind();
        }

        // ----------------------------------------------------------------------------
        // DataList Command
        // ----------------------------------------------------------------------------
        protected void GenelDataList_ItemCommand(object source, DataListCommandEventArgs e)
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
                        DropDownList drpStokAdedi = e.Item.FindControl("drpQuantity") as DropDownList;

                        db = new Web.Library.E_TicaretDataContext();
                        Web.Library.Product selectedProd = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt32(hdfProductID.Value));

                        Web.Library.Cart.CartProduct currentItem = new Web.Library.Cart.CartProduct();
                        currentItem.selectedProduct = selectedProd;
                        currentItem.Quantity++;


                        List<Web.Library.Cart.CartProduct> listemiz = Web.Library.Cart.CartTools.AddItem(currentItem, Session["myCart"]);
                        Session["mycart"] = listemiz;

                        // Response.Redirect("~/ProductDetails.aspx?ProductId=" + productId.ToString());
                        Response.Redirect(Page.Request.Url.ToString());
                    }
                    break;
            }
        }

        // ----------------------------------------------------------------------------
        // GenelProdDetails Command (command yapısından dolayı datalistleri ayırdım)
        // ----------------------------------------------------------------------------
        protected void GenelProdDetails_Command(object sender, CommandEventArgs e)
        {
            int productId = Convert.ToInt32(hdfProductID.Value);
            switch (e.CommandName)
            {
                case "kategori":
                    {
                        Response.Redirect("~/Products.aspx?CategoryID=" + e.CommandArgument.ToString());
                    }
                    break;
                case "AddToCart":
                    {
                        db = new Web.Library.E_TicaretDataContext();

                        Web.Library.Product selectedProd = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt32(hdfProductID.Value));
                        Web.Library.Cart.CartProduct currentItem = new Web.Library.Cart.CartProduct();

                        currentItem.selectedProduct = selectedProd;
                        currentItem.Quantity++;

                        List<Web.Library.Cart.CartProduct> listemiz = Web.Library.Cart.CartTools.AddItem(currentItem, Session["myCart"]);

                        Session["mycart"] = listemiz;
                        Response.Redirect("~/ProductDetails.aspx?ProductId=" + selectedProd.ProductID.ToString());
                    }
                    break;
                case "Compare":
                    {
                        db = new Web.Library.E_TicaretDataContext();

                        Web.Library.Product selectedProd = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt32(hdfProductID.Value));
                        List<Web.Library.Product> comparableItemsEnd = Web.Library.Compare.CompareTools.AddCompare(Session["myComparable"], selectedProd);

                        selectedProduct = selectedProd;
                        Session["myComparable"] = comparableItemsEnd;

                        Response.Redirect(Page.Request.Url.ToString());
                    }
                    break;
            }
        }



        //protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        //{
        //    int productId = Convert.ToInt32(e.CommandArgument.ToString());
        //    switch (e.CommandName)
        //    {
        //        case "detailsFromProductName":
        //            {
        //                Response.Redirect("~/ProductDetails.aspx?ProductId=" + productId.ToString());
        //            }
        //            break;
        //        case "details":
        //            {
        //                Response.Redirect("~/ProductDetails.aspx?ProductId=" + productId.ToString());
        //            }
        //            break;
        //        case "addToCart":
        //            {
        //                DropDownList drpStokAdedi = e.Item.FindControl("drpQuantity") as DropDownList;

        //                db = new Web.Library.E_TicaretDataContext();
        //                Web.Library.Product selectedProd = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt32(hdfProductID.Value));

        //                Web.Library.Cart.CartProduct currentItem = new Web.Library.Cart.CartProduct();
        //                currentItem.selectedProduct = selectedProd;
        //                currentItem.Quantity++;


        //                List<Web.Library.Cart.CartProduct> listemiz = Web.Library.Cart.CartTools.AddItem(currentItem, Session["myCart"]);
        //                Session["mycart"] = listemiz;

        //                // Response.Redirect("~/ProductDetails.aspx?ProductId=" + productId.ToString());
        //                Response.Redirect(Page.Request.Url.ToString());
        //            }
        //            break;
        //    }
        //}
    }
}