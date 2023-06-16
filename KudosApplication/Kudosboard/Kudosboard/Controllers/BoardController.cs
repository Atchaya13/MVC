using KudosBoardDatas.KudosboardModel;
using KudosBoardDatas.KudosboardModel.ViewModel;
using KudosService;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static System.Net.WebRequestMethods;

namespace Kudosboard.Controllers
{
    public class BoardController : Controller
    {
        private KudosLogics _IKudostLogic;
        public BoardController(KudosLogics kudos)
        {
            _IKudostLogic = kudos;
        }
        public ActionResult Index()
        {
            List<BoardVM> board = _IKudostLogic.GetBoard();
            return View("Boards",board);
        }
       public ActionResult AddBoard()
        {
            return View();
        }
        public ActionResult FetchOccation()
        {
            var occations = _IKudostLogic.GetOccation();
            if(occations!=null)
            {
                var list = occations.Select(x => new
                {
                    occationID = x.OccationId,
                    occationName = x.Name
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return PartialView("error");
            }
        }
        [HttpPost]
        public ActionResult AddKudos(Kudo kudo)
        {
            string name = kudo.ReceipientName;
            User recepient = _IKudostLogic.CheckRecepient(name);
            if(recepient!=null)
            {

                kudo.CreatedByUserId = Convert.ToInt32(Session["UserId"]);
                int id=  _IKudostLogic.AddKudos(kudo);
                KudoRecipient kudoRecipient = new KudoRecipient();
                kudoRecipient.KudoId = id;
                kudoRecipient.UserId = recepient.Id;
                _IKudostLogic.AddReceipient(kudoRecipient);
                ViewBag.message = "Successfully Added";
                ModelState.Clear();
                //return RedirectToAction("BoardView");


            }
            else
            {
                ViewBag.failureMessage = "Recepient name not Add!!!";
                
             
            }
            return View("AddBoard");

        }
        public ActionResult BoardView(int id)
        {
            Session["KudoId"] = id;
            Kudo kudo = _IKudostLogic.GetKudoTitle(id);
            Session["Tittle"] = kudo.Title;
          List<Post> post=  _IKudostLogic.GetPosts(id);
            return View(post);
        }
        public ActionResult AddPost()
        {
            return View();
        }
        [HttpPost]
        public  ActionResult AddPost(Post post)
        {
            if(post.ImageFile!=null)
            {
                string fileName = Path.GetFileNameWithoutExtension(post.ImageFile.FileName);
                string extention = Path.GetExtension(post.ImageFile.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extention;
                string UploadPath = ConfigurationManager.AppSettings["FilePath"].ToString();
                post.ImageName = UploadPath + fileName;
                fileName = Path.Combine(Server.MapPath(UploadPath), fileName);
                post.ImageFile.SaveAs(fileName);
                Byte[] bytes = null;
                Stream fs = post.ImageFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                bytes = br.ReadBytes((Int32)fs.Length);
                post.ImageData = bytes;
            }
           
            post.PostOwnerId = Convert.ToInt32(Session["UserId"]);
            post.KudoId= Convert.ToInt32(Session["KudoId"]);
            _IKudostLogic.AddPost(post);
            ViewBag.successMessage = "Post Successfully Added";
            ModelState.Clear();
            return View();
        }
    }
}