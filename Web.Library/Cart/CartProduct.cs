using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Library.Cart // Sepet
{
    // önce bu class ı tanımladık ardından carttool u tanımladık
    public class CartProduct // Sepetteki ürün bilgilerimiz ...
    {
        public Product selectedProduct { get; set; }
        public int ProductID { get { return selectedProduct.ProductID; } }
        public String ProductName { get { return selectedProduct.ProductName; } }
        public decimal? UnitPrice { get { return selectedProduct.UnitPrice; } }
        public int? UnitsInStok { get { return selectedProduct.UnitsInStock; } }
        public String SmallPhotoPath { get { return selectedProduct.SmallPhotoPath; } }
        public int Quantity { get; set; } // seper adet miktarı
    }
}
