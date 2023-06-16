using Kudosboard.ExceptionFilter;
using System.Web;
using System.Web.Mvc;


namespace Kudosboard
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new ExceptionFilters());
        }
    }
}
