using AssertManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AssertManagementSystem.Controllers
{
    public class AccountController : Controller
    {
        
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(LoginDetail loginDetail)
        {
            if(!ModelState.IsValid)
            {
                return View(loginDetail);
            }
             return RedirectToAction("Index","Assert");
            
        }


    }
}