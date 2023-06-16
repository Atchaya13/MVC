using OnlineQuestionnaireApplication.Models;
using OnlineQuestionnaireApplication.ViewMode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineQuestionnaireApplication.Repository
{
    public interface IRepo
    {
        UserDetail GetUserDetail(string email);
        Question FillQuestion(int userId);
        bool TestEnd(int userId);
        void SaveAnswer(AnswerDetail answer);
        bool CheckQuestion(Question question, int userId);
        string PutMark(AnswerDetail answerDetail);
        int? ResultCalc(int userId);
        void UpdateMark(ResultDetail resultDetail);
        SummaryPage FetchResult(int id);
        List<Results> ShowResult();
        TimeSpan? AddTime(int userId);
        
    }
}
