using SuSiparis.Bayi;
using SuSiparis.Models;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace SuSiparis
{
    public partial class SiteMaster : MasterPage
    {
        public IQueryable<IdentityModels.ApplicationUser> FormView1_GetItem()
        {
            var _db = new IdentityModels.ApplicationDbContext();
            IQueryable<IdentityModels.ApplicationUser> query = _db.Users;
            query = query.Where(c => c.UserName == HttpContext.Current.User.Identity.Name);
            return query;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            var AuthenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            AuthenticationManager.SignOut();
            Response.Redirect("/");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                siparisLink.Visible = true;
                userProfileLink.Visible = true;
                loginLink.Visible = false;
            }
            if (HttpContext.Current.User.Identity.Name=="yucel")
            {
                bayiLink.Visible = true;
                bayiurunEkleLink.Visible = true;
                siparisLink.Visible = false;
                siparisVermeLink.Visible = false;
            }

        }
    }
}