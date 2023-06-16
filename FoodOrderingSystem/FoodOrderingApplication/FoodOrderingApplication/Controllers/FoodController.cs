using FoodAppLogics;
using FoodRepository.FoodModel;
using FoodRepository.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;

namespace FoodOrderingApplication.Controllers
{
    public class FoodController : Controller
    {
        private FoodServiceLayer _IFoodtLogic;
        public FoodController(FoodServiceLayer foodItem)
        {
            _IFoodtLogic = foodItem;
        }
        
        public ActionResult Index()
        {
            bool foods =_IFoodtLogic.GetFoodDetails();
            if(foods)
            {
                List<FoodItem> foodItems = _IFoodtLogic.FetchFoodDetail();
                return View(foodItems);
            }
            else
            {
                return PartialView("Error");
            }
            
        }
        [HttpGet]
        public ActionResult AddToCart(int? id)
        {
            int userId = Convert.ToInt32(Session["userId"]);
            bool flag = true;
            Cart cartDetail = new Cart();
            bool food = _IFoodtLogic.CheckFood(Convert.ToInt32(id));
            if (food)
            {
                FoodItem foodItem = _IFoodtLogic.GetFoodDetail();
                cartDetail.FoodId = id;
                cartDetail.UserId = (int?)Session["UserId"];
                cartDetail.Quantity = 1;
                cartDetail.Amount = (double?)foodItem.Price;
                List<Cart> cartItem = _IFoodtLogic.GetCartDetail(userId);

                foreach (var Item in cartItem)
                {
                    if (Item.UserId == cartDetail.UserId && Item.FoodId == cartDetail.FoodId)
                    {
                        flag = false;
                        int cartId = Item.CartId;
                        cartDetail.CartId = cartId;
                        cartDetail.Quantity = Item.Quantity + 1;
                        cartDetail.Amount = Item.Amount + Convert.ToDouble(foodItem.Price);
                        _IFoodtLogic.UpdateItemQuantity(cartDetail);
                        break;
                        
                    }
                  
                }
                if (flag)
                {
                    _IFoodtLogic.AddToCart(cartDetail);
                    string message = "Succesfully Added this Item To Cart";
                    return Json(message,JsonRequestBehavior.AllowGet);
                }
                else
                {
                    string message = "Succesfully Added One More Item To Cart";
                    return Json(message,JsonRequestBehavior.AllowGet);
                }
            }
            else
            {
                return PartialView("Error");
            }
           
        }
        public ActionResult CartItems()
        {
            int userId = Convert.ToInt32(Session["userId"]);
             List<CartItems> foodItems= _IFoodtLogic.FetchCartItem(userId);
            if(foodItems!=null)
            {
                return View(foodItems);
            }
            else
            {
                return PartialView("Error");
            }
           
        }
        public ActionResult GetNoOfCartItem()
        {
           int userId = Convert.ToInt32(Session["userId"]); 
           int? noOfItem= _IFoodtLogic.GetNoOfCartItem(userId);
           return Json(noOfItem, JsonRequestBehavior.AllowGet);
        }
        public ActionResult RemoveFromCart(int FoodId)
        {
            int userId = Convert.ToInt32(Session["userId"]);
            string message = _IFoodtLogic.DeleteCartItem(userId, FoodId);
            if(message.Equals("Successfully Deleted") )
            {
                return Json("Successfully Deleted", JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json("Ooops!!! Can not Delete this item", JsonRequestBehavior.AllowGet);
            }
           
        }
        public ActionResult UpdateFromCart(int? FoodId,string operation)
        {
            int userId = Convert.ToInt32(Session["userId"]);
            List<Cart> cartItem = _IFoodtLogic.GetCartDetail(userId);
            bool food = _IFoodtLogic.CheckFood(Convert.ToInt32(FoodId));
            FoodItem foodItem = _IFoodtLogic.GetFoodDetail();
            Cart cartDetail = new Cart();
            foreach (var Item in cartItem)
            {
                if (Item.UserId == userId && Item.FoodId == FoodId)
                {
                    int cartId = Item.CartId;
                    cartDetail.CartId = cartId;
                   
                    cartDetail.UserId = userId;
                    if(operation.Equals("minus"))
                    {
                        cartDetail.Amount = Item.Amount - Convert.ToDouble(foodItem.Price);
                        cartDetail.Quantity = Item.Quantity - 1;
                    }
                    else
                    {
                        cartDetail.Quantity = Item.Quantity + 1;
                        cartDetail.Amount = Item.Amount + Convert.ToDouble(foodItem.Price);
                    }
                    cartDetail.FoodId = FoodId;
                    _IFoodtLogic.UpdateItemQuantity(cartDetail);
                    break;
                }
            }
            return Json("Success", JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetPaymentMethod()
        {
            bool paymentTypes = _IFoodtLogic.GetPaymentMethod();
            if(paymentTypes)
            {
               List<PaymentType> FetchPaymentType = _IFoodtLogic.FetchPaymentType();
               var list= FetchPaymentType.Select(x => new
                {
                    PayID = x.PaymentId,
                    PaymentName = x.Name
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return PartialView("Error");
            }
        }
        public ActionResult StoreOrder(int paymentType,string Address)
        {
            return Json("Success", JsonRequestBehavior.AllowGet);
        }
        public ActionResult SummaryPage()
        {
            int userId = Convert.ToInt32(Session["userId"]);
            List<CartItems> foodItems = _IFoodtLogic.FetchCartItem(userId);
            if (foodItems != null)
            {
                return View(foodItems);
            }
            else
            {
                return PartialView("Error");
            }

        }
    }
}