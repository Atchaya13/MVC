using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace OnlineQuestionnaireApplication
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute("StudentPage", "Student", new { controller = "Student", action = "Index" });
            
            routes.MapRoute("AdminPage", "QuessionaireReport", new { controller = "Admin", action = "Index" });

            routes.MapRoute("LogOut", "UserDetail", new { controller = "Account", action = "Index" });

            routes.MapRoute("SummaryPage", "Quessionaire/Result", new { controller = "Student", action = "SummaryPage" });

            routes.MapRoute("QuizPage", "Quessionaire/{id}/{V}", new { controller = "Student", action = "StudentPage"});

            routes.MapRoute("IndexPage", "UserDetail", new { controller = "Account", action = "Index", id = UrlParameter.Optional });
            
            routes.MapRoute(
               name: "Default",
               url: "{controller}/{action}/{id}",
               defaults: new { controller = "Account", action = "FirstPage", id = UrlParameter.Optional }
           );
        }
    }
}
