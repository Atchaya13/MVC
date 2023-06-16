using FoodRepository.FoodModel;
using FoodRepository.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodAppLogics
{
    public interface IFoodServiceLayer
    {
        bool CheckUser(LoginDetail loginDetail);
        bool GetFoodDetails();
        List<FoodItem> FetchFoodDetail();
        User FetchUser(string userName);
        void AddToCart(Cart cartDetail);
        List<Cart> GetCartDetail(int? id);
        void UpdateItemQuantity(Cart cartDetail);
        bool CheckFood(int foodId);
        FoodItem GetFoodDetail();
        List<CartItems> FetchCartItem(int userId);
        int? GetNoOfCartItem(int userId);
        string DeleteCartItem(int userId, int FoodId);
        bool GetPaymentMethod();
        List<PaymentType> FetchPaymentType();
    }
}
