using AssertLogics;
using AssertManagementRepository.AssertModel;
using AssertManagementRepository.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Mvc;


namespace AssertManagementSystem.Views
{
    public class AssertController : Controller
    {
        private IAssertLogic _IAssertLogic;
        public AssertController(IAssertLogic assert)
        {
            _IAssertLogic = assert;
        }
        public ActionResult Index()
        {
            int check;
            bool assets = _IAssertLogic.CheckAsserts();
            if (assets)
            {
                List<Asset> assetList = _IAssertLogic.FetchAsset();
                foreach(var i in assetList)
                {
                    check = i.TotalCount;
                }
                List<SelectListItem> ObjList = new List<SelectListItem>();
                ViewBag.list = ObjList;
                //ViewBag.openPopUp ="nn";
                return View("DisplayAsserts", assetList);
            }
            return PartialView("Error");
        }
        public ActionResult AddAsset()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddAsset(AddAssetView addAssetView)
        {
            addAssetView.Asset.BrandId = 1;
            addAssetView.Asset.TotalCount = addAssetView.Asset.AvailableCount;
            addAssetView.Asset.CreatedOn = DateTime.Now;
            _IAssertLogic.AddAsset(addAssetView);
            ViewBag.AddSuccess = "Data was Successfully added";
            ModelState.Clear();
            return View();
        }
        public ActionResult UpdateView(int? id)
        {
           Asset asset= _IAssertLogic.FetchAssetDetail(id);
           return View(asset);
        }
        [HttpPost]
        public ActionResult UpdateView(Asset asset)
        {
            asset.BrandId = 1;
            _IAssertLogic.UpdateAsset(asset);
            ViewBag.UpdateSuccess = "Data was Successfully updated";
            return RedirectToAction("Index");
           
        }
        public ActionResult DeleteDetail(int? assetId)
        {
            _IAssertLogic.DeleteAsset(assetId);
            return RedirectToAction("Index");
           
        }
        public void IncreseTotalQuantity(int? assetId)
        {
            _IAssertLogic.IncreseTotalQuantity(assetId);
           
       
        }
        public void DecreaseTotalQuantity(int? assetId)
        {
            _IAssertLogic.DecreaseTotalQuantity(assetId);
          

        }
        public ActionResult FetchUserList(int? id)
        {
            List<User> userList = _IAssertLogic.FetchUser(id);
            List<SelectListItem> ObjList = userList.ConvertAll(a =>
			{
				return new SelectListItem()
				{
					Text = a.FirstName.ToString(),
					Value = a.Id.ToString()
				};
			});
            ViewBag.openPopUp = "open Pop Up";
			ViewBag.list = ObjList;
            //return RedirectToAction("Index");
            bool assets = _IAssertLogic.CheckAsserts();
            if (assets)
            {
                List<Asset> assetList = _IAssertLogic.FetchAsset();
                return View("DisplayAsserts", assetList);
            }
            return PartialView("Error");
        }
        public ActionResult FetchUserListt(int? id)
        {
            List<User> userList = _IAssertLogic.FetchUser(id);
            Array userArr = userList.ToArray();
            //return Json(userArr, JsonRequestBehavior.AllowGet);
            // return Json(new {prop1=userList})
            return this.Json(
           new
           {
               Result = (from obj in userList select new { Id = obj.Id, Name = obj.FirstName })
           }
           , JsonRequestBehavior.AllowGet
           );
        }
        public ActionResult FetchUserList1(int? id)
        {
            List<User> userList = _IAssertLogic.FetchUser(id);
            List<SelectListItem> ObjList = userList.ConvertAll(a =>
            {
                return new SelectListItem()
                {
                    Text = a.FirstName.ToString(),
                    Value = a.Id.ToString()

                };
            });
            ViewBag.openPopUp = "open Pop Up";
            ViewBag.list = ObjList;
            // return RedirectToAction("Index");
            bool assets = _IAssertLogic.CheckAsserts();
            if (assets)
            {
                List<Asset> assetList = _IAssertLogic.FetchAsset();
                return View("DisplayAsserts", assetList);
            }
            return PartialView("Error");
        }
        [HttpGet]
        public void AssignResourse(int? value,int? product)
        {
            bool result = _IAssertLogic.AssignAsset(value, product);
            if(result)
            {
                ViewBag.assetAdded = "asset added";
            }
           
        }

	}
}