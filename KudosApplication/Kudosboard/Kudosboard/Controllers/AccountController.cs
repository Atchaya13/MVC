using KudosBoardDatas.KudosboardModel.ViewModel;
using KudosBoardDatas.KudosboardModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KudosService;

namespace Kudosboard.Controllers
{
    public class AccountController : Controller
    {
        private KudosLogics _IKudostLogic;
        public AccountController(KudosLogics kudos)
        {
            _IKudostLogic = kudos;
        }
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(LoginDetail loginDetail)
        {
            Session["UserName"] = loginDetail.UserName;
            User isValidUser = _IKudostLogic.CheckUser(loginDetail);
            if(isValidUser!=null)
            {
                Session["UserId"] = isValidUser.Id;
                return RedirectToRoute("LandingPage");
            }
            else
            {
                ModelState.AddModelError("Error", "User not found!!!");
                return View(loginDetail);
            }
        }
    }
}