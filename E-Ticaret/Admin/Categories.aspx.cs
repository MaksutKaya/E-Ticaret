using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// ------------------------------------
using Web.Library;

namespace E_Ticaret.Admin
{
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            MultiView1.ActiveViewIndex = 0;
            CategoryFill();
        }


        private void CategoryFill()
        {
            // -------------------------------------------
            rptList.DataSource = db.Categories.ToList();
            rptList.DataBind();
            // -------------------------------------------            
        }

        private void rptCategoriesFill()
        {
            rptCategories.DataSource = db.Categories.ToList();
            rptCategories.DataBind();

            CategoryFill();
        }

        protected void lbtnCateInsertViews_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            txtCategoryName.Text = null;
            btnEkle.Visible = true;
            btnGuncelle.Visible = false;
        }

        protected void lbtnCateUpdateViews_Click(object sender, EventArgs e)
        {
            rptCategoriesFill();
            MultiView1.ActiveViewIndex = 2;
        }




        E_TicaretDataContext db = new E_TicaretDataContext();

        public int? SelectedCategoryId
        {
            set
            {
                ViewState["SelectedCategoryId"] = value;
            }
            get
            {
                return (int?)ViewState["SelectedCategoryId"];
            }
        }

        protected void RptList_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            CategoryFill();
        }

        protected void rptCategories_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            HiddenField hfId = e.Item.FindControl("hfCategoryId") as HiddenField;

            SelectedCategoryId = Convert.ToInt32(hfId.Value);

            Category selectedCate = db.Categories.FirstOrDefault(sc => sc.CategoryID == SelectedCategoryId); // Category'e ulaşması için -> using'e kütüphanesini ekleyiniz !!!

            txtCategoryName.Text = selectedCate.CategoryName;

            btnEkle.Visible = false;
            btnGuncelle.Visible = true;

            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            Category selectedCate = db.Categories.FirstOrDefault(sc => sc.CategoryID == SelectedCategoryId);

            selectedCate.CategoryName = txtCategoryName.Text;

            db.SubmitChanges();

            //----------------------------
            SelectedCategoryId = null;
            btnEkle.Visible = true;
            btnGuncelle.Visible = false;
            // ---------------------------
            CategoryFill();
            MultiView1.ActiveViewIndex = 0;


        }

        protected void btnSecilenleriSil_Click(object sender, EventArgs e)
        {
            List<Category> silinecekKategoriler = new List<Category>();

            foreach (RepeaterItem rpt in rptCategories.Items)
            {
                CheckBox chk = rpt.FindControl("chkCheck") as CheckBox;

                if (chk.Checked) // veya == true
                {
                    HiddenField hfId = rpt.FindControl("hfCategoryId") as HiddenField;

                    Category silinenCate = db.Categories.FirstOrDefault(sc => sc.CategoryID == Convert.ToInt32(hfId.Value));

                    silinecekKategoriler.Add(silinenCate);
                }
            }

            db.Categories.DeleteAllOnSubmit(silinecekKategoriler);
            db.SubmitChanges();

            MultiView1.ActiveViewIndex = 1;

            CategoryFill();
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            Category cate = new Category();
            cate.CategoryName = txtCategoryName.Text;

            db.Categories.InsertOnSubmit(cate);
            db.SubmitChanges();

            CategoryFill();
            MultiView1.ActiveViewIndex = 0;
        }


    }
}