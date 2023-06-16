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

    public class StudentController : Controller
    {
    
        private IRepo _Irepo;
        public StudentController(IRepo iuser)
        {
            _Irepo = iuser;
        }
        static Question question = new Question();
        public ActionResult Index()
        {
            int id = Convert.ToInt32(Session["userId"]);
            string email = Convert.ToString(Session["Email"]);
            bool noOfQuestion = _Irepo.TestEnd(id);
            if(noOfQuestion)
            {
                AnswerDetail answerDetail = new AnswerDetail();
                int? result= _Irepo.ResultCalc(id);
                ResultDetail resultDetail = new ResultDetail();
                resultDetail.UserId = id;
                resultDetail.Score = result;
                var totalTime = _Irepo.AddTime(id);
                resultDetail.TimeTaken = totalTime;
                _Irepo.UpdateMark(resultDetail);
                return RedirectToRoute("SummaryPage");
            }
            question = _Irepo.FillQuestion(id);
            bool value = _Irepo.CheckQuestion(question, id);
            if(value)
            {
                string questionSeo;
                string fullQuestion = question.QuestionText;
                if(fullQuestion.Length>=101)
                {
                     questionSeo = fullQuestion.Substring(0, 100);
                }
                else
                {
                     questionSeo = fullQuestion;
                }
                return RedirectToRoute("QuizPage", new {Id=question.QuestionId, V=questionSeo});
              
            }
            
            else
            {
                return RedirectToAction("Index");
            }

        }
        [HttpPost]
        public ActionResult Indexx(AnswerDetail answerDetail)
        {
            int id = Convert.ToInt32(Session["userId"]);
            answerDetail.UserId = id;
            string mark = _Irepo.PutMark(answerDetail);
            if(mark.Equals(answerDetail.UserAnswer))
            {
                answerDetail.Mark = 10;
            }
            else
            {
                answerDetail.Mark = 0;
            }
            _Irepo.SaveAnswer(answerDetail);
            return RedirectToAction("Index");
        } 
        public ActionResult SummaryPage()
        {
            int id = Convert.ToInt32(Session["userId"]);
            SummaryPage result=_Irepo.FetchResult(id);
            return View("SummaryPage",result);
        }
        public ActionResult StudentPage()
        {
            return View(question);
        }

        public void AjaxValue(string value)
        {
           string a = value;
        }
    
    }
}