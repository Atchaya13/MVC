using FoodRepository.FoodModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodRepository.ViewModel
{
    public class CartItems
    {
        public int FoodId { get; set; }
        public string FoodName { get; set; }
        public float Price { get; set; }
        public int Quantity { get; set; }
    }
}
