using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Library.Compare
{
    public class CompareTools
    {
        // ----------------------------------------------------------------------------
        // Karşılaştıtılacaklar listesindeki ürünleri çekme
        // ----------------------------------------------------------------------------
        public static List<Product> GetComparables(object value)
        {
            if (value == null)
            {
                return new List<Product>();
            }
            else
            {
                return (List<Product>)value;
            }
        }

        // ----------------------------------------------------------------------------
        // Karşılaştırılacaklar listesine ürün ekleme
        // ----------------------------------------------------------------------------
        public static List<Product> AddCompare(object destinationArea, Product addItem)
        {
            List<Product> currentItems;
            if (destinationArea == null)
            {
                currentItems = new List<Product>();
            }
            else
            {
                currentItems = (List<Product>)destinationArea;
            }

            if (currentItems == null)
            {
                currentItems.Add(addItem);
                return currentItems;
            }
            else
            {
                foreach (Product item in currentItems)
                {
                    if (item.ProductID == addItem.ProductID)
                    {                        
                        return currentItems;
                    }
                }
                currentItems.Add(addItem);
                return currentItems;
            }

        }

        // ----------------------------------------------------------------------------
        // Karşılaştırılacaklar listesinden ürün silme
        // ----------------------------------------------------------------------------
        public static List<Product> RemoveCompare(object destinationArea, Product addItem)
        {
            List<Product> currentItems = GetComparables(destinationArea);
            currentItems.Remove(addItem);
            return currentItems;
        }
    }
}
