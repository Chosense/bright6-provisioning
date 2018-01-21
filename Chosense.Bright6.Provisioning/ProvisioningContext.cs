using System;
using System.Collections.Generic;
using System.Text;

namespace Chosense.Bright6.Provisioning
{
    /// <summary>
    /// The context for provisioning Bright 6 data structures.
    /// </summary>
    public sealed class ProvisioningContext
    {
        /// <summary>
        /// Creates an instance of the class.
        /// </summary>
        /// <param name="siteUrl">The full <c>URL</c> to the SharePoint site to provision to.</param>
        public ProvisioningContext(string siteUrl) : this(new Uri(siteUrl)) { }

        /// <summary>
        /// Creates an instance of the class.
        /// </summary>
        /// <param name="siteUrl">The full <c>URL</c> to the SharePoint site to provision to.</param>
        public ProvisioningContext(Uri siteUrl)
        {
            if (!siteUrl.IsAbsoluteUri) throw new ArgumentException("The given URL must be an absolute URL.", nameof(siteUrl));
            this.SiteUrl = siteUrl;
        }

        public Uri SiteUrl { get; private set; }


    }
}
