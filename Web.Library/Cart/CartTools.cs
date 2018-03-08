using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Library.Cart
{
    public class CartTools
    {
        // ----------------------------------------------------------------------------
        // ürünleri getir metodu
        // ----------------------------------------------------------------------------
        public static List<CartProduct> GetAllCartProduct(object value)
        {
            if (value == null) // sepette seçili ürün yoksa
            {
                return new List<CartProduct>();
            }
            else
            {
                return (List<CartProduct>)value;
            }
        }

        // ----------------------------------------------------------------------------
        // sepete ekle
        // ----------------------------------------------------------------------------
        public static List<CartProduct> AddItem(CartProduct newItem, object value)
        {
            List<CartProduct> currentItems = GetAllCartProduct(value);
            if (currentItems == null)
            {
                currentItems.Add(newItem);
                return currentItems;
            }
            else
            {
                foreach (CartProduct item in currentItems)
                {
                    if (item.ProductID == newItem.ProductID)
                    {
                        item.Quantity += newItem.Quantity;
                        return currentItems;
                    }

                }
                currentItems.Add(newItem);
                return currentItems;
            }
        }

        // ----------------------------------------------------------------------------
        // sepetten çıkar 
        // ----------------------------------------------------------------------------
        public static List<CartProduct> RemoveItem(CartProduct newItem, object value)
        {
            List<CartProduct> currentItems = GetAllCartProduct(value);
            currentItems.Remove(newItem);
            return currentItems;
        }

        // ----------------------------------------------------------------------------
        // sepete eklenen ürün sayısı 
        // ----------------------------------------------------------------------------
        public static int? TotalProductCaunt(object value)
        {
            List<CartProduct> curenntItems = GetAllCartProduct(value);
            int? result = 0;
            foreach (CartProduct cur in curenntItems)
            {
                result += cur.Quantity;
            }
            return result;
        }

        // ----------------------------------------------------------------------------
        // toplam fiyat
        // ----------------------------------------------------------------------------
        public static decimal? TotalProductPrice(object value)
        {
            List<CartProduct> curenntItems = GetAllCartProduct(value);
            decimal? result = 0;
            foreach (CartProduct cur in curenntItems)
            {
                result += cur.Quantity * cur.UnitPrice;
            }
            return result;
        }
    }
}
