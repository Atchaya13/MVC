using AssertLogics;
using AssertManagementRepository;
using System.Web.Mvc;
using Unity;
using Unity.Mvc5;

namespace AssertManagementSystem
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // e.g. container.RegisterType<ITestService, TestService>();
            container.RegisterType<IAssertLogic, AssertLogic>();
            container.RegisterType<IAssertRepository, AssertRepository>();
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}