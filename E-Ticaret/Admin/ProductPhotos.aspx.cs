using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;

/* ----------------------------------------------------------- */
using System.Web.UI.WebControls;



using Web.Library;
namespace E_Ticaret.Admin
{
    public partial class ProductPhotos : System.Web.UI.Page
    {
        E_TicaretDataContext db = new E_TicaretDataContext();

        public string fileNameSmall { get; set; }
        public string fileNameLarge { get; set; }
        
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
            if (IsPostBack) return;
            MultiView1.ActiveViewIndex = 0;
            ddlPhotoProductName.Enabled = false;
            ItemsEnableFalse();
            categoryFill();
        }

        //Butonların Click Özellikleri
        #region Buton Click'leri

        protected void BtnEkle_Click(object sender, EventArgs e)
        {
            photoSmallFill();
            photoLargeFill();
        } 
        #endregion

        // dropDowsnList Change
        #region dropDowsnList Change 
        protected void ddlPhotoCategoryName_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlPhotoProductName.Items.Clear();

            if (ddlPhotoCategoryName.SelectedIndex != 0)
            {
                ddlPhotoProductName.Enabled = true;
                ddlPhotoProductName.Items.Add("Urun Seciniz");
                List<Product> urunler = (from s in db.Products where s.CategoryID == Convert.ToInt16(ddlPhotoCategoryName.SelectedValue) select s).ToList();

                foreach (Product item in urunler)
                {
                    ddlPhotoProductName.Items.Add(new ListItem(item.ProductName, item.ProductID.ToString()));
                }
            }
            else
            {
                ddlPhotoProductName.Enabled = false;
                imgClear();
                ItemsEnableFalse();
            }
        }

        protected void ddlPhotoProductName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPhotoProductName.SelectedIndex != 0)
            {
                Product urun = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt16(ddlPhotoProductName.SelectedValue));

                hfSelectProductID.Value = urun.ProductID.ToString();

                lblSmallPhoto.Text = urun.SmallPhotoPath.ToString();
                lblLargePhoto.Text = urun.LargePhotoPath.ToString();

                imageFill();
                ItemsEnableTrue();
            }
            else
            {
                imgClear();
                ItemsEnableFalse();
            }
        }
        #endregion

        // Photo ve Category Fill Metotları
        #region Photo ve Category Metotları

        private void categoryFill()
        {
            ddlPhotoCategoryName.Items.Clear();
            ddlPhotoCategoryName.Items.Add("Kategori Seciniz");
            List<Category> kategoriler = db.Categories.ToList();
            foreach (Category item in kategoriler)
            {
                ddlPhotoCategoryName.Items.Add(new ListItem(item.CategoryName, item.CategoryID.ToString()));
            }
            ddlPhotoCategoryName.SelectedIndex = 0;
        }

        private void photoLargeFill()
        {
            Product urun = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt16(hfSelectProductID.Value));
            fileNameLarge = urun.LargePhotoPath.Substring(13, urun.LargePhotoPath.Length - 13);
            if (fuLargePhoto.HasFile)
            {

                if (fuLargePhoto.PostedFile.ContentType == "image/jpeg" || fuLargePhoto.PostedFile.ContentType == "image/png")
                {
                    if (fuLargePhoto.PostedFile.ContentLength < 1024000)
                    {
                        fileNameLarge = Path.GetFileName(fuLargePhoto.FileName);

                        fuLargePhoto.PostedFile.SaveAs(Server.MapPath("~/images/large/") + fileNameLarge.ToString());
                        lblUyari.Text = "";

                        urun.LargePhotoPath = "images/large/" + fileNameLarge.ToString();
                        lblLargePhoto.Text = urun.LargePhotoPath;
                        db.SubmitChanges();

                        // eski resimi siliyor
                        if (ImgLargePhoto.ImageUrl != "~/images/large/No_Image_Large.jpg" & ImgLargePhoto.ImageUrl != "" && fuLargePhoto.FileName != "")
                        {
                            File.Delete(Server.MapPath(ImgLargePhoto.ImageUrl));
                        }

                    }
                    else
                    {
                        lblUyari.Text = "Resim 100 kb'dan büyüktür...";
                    }
                }
                else
                {
                    lblUyari.Text = "Resim .jpeg/.png dosyası olmalıdır";
                }
            }

            // image i doldurma
            if (fileNameLarge == "")
            {
                ImgLargePhoto.ImageUrl = "~/images/large/No_Image_Large.jpg";

            }
            else
            {
                ImgLargePhoto.ImageUrl = "~/images/large/" + fileNameLarge.ToString();
            }
        }

        private void photoSmallFill()
        {
            Product urun = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt16(hfSelectProductID.Value));
            fileNameSmall = urun.SmallPhotoPath.Substring(13, urun.SmallPhotoPath.Length - 13);
            if (fuSmallPhoto.HasFile)
            {

                if (fuSmallPhoto.PostedFile.ContentType == "image/jpeg" || fuSmallPhoto.PostedFile.ContentType == "image/png")
                {
                    if (fuSmallPhoto.PostedFile.ContentLength < 1024000)
                    {
                        fileNameSmall = Path.GetFileName(fuSmallPhoto.FileName);

                        fuSmallPhoto.PostedFile.SaveAs(Server.MapPath("~/images/small/") + fileNameSmall.ToString());
                        lblUyari.Text = "";

                        urun.SmallPhotoPath = "images/small/" + fileNameSmall.ToString();
                        lblSmallPhoto.Text = urun.SmallPhotoPath;
                        db.SubmitChanges();

                        // eski resimi siliyor
                        if (ImgSmallPhoto.ImageUrl != "~/images/small/No_Image_Small.jpg" & ImgSmallPhoto.ImageUrl != "" && fuSmallPhoto.FileName != "")
                        {
                            File.Delete(Server.MapPath(ImgSmallPhoto.ImageUrl));
                        }

                    }
                    else
                    {
                        lblUyari.Text = "Resim 100 kb'dan büyüktür...";
                    }
                }
                else
                {
                    lblUyari.Text = "Resim .jpeg/.png dosyası olmalıdır";
                }
            }

            // image i doldurma
            if (fileNameSmall == "")
            {
                ImgSmallPhoto.ImageUrl = "~/images/small/No_Image_Small.jpg";

            }
            else
            {
                ImgSmallPhoto.ImageUrl = "~/images/small/" + fileNameSmall.ToString();
            }
        }
        #endregion

        // Clear ve Enable Metotları
        #region Clear ve Enable Metotları
        private void imageFill()
        {
            ImgSmallPhoto.ImageUrl = "~/" + lblSmallPhoto.Text;
            ImgLargePhoto.ImageUrl = "~/" + lblLargePhoto.Text;
        }
        private void ItemsEnableTrue()
        {
            BtnEkle.Enabled = true;
            fuSmallPhoto.Enabled = true;
            fuLargePhoto.Enabled = true;
        }
        private void ItemsEnableFalse()
        {
            BtnEkle.Enabled = false;
            fuSmallPhoto.Enabled = false;
            fuLargePhoto.Enabled = false;
        }
        private void imgClear()
        {
            ImgSmallPhoto.ImageUrl = null;
            ImgLargePhoto.ImageUrl = null;
            lblSmallPhoto.Text = "";
            lblLargePhoto.Text = "";
        }
        #endregion
    }
}