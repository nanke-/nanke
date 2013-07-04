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
            StreamReader srd;

            string file_path = Server.MapPath("counter.txt");
            srd = File.OpenText(file_path);

            string str = srd.ReadLine();
            srd.Close();

            Application.Lock();
            Application["UserCount"] = 0;
            Application.UnLock();

            Application.Lock();
            Application["StatCount"] = int.Parse(str);
            Application.UnLock();

        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
            int statCount = int.Parse(Application["StatCount"].ToString());

            string file_path = Server.MapPath("counter.txt");
            StreamWriter srw = new StreamWriter(file_path, false);
            srw.WriteLine(statCount);

            srw.Close();
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

            int userCount = Int32.Parse(Application["UserCount"].ToString());
            int statCount = int.Parse(Application["StatCount"].ToString());

            string file_path = Server.MapPath("counter.txt");
            StreamWriter srw = new StreamWriter(file_path, false);
            srw.WriteLine(statCount);

            srw.Close();
        }
        void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["UserCount"] = Int32.Parse(Application["UserCount"].ToString()) - 1;
            Application.UnLock();
        }
    }
}
