using OnlineQuestionnaireApplication.Models;
using OnlineQuestionnaireApplication.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineQuestionnaireApplication.Controllers
{
    public class AccountController : Controller
    {
        private IRepo _Irepo;
        public AccountController(IRepo iuser)
        {
            _Irepo = iuser;
        }
        public ActionResult FirstPage()
        {
            return RedirectToRoute("IndexPage");
        }
        public ActionResult Index()
        {
            return View();
        }
        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult Index(LoginDetail loginDetail)
        {
            if (!ModelState.IsValid)
                return View(loginDetail);
            UserDetail userDetail = _Irepo.GetUserDetail(loginDetail.Email);
            if(userDetail!=null)
            {
                Session["Email"] = loginDetail.Email;
                Session["userName"] = userDetail.Name;
                Session["userId"] = userDetail.UserId;
                if (userDetail.Role == "Student")
                {
                    return RedirectToRoute("StudentPage");
                }
                else if (userDetail.Role == "Admin")
                {
                    return RedirectToRoute("AdminPage");
                }
            }
            else
            {
                ViewBag.invalidUser = "Invalid User";
               
            }
            return View();


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

            return RedirectToRoute("LogOut");
        }
    }
}