using Microsoft.AspNet.Identity;
using SuSiparis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SuSiparis.IdentityConfig;
using static SuSiparis.Models.IdentityModels;

namespace SuSiparis
{
    public partial class PasswordRefresh : System.Web.UI.Page
    {
        protected void ResetPasswordButton_Click(object sender, EventArgs e)
        {
            var _db = new IdentityModels.ApplicationDbContext();
            ApplicationUserStore Store = new ApplicationUserStore(new ApplicationDbContext());
            ApplicationUserManager userManager = new ApplicationUserManager(Store);
            ApplicationUser user = (from x in _db.Users where x.UserName == LoginUser.Text select x).FirstOrDefault();
            if (user == null || !userManager.IsEmailConfirmed(user.Id))
            {
                LoginError.Text = "Kullanıcı Yok yada Mail Adresi Onaylanmamıştır.";
            }
            else
            {
                userManager.EmailService = new EmailService();
                var provider = new Microsoft.Owin.Security.DataProtection.DpapiDataProtectionProvider("SuSiparis");
                userManager.UserTokenProvider = new Microsoft.AspNet.Identity.Owin.DataProtectorTokenProvider<ApplicationUser>(provider.Create("EmailConfirmation"));
                string code = userManager.GeneratePasswordResetToken(user.Id);
                string callback = IdentityHelper.GetResetPasswordRedirectUrl(code, Request);
                userManager.SendEmail(user.Id, "Şifre Yenile", "Hoşgeldiniz.... Yeni Şifrenizi <a href=\"" + callback + "\">BURADAN</a>."+"alabilirsiniz.");
                LoginError.Text = "Şifre Yenileme Sayfanız Mail Adresinize Gönderildi.";

            }


        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}