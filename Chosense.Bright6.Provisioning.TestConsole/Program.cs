using Microsoft.SharePoint.Client;
using OfficeDevPnP.Core;
using System;

namespace Chosense.Bright6.Provisioning.TestConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            var context = new ProvisioningContext(args[0]);
            Connect(context.SiteUrl, args[1]);
        }


        private static void Connect(Uri url, string credentialName)
        {
            var authMan = new AuthenticationManager();


            using (var context = new ClientContext(url))
            {
                context.Load(context.Site);
                context.ExecuteQuery();

                Console.WriteLine(context.Site.RootWeb.Title);
            }

        }
    }
}
