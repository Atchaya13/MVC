using FoodRepository;
using FoodRepository.FoodModel;
using FoodRepository.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodAppLogics
{
    public class FoodServiceLayer:IFoodServiceLayer
    {
        private FoodsRepository _IFoodData;
        public FoodServiceLayer(FoodsRepository foodItem)
        {
            _IFoodData = foodItem;
        }
        public static List<FoodItem> foods;
        public static FoodItem food;
        public static List<PaymentType> paymentTypes;
        public bool CheckUser(LoginDetail loginDetail)
        {
            bool isValidUser=_IFoodData.CheckUser(loginDetail);
            if(isValidUser)
            {
                return true;
            }
            else
            {
                return false;
            }
           
        }
        public bool GetFoodDetails()
        {
            foods =_IFoodData.GetFoodDetails();
            if(foods!=null)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }
        public List<FoodItem> FetchFoodDetail()
        {
            return foods;
        }
        public User FetchUser(string userName)
        {
          User user=  _IFoodData.FetchUser(userName);
           return user;
        }
       public void AddToCart(Cart cartDetail)
        {
            if(cartDetail!=null)
            {
                _IFoodData.AddToCart(cartDetail);
            }
        }
        public List<Cart> GetCartDetail(int? id)
        {
           List<Cart> cartItems= _IFoodData.GetCartDetail(id);
           return cartItems;
        }
        public void UpdateItemQuantity(Cart cartDetail)
        {
            _IFoodData.UpdateItemQuantity(cartDetail);
        }
        public bool CheckFood(int foodId)
        {
            food= _IFoodData.GetFoodDetail(foodId);
            if(food!=null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public FoodItem GetFoodDetail()
        {
            return food;
        }
        public List<CartItems> FetchCartItem(int userId)
        {
            List<CartItems> cartItems = _IFoodData.FetchCartItem(userId);
            return cartItems;
        }
        public int? GetNoOfCartItem(int userId)
        {
           int? noOfItem= _IFoodData.GetNoOfCartItem(userId);
            if(noOfItem!=null)
            {
                return noOfItem;
            }
            else
            {
                return 0;
            }
        }
       public string DeleteCartItem(int userId, int FoodId)
        {
            string message = _IFoodData.DeleteCartItem(userId, FoodId);
            return message;
        }
        public bool GetPaymentMethod()
        {
            paymentTypes = _IFoodData.GetPaymentMethod();
            if(paymentTypes!=null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public List<PaymentType> FetchPaymentType()
        {
            return paymentTypes;
        }
    }
}
