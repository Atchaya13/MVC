using FoodRepository.FoodModel;
using FoodRepository.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodRepository
{
    public class FoodsRepository : IFoodRepository
    {
        FoodOrderingApplicationEntities1 foodOrderingApplicationEntities = new FoodOrderingApplicationEntities1();
        public bool CheckUser(LoginDetail loginDetail)
        {
            if (foodOrderingApplicationEntities.Users.Any(x => x.UserName == loginDetail.UserName))
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        public List<FoodItem> GetFoodDetails()
        {
            List<FoodItem> foods = foodOrderingApplicationEntities.FoodItems.ToList();
            return foods;
        }
        public User FetchUser(string userName)
        {
            var userData = foodOrderingApplicationEntities.Users.Where(x => x.UserName == userName).FirstOrDefault();
            return userData;
        }
        public void AddToCart(Cart cartDetails)
        {
            foodOrderingApplicationEntities.Carts.Add(cartDetails);
            try
            {
                foodOrderingApplicationEntities.SaveChanges();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                //throw new Exception(exception);
            }
        }
        public List<Cart> GetCartDetail(int? id)
        {
            List<Cart> carts = foodOrderingApplicationEntities.Carts.Where(x => x.UserId == id).ToList();
            return carts;
        }
        public void UpdateItemQuantity(Cart cartDetail)
        {
            foodOrderingApplicationEntities.Carts.AddOrUpdate(cartDetail);
            try
            {
                foodOrderingApplicationEntities.SaveChanges();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
            }
        }
        public FoodItem GetFoodDetail(int foodId)
        {
            var foodData = foodOrderingApplicationEntities.FoodItems.Where(x => x.Id == foodId).FirstOrDefault();
            return foodData;
        }
        public List<CartItems> FetchCartItem(int userId)
        {
            var cartItems = foodOrderingApplicationEntities.FoodItems.Join(foodOrderingApplicationEntities.Carts, food => food.Id, cartItem => cartItem.FoodId, (food, cartItem) => new { food, cartItem }).Where(x => x.cartItem.UserId == userId).Select(item => new
            {
                FoodId=item.food.Id,
                FoodName = item.food.Name,
                Price = item.cartItem.Amount,
                Quantity = item.cartItem.Quantity
            }).ToList();
            List<CartItems> cartItemList = new List<CartItems>();
            foreach (var item in cartItems)
            {
                cartItemList.Add(new CartItems() { FoodId= item.FoodId, FoodName = item.FoodName, Price = (float)item.Price, Quantity = (int)item.Quantity });
            }
            return cartItemList;
        }
        public int? GetNoOfCartItem(int userId)
        {
            var noOfItems = (from item in foodOrderingApplicationEntities.Carts
                             where item.UserId==userId
                             group item by item.UserId into items
                             select 
                             
                                  items.Sum(item => item.Quantity)
                             ).FirstOrDefault();
            return noOfItems;
        }
        public string DeleteCartItem(int userId,int foodId)
        {
            string failureMessage = "Deletion Failed";
            var deleteItem = foodOrderingApplicationEntities.Carts.Where(x => x.UserId == userId&&x.FoodId==foodId).FirstOrDefault();
            if(deleteItem!=null)
            {
                try
                {
                    var cartItem = foodOrderingApplicationEntities.Carts.Find(deleteItem.CartId);
                    if (cartItem != null)
                    {
                        foodOrderingApplicationEntities.Carts.Remove(cartItem);
                        try
                        {
                            string message = "Successfully Deleted";
                            foodOrderingApplicationEntities.SaveChanges();
                            return message;
                        }
                        catch (Exception exception)
                        {
                            Console.WriteLine(exception);
                            return failureMessage;
                        }

                    }
                    else
                    {
                        return failureMessage;
                    }
                }
                catch(Exception exception)
                {
                    Console.WriteLine(exception);
                    return failureMessage;
                }
            }
            else
            {
                return failureMessage;
            }
        }
        public List<PaymentType> GetPaymentMethod()
        {
            List<PaymentType> paymentTypes = foodOrderingApplicationEntities.PaymentTypes.ToList();
            return paymentTypes;
        }
    }
}
