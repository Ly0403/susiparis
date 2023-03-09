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
    public partial class PasswordReset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void ResetButton_Click(object sender, EventArgs e)
        {
            ApplicationUserStore Store = new ApplicationUserStore(new ApplicationDbContext());
            ApplicationUserManager userManager = new ApplicationUserManager(Store);
            var provider = new Microsoft.Owin.Security.DataProtection.DpapiDataProtectionProvider("SuSiparis");
            userManager.UserTokenProvider = new Microsoft.AspNet.Identity.Owin.DataProtectorTokenProvider<ApplicationUser>(provider.Create("EmailConfirmation"));
            string code = IdentityHelper.GetCodeFromRequest(Request);
            if (code!=null)
            {
                var _db = new IdentityModels.ApplicationDbContext();
                var user = (from x in _db.Users where x.UserName == ResetUser.Text select x).FirstOrDefault();
                if (user==null)
                {
                    ResetErrorLabel.Text = "Kullanıcı Bulunamadı.";return;
                }
                var result = userManager.ResetPasswordAsync(user.Id,code,ResetSifre.Text);
                if (result.Result.Succeeded==true)
                {
                    ResetErrorLabel.Text = "Şifreniz Değiştirilmiştir.";return;
                }
                ResetErrorLabel.Text = result.Result.Errors.FirstOrDefault();
                return;
            }
            else
            {
                ResetErrorLabel.Text = "Hata Oluştu.";
            }

        }
    }
}