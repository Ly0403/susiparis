using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
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
    public partial class Login : System.Web.UI.Page
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.Current.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.Current.GetOwinContext().Authentication;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            var _db3 = new IdentityModels.ApplicationDbContext();
            var user = (from x in _db3.Users where x.UserName == tbxUsername.Text select x).FirstOrDefault();
            if (user != null)
            {
                if (!user.EmailConfirmed)
                {
                    lblLoginError.Text = "Email Adresi Onaylanmadı...Lütfen Mail Adresinize Gelen Mail ile Onay İşlemini Tamamlayınız....";
                }
                else
                {
                    var result = SignInManager.PasswordSignInAsync(tbxUsername.Text, tbxPassword.Text, true, shouldLockout: false);
                    if (result.Result.ToString() == "Success")
                    {
                        Response.Redirect("/");
                    }
                    else
                    {
                        lblLoginError.Text = "Geçersiz Kullanıcı Adı veya Şifre";
                    }
                }

            }
            else
            {
                lblLoginError.Text = "Kullanıcı Tanımlı Değil";
            }

        }
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (tbxAddressRegister.Text==""||tbxEmailRegister.Text==""||tbxPasswordRegister.Text==""||tbxPhoneRegister.Text==""
                ||tbxUsernameRegister.Text=="")
            {
                lblRegisterError.Text = "Tüm Alanları Doldurunuz";
                return;
            }
            ApplicationUserStore Store = new ApplicationUserStore(new ApplicationDbContext());
            ApplicationUserManager userManager = new ApplicationUserManager(Store);
            using (ApplicationDbContext db = new ApplicationDbContext())
            {
                if ((db.Users.Any(c => c.PhoneNumber == tbxPhoneRegister.Text)) == false && (db.Users.Any(c => c.UserName == tbxUsernameRegister.Text)) == false)
                {
                    try
                    {
                        ApplicationUser user;
                        user = new ApplicationUser
                        {
                            UserName = tbxUsernameRegister.Text,
                            Email = tbxEmailRegister.Text,
                            UserAdres = tbxAddressRegister.Text,
                            PhoneNumber = tbxPhoneRegister.Text,
                            Durum = "Teslim Edildi",
                            miktar = 0
                        };

                        var result = userManager.CreateAsync(user, tbxPasswordRegister.Text);
                        if (result.Result.Succeeded == true)
                        {
                            userManager.EmailService = new EmailService();
                            var provider = new Microsoft.Owin.Security.DataProtection.DpapiDataProtectionProvider("SuSiparis");
                            userManager.UserTokenProvider = new Microsoft.AspNet.Identity.Owin.DataProtectorTokenProvider<ApplicationUser>(provider.Create("EmailConfirmation"));
                            string code = userManager.GenerateEmailConfirmationToken(user.Id);
                            string callback = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                            userManager.SendEmail(user.Id, "Mail Onayla", "Damacana Sipariş Sitemize Hoşgeldiniz. <a href=\"" + callback + "\">BURAYA</a>." + " tıklayarak mail adresinizi onaylayabilirsiniz.");
                            lblRegisterError.Text = "Kayıt Alındı ve Mail Adresinize Onay Kodu Gönderildi.";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblRegisterError.Text = "Hatalı Kayıt (" + ex.Message + ")";
                    }
                }
                else
                {
                    lblRegisterError.Text = "Kayıtlı Kullanıcı veya Telefon Numarası";
                }
            }
        }       
    }
}