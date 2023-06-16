using FoodAppLogics;
using FoodRepository.FoodModel;
using FoodRepository.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FoodOrderingApplication.Controllers
{
    public class AccountController : Controller
    {
        private FoodServiceLayer _IFoodtLogic;
        public AccountController(FoodServiceLayer foodItem)
        {
            _IFoodtLogic = foodItem;
        }
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(LoginDetail loginDetail)
        {
            Session["UserName"] = loginDetail.UserName;
            bool isValidUser=_IFoodtLogic.CheckUser(loginDetail);
            if(isValidUser)
            {
                User user = _IFoodtLogic.FetchUser(loginDetail.UserName);
                if(user!=null)
                {
                    Session["UserId"] = user.Id;
                }
                return RedirectToRoute("LandingPage");
            }
            else
            {
                ModelState.AddModelError("Error", "User not found!!!");
                return View(loginDetail);
            }
          
        }
        public ActionResult LogOut()
        {

            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();

            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-10);
            }

            if (Request.Cookies["AuthenticationToken"] != null)
            {
                Response.Cookies["AuthenticationToken"].Value = string.Empty;
                Response.Cookies["AuthenticationToken"].Expires = DateTime.Now.AddMonths(-10);
            }

            return View("Index");
        }
    }
}