using FoodRepository.FoodModel;
using FoodRepository.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodRepository
{
    public interface IFoodRepository
    {
        bool CheckUser(LoginDetail loginDetail);
        List<FoodItem> GetFoodDetails();
        User FetchUser(string userName);
        void AddToCart(Cart cartDetail);
        List<Cart> GetCartDetail(int? id);
        void UpdateItemQuantity(Cart cartDetail);
        FoodItem GetFoodDetail(int foodId);
        List<CartItems> FetchCartItem(int userId);
        int? GetNoOfCartItem(int userId);
        string DeleteCartItem(int userId, int FoodId);
        List<PaymentType> GetPaymentMethod();
    }
}
