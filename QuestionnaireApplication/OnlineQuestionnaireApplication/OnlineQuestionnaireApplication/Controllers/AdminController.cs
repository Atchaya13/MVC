using OnlineQuestionnaireApplication.Models;
using OnlineQuestionnaireApplication.Repository;
using OnlineQuestionnaireApplication.ViewMode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineQuestionnaireApplication.Controllers
{
    public class AdminController : Controller
    {
        private IRepo _Irepo;
        public AdminController(IRepo iuser)
        {
            _Irepo = iuser;
        }

        public ActionResult Index()
        {
            List<Results> adminView = _Irepo.ShowResult();
            return View("AdminPage",adminView);
        }
    }
}