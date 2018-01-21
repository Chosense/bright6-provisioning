using Microsoft.SharePoint.Client;
using OfficeDevPnP.Core.Utilities;
using System;
using System.Net;

namespace Chosense.Bright6.Provisioning.TestConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            var context = new ProvisioningContext(args[0]);
            Connect(context.SiteUrl);
        }


        private static void Connect(Uri url)
        {
            using (var context = new ClientContext(url))
            {
                context.Load(context.Site);
                context.ExecuteQuery();

                Console.WriteLine(context.Site.RootWeb.Title);
            }

        }
    }
}
