using OnlineQuestionnaireApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineQuestionnaireApplication.ViewMode
{
    public class SummaryPage
    {

        public ResultDetail resultDetail { get; set; }
        public List<AnswerDetail> answerDetail { get; set; }
        public List<Question> questions { get; set; }

    }
}