using System;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;
using static SuSiparis.Models.IdentityModels;

[assembly: OwinStartup(typeof(SuSiparis.Startup))]

namespace SuSiparis
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);

        }

    }
}
