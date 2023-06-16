using OnlineQuestionnaireApplication.Models;
using OnlineQuestionnaireApplication.ViewMode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Helpers;
using System.Xml.Linq;

namespace OnlineQuestionnaireApplication.Repository
{
    public class QuestionnarieRepo:IRepo
    {
        QuestionnaireApplicationEntities7 dbAccess = new QuestionnaireApplicationEntities7();
        public UserDetail GetUserDetail(string email)
        {
            var datas = dbAccess.UserDetails.Where(x => x.Email == email).Select(x => x).FirstOrDefault();
            return datas;
        }
        public Question FillQuestion(int userId)
        {
            Question questionn = new Question();
            var question = dbAccess.Questions.OrderBy(c => Guid.NewGuid()).FirstOrDefault();
            int testEnd = QuestionCount(userId);
            question.Count = testEnd+1;
            if(testEnd == 0)
            {
                question.CurrentMark = 0;
            }
            else
            {
                int? currentMark = dbAccess.AnswerDetails.Where(c1 => c1.UserId == userId).Select(c1 => c1.Mark).Sum();
                question.CurrentMark = currentMark;
            }
            return question;
        }
        public bool CheckQuestion(Question question,int userId)
        {
            int value = 0;
            List<AnswerDetail> allAnswer = dbAccess.AnswerDetails.ToList();
            for (int i = 0; i < allAnswer.Count; i++)
            {
                if (question.QuestionId == allAnswer[i].QuestionId && userId == allAnswer[i].UserId)
                {
                    value = value + 1;
                
                }
            }
            if (value == 0)
                return true;
            else
                return false;
        }
        public bool TestEnd(int userId)
        {
          
            int count = dbAccess.AnswerDetails.Count(c => c.UserId == userId);
            if(count==5)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public int QuestionCount(int userId)
        {
            int count = dbAccess.AnswerDetails.Count(c => c.UserId == userId);
            return count;
        }
        public void SaveAnswer(AnswerDetail answer)
        {
            dbAccess.AnswerDetails.Add(answer);
            dbAccess.SaveChanges();
        }
        public string PutMark(AnswerDetail answerDetail)
        {
           
            var datas = dbAccess.Questions.Where(x => x.QuestionId== answerDetail.QuestionId).Select(x => x).FirstOrDefault();
            return datas.AnswerText;
        }
        public int? ResultCalc(int userId)
        {
            List<AnswerDetail> allAnswer = dbAccess.AnswerDetails.ToList();
            int? c = dbAccess.AnswerDetails.Where(c1 => c1.UserId == userId).Select(c1 => c1.Mark).Sum();

            return c;

        }
        public void UpdateMark(ResultDetail resultDetail)
        {
            dbAccess.ResultDetails.Add(resultDetail);
            dbAccess.SaveChanges();
        }
        public SummaryPage FetchResult(int id)
        {
            var datas = dbAccess.ResultDetails.Where(x => x.UserId == id).Select(x => x).FirstOrDefault();
            var question = dbAccess.Questions.ToList();
            List<AnswerDetail> ans = new List<AnswerDetail>();
            var answer = dbAccess.AnswerDetails.OrderBy(o=>o.QuestionId).ToList();
            foreach(var i in answer)
            {
                if(i.UserId==id)
                {
                    ans.Add(i);
                }
            }
            return new SummaryPage() { resultDetail = datas, answerDetail = ans, questions = question };
        }
        public List<Results> ShowResult()
        {
          var resultrff = dbAccess.ResultDetails.Join(dbAccess.UserDetails, rd => rd.UserId, ud => ud.UserId, (rd, ud) => new { rd, ud }).Select(s => new
            {
                email = s.ud.Email,
                Score = s.rd.Score,
                TimeTaken = s.rd.TimeTaken
            }).ToList();
            List<Results> result = new List<Results>();
            foreach(var i in resultrff)
            {
                result.Add(new Results() { Email = i.email, Score = i.Score, TimeTaken = i.TimeTaken });
            }
            return result;
        }
        public TimeSpan? AddTime(int userId)
        {
            TimeSpan DT = new TimeSpan(00);
            var time1 = dbAccess.AnswerDetails.Where(c1 => c1.UserId == userId && c1.QuestionId == 1).Select(c1 => c1.Time).FirstOrDefault();
            var time2 = dbAccess.AnswerDetails.Where(c1 => c1.UserId == userId && c1.QuestionId == 2).Select(c1 => c1.Time).FirstOrDefault();
            var time3 = dbAccess.AnswerDetails.Where(c1 => c1.UserId == userId && c1.QuestionId == 3).Select(c1 => c1.Time).FirstOrDefault();
            var time4 = dbAccess.AnswerDetails.Where(c1 => c1.UserId == userId && c1.QuestionId == 4).Select(c1 => c1.Time).FirstOrDefault();
            var time5 = dbAccess.AnswerDetails.Where(c1 => c1.UserId == userId && c1.QuestionId == 5).Select(c1 => c1.Time).FirstOrDefault();
            if (time1 == null)
            {
                time1 = DT;
            }
            if(time2==null)
            {
                time2 = DT;
            }
            if (time3 == null)
            {
                time3 = DT;
            }
            if (time4 == null)
            {
                time4 = DT;
            }
            if (time5 == null)
            {
                time5 = DT;
            }
            var total = time1 + time2 + time3 + time4 + time5;
            return total;
        }
       
    }
}