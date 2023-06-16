using OnlineQuestionnaireApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineQuestionnaireApplication.ViewMode
{
    public class AdminView
    {
        public List<ResultDetail> Result { get; set; }
        public List<UserDetail> Users { get; set; }
    }
}