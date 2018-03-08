using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Web.Library;

namespace E_Ticaret.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        E_TicaretDataContext db = new E_TicaretDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            MultiView1.ActiveViewIndex = 0;
            ddlCateFill();
            ProductFill();
            txtLargePhotoName.Enabled = false;
            txtSmallPhotoName.Enabled = false;
        }

        public int? selectedCateddl { get; set; }

        private void ProductFill()
        {
            List<Product> urunler = (from s in db.Products where s.CategoryID == Convert.ToInt16(ddlListCategoryName.SelectedValue) select s).ToList();
            rptList.DataSource = urunler;
            rptList.DataBind();
        }
        private void rptProductsFill()
        {
            List<Product> urunler = ( from u in db.Products where u.CategoryID == Convert.ToInt16(ddlUpdate.SelectedValue) select u).ToList();
            rptProducts.DataSource = urunler;
            rptProducts.DataBind();
        }

        protected void lbtnProdInsertViews_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;

            ClearAllItem();
            ddlCateFill();


            btnEkle.Visible = true;
            btnGuncelle.Visible = false;
        }

        private void ddlCateFill()
        {
            List<Category> kategoriler = db.Categories.ToList();
            ddlUpdate.Items.Clear();
            ddlCateID.Items.Clear();
            ddlListCategoryName.Items.Clear();
            int i = 0;
            foreach (Category item in kategoriler)
            {
                ddlUpdate.Items.Insert(i, new ListItem(item.CategoryName, item.CategoryID.ToString()));
                ddlListCategoryName.Items.Insert(i, new ListItem(item.CategoryName, item.CategoryID.ToString()));
                ddlCateID.Items.Insert(i, new ListItem(item.CategoryName, item.CategoryID.ToString()));
                i++;
            }
            if (selectedCateddl == null)
            {
                ddlListCategoryName.SelectedIndex = 0;
            }
            else
            {
                int j = 0;
                foreach (ListItem item in ddlListCategoryName.Items)
                {
                    if (item.Value == selectedCateddl.Value.ToString())
                    {
                        ddlListCategoryName.SelectedIndex = j;
                        break;
                    }
                    else
                    {
                        j++;
                    }
                }
            }
        }

        protected void lbtnProdUpdate_Click(object sender, EventArgs e)
        {
            rptProductsFill();
            MultiView1.ActiveViewIndex = 2;
        }

        public int? SelectedProductId
        {
            set
            {
                ViewState["SelectedProductId"] = value;
            }
            get
            {
                return (int?)ViewState["SelectedProductId"];
            }
        }

        protected void rptList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            ProductFill();
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            HiddenField hfId = e.Item.FindControl("hfProductId") as HiddenField;

            SelectedProductId = Convert.ToInt32(hfId.Value);

            Product ProductSelected = db.Products.FirstOrDefault(sc => sc.ProductID == SelectedProductId ); // Category'e ulaşması için -> using'e kütüphanesini ekleyiniz !!!

            txtProductName.Text = ProductSelected.ProductName;
            txtDescription.Text = ProductSelected.Description;
            txtUnitPrice.Text = ProductSelected.UnitPrice.ToString();
            txtUnitsInStock.Text = ProductSelected.UnitsInStock.ToString();
            txtSmallPhotoName.Text = ProductSelected.SmallPhotoPath.ToString();
            txtLargePhotoName.Text = ProductSelected.LargePhotoPath.ToString();

            ddlCateFill();

            foreach (ListItem item in ddlCateID.Items)
            {
                if (item.Value == ProductSelected.CategoryID.ToString())
                {
                    ddlCateID.SelectedValue = ProductSelected.CategoryID.ToString();
                }
            }

            btnEkle.Visible = false;
            btnGuncelle.Visible = true;

            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {

            Product prod = new Product();
            prod.ProductName = txtProductName.Text;
            prod.Description = txtDescription.Text;
            prod.UnitPrice = Convert.ToDecimal(txtUnitPrice.Text);
            prod.UnitsInStock = Convert.ToInt32(txtUnitsInStock.Text);

            prod.SmallPhotoPath = (txtSmallPhotoName.Text == "") ? "images/small/No_Image_Small.jpg" : txtSmallPhotoName.Text;
            prod.LargePhotoPath = (txtLargePhotoName.Text == "") ? "images/large/No_Image_Large.jpg" : txtLargePhotoName.Text;
            prod.CategoryID = Convert.ToInt32(ddlCateID.SelectedValue);

            db.Products.InsertOnSubmit(prod);
            db.SubmitChanges();            
            MultiView1.ActiveViewIndex = 0;

            selectedCateddl = prod.CategoryID;
            ddlCateFill();
            ProductFill();
        }

        private void ClearAllItem()
        {
            txtSmallPhotoName.Text = null;
            txtLargePhotoName.Text = null;
            txtProductName.Text = null;
            txtDescription.Text = null;
            txtUnitPrice.Text = null;
            txtUnitsInStock.Text = null;
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            Product selectedCate = db.Products.FirstOrDefault(sc => sc.ProductID == SelectedProductId);

            selectedCate.ProductName = txtProductName.Text;
            selectedCate.Description = txtDescription.Text;
            selectedCate.UnitPrice = Convert.ToDecimal(txtUnitPrice.Text);
            selectedCate.UnitsInStock = Convert.ToInt32(txtUnitsInStock.Text);
            selectedCate.CategoryID = Convert.ToInt32(ddlCateID.SelectedValue);
            selectedCate.SmallPhotoPath = (txtSmallPhotoName.Text == null) ? "images/small/No_Image_Small.jpg" : txtSmallPhotoName.Text;
            selectedCate.LargePhotoPath = (txtLargePhotoName.Text == null) ? "images/large/No_Image_Large.jpg" : txtLargePhotoName.Text;

            db.SubmitChanges();

            //----------------------------
            SelectedProductId = null;
            btnEkle.Visible = true;
            btnGuncelle.Visible = false;
            // ---------------------------
           
            MultiView1.ActiveViewIndex = 0;
            selectedCateddl = selectedCate.CategoryID.Value;
            ddlCateFill();
            ProductFill();
        }

        protected void btnSecilenleriSil_Click(object sender, EventArgs e)
        {
            List<Product> silinecekUrunler = new List<Product>();

            foreach (RepeaterItem rpt in rptProducts.Items)
            {
                CheckBox chk = rpt.FindControl("chkCheck") as CheckBox;

                if (chk.Checked) // veya == true
                {
                    HiddenField hfId = rpt.FindControl("hfProductId") as HiddenField;

                    Product silinenProd = db.Products.FirstOrDefault(sc => sc.ProductID == Convert.ToInt32(hfId.Value));

                    silinecekUrunler.Add(silinenProd);
                }
            }

            db.Products.DeleteAllOnSubmit(silinecekUrunler);
            db.SubmitChanges();

            MultiView1.ActiveViewIndex = 0;

            ProductFill();

        }


        protected void ddlListCategoryName_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedCateddl = Convert.ToInt32(ddlListCategoryName.SelectedValue);
            ProductFill();
        }

        protected void btnSmallPhotoSec_Click(object sender, EventArgs e)
        {

        }

        protected void btnLargePhotoSec_Click(object sender, EventArgs e)
        {

        }



        protected void btnLargePhotoSil_Click(object sender, EventArgs e)
        {
            txtLargePhotoName.Text = "images/large/No_Image_Large.jpg";
        }

        protected void btnSmallPhotoSil_Click(object sender, EventArgs e)
        {
            txtSmallPhotoName.Text = "images/small/No_Image_Small.jpg";
        }

        protected void ddlUpdate_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedCateddl = Convert.ToInt32(ddlUpdate.SelectedValue);
            rptProductsFill();
        }
    }
}