using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineQuestionnaireApplication.Models
{
    public class Results
    {
        public string Email { get; set; }
        public int? Score { get; set; }
        public Nullable<System.TimeSpan> TimeTaken { get; set; }
    }
}