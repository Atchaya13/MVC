
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using BusinessLayer;
using Model;

namespace LayerSeprationDemo.Controllers
{
    public class LibraryController : Controller
    {
       
        static Book book;
        BusinessLaye businessLaye = new BusinessLaye();
        public ActionResult Index()
        {
            return RedirectToRoute("DetailsPage");
        }
        public ActionResult DisplayBooks()
        {
            List<Book> books = businessLaye.GetBooksDetail();
            return View(books);
        }
        public ActionResult AddBook()
        {
            return RedirectToRoute("AddBook");
        }
        public ActionResult AddNewBook()
        {
            return View();
        }
        [HttpPost]
        public ActionResult StoreBook(Book book)
        {
            if (!ModelState.IsValid)
                return View("AddNewBook",book);
            businessLaye.AddBook(book);
            return RedirectToAction("DisplayBooks");
        }

        [HttpGet]
        public JsonResult DeleteDetail(int? queryString)
        {
            businessLaye.DeleteBook(queryString);
            //return View("DisplayBooks");
            return Json(new { fff = "test"});
        }
        
        public ActionResult UpdateView(int? id)
        {
            book= businessLaye.FetchUpdateDetail(id);
            return RedirectToRoute("UpdateView");
        }
        
        public ActionResult UpdateBook()
        {
            return View(book);
        }
        [HttpPost]
        public ActionResult UpdateBookDetails(Book book)
        {
            businessLaye.UpdateDetail(book);
            return RedirectToAction("DisplayBooks");
        }
    }
}