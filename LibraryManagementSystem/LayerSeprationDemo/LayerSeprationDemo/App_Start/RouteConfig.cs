using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace LayerSeprationDemo
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute("DetailsPage", "MyLibraryAvailablity", new {Controller= "Library",action="DisplayBooks" });
            routes.MapRoute("AddBook", "AddNewBook", new { Controller = "Library", action = "AddNewBook" });
            routes.MapRoute("UpdateView", "UpdateBookDetails/{id}", new { Controller = "Library", action = "UpdateBook"});

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Library", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
