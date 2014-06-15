using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
using System.ServiceModel.Activation;
using GoT.Data;

namespace GoT.Server
{
    public class Global : System.Web.HttpApplication
    {
        private static void RegisterRoutes()
        {
            RouteTable.Routes.Add(new ServiceRoute("GoTService", new WebServiceHostFactory(), typeof(GoTService)));
        }

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes();
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}