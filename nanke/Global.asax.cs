using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using nanke;
using System.IO;

namespace nanke
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();

            Application.Lock();
            Application["UserCount"] = 0;
            Application.UnLock();

            Application.Lock();
            Application["StatCount"] = 0;
            Application.UnLock();

        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }
        void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["UserCount"] = Int32.Parse(Application["UserCount"].ToString()) + 1;
            Application.UnLock();

            Application.Lock();
            Application["StatCount"] = int.Parse(Application["StatCount"].ToString()) + 1;
            Application.UnLock();

        }
        void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["UserCount"] = Int32.Parse(Application["UserCount"].ToString()) - 1;
            Application.UnLock();
        }
    }
}
