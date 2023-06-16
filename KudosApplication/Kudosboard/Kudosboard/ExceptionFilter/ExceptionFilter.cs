using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kudosboard.ExceptionFilter
{
    public class ExceptionFilters:ActionFilterAttribute,IExceptionFilter
    {
        public void OnException(ExceptionContext filtercontext)
        {
            try
            {
                Exception exception = filtercontext.Exception;
                File.AppendAllText(HttpContext.Current.Server.MapPath("~/Logs/Logs.txt"), exception.ToString());
                filtercontext.ExceptionHandled = true;
                filtercontext.Result = new ViewResult
                {
                    ViewName = "Error"
                };
            }
            catch(Exception exception)
            {
                File.AppendAllText(HttpContext.Current.Server.MapPath("~/Logs/Logs.txt"), exception.ToString());
            }
        }
    }
}