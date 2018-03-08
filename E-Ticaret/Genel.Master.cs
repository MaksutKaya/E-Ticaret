using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class Genel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            sepettekiUrunlerimiz(); // masterpage için üstteki sepet görseline gelmesi gerek toplam fiyat ve ürün adedini çekeceğiz
            karsilastirilacakUrunlerimiz();
            leftRightSales();

        }
        Random rnd = new Random();

        public Web.Library.Product saleleft { get; set; }
        public Web.Library.Product saleNew { get; set; }
        public int? saleMaxID;
        public int? i = 0;

        Web.Library.E_TicaretDataContext db = new Web.Library.E_TicaretDataContext();

        private void leftRightSales()
        {
            db = new Web.Library.E_TicaretDataContext();
            saleMaxID = db.Products.Max(p => p.ProductID);

            i = (i + rnd.Next(1, saleMaxID.Value)) % saleMaxID.Value;
            saleleft = db.Products.FirstOrDefault(p => p.ProductID > i);
            hfSaleLeft.Value = saleleft.ProductID.ToString();
            ImgbtnSaleLeft.ImageUrl = saleleft.SmallPhotoPath;

            saleNew = db.Products.FirstOrDefault(p => p.ProductID == saleMaxID);
            hfSaleNew.Value = saleMaxID.ToString();
            ImgbtnSaleNew.ImageUrl = saleNew.SmallPhotoPath;
        }

        private void karsilastirilacakUrunlerimiz()
        {
            List<Web.Library.Product> karsilastirilacaklar = Web.Library.Compare.CompareTools.GetComparables(Session["myComparable"]);

            int? adet = 0;            
            this.TotalCompareCount = adet=karsilastirilacaklar.Count;
        }

        private void sepettekiUrunlerimiz()
        {
            List<Web.Library.Cart.CartProduct> listemiz = (List<Web.Library.Cart.CartProduct>)Session["myCart"];

            int? urun = Web.Library.Cart.CartTools.TotalProductCaunt(Session["myCart"]);
            this.ProductQuantity = urun;

            decimal? total = Web.Library.Cart.CartTools.TotalProductPrice(Session["myCart"]);
            this.TotalPrice = total;
        }

        public int? ProductQuantity { get; set; } // ürün adedi için
        public decimal? TotalPrice { get; set; } // toplam fiyat için
        public int? TotalCompareCount { get; set; } // karşılaştırılacak ütün sayısı

        // Genel master sayfasında bulunan linkbuttun ve image buttonları genel master command'i içersinde toparladık
        protected void GenelMaster_Command(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "sepet":
                    {
                        Response.Redirect("~/MyCart.aspx");
                    }
                    break;

                case "karsilastirma":
                    {
                        Response.Redirect("~/ComparedProducts.aspx");
                    }
                    break;
                case "arama":
                    {
                        Response.Redirect("~/Search.aspx?AranacakDeger=" + txtArananDeger.Text);
                    }
                    break;
                case "leftSale":
                    {
                        Response.Redirect("~/ProductDetails.aspx?ProductId=" + hfSaleLeft.Value);
                    }
                    break;
                case "newSale":
                    {
                        Response.Redirect("~/ProductDetails.aspx?ProductId=" + hfSaleNew.Value);
                    }
                    break;
            }
        }

        string kullaniciAdi = "admin";
        string sifre = "123";
        protected void LoginButton_Click(object sender, EventArgs e)
        {

        }


    }
}