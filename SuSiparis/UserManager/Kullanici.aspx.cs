using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using SuSiparis.Models;
using System.Web.Security;
using System.Security.Cryptography;
using static SuSiparis.IdentityConfig;
using static SuSiparis.Models.IdentityModels;
using Microsoft.AspNet.Identity;

namespace SuSiparis.Siparis.UserManager
{
    public partial class Kullanici : System.Web.UI.Page
    {
        IdentityModels.ApplicationDbContext _db = new IdentityModels.ApplicationDbContext();
        IdentityModels.ApplicationUser UserNew = new IdentityModels.ApplicationUser();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public IQueryable<IdentityModels.ApplicationUser> FormView1_GetItem()
        {
            var _db = new IdentityModels.ApplicationDbContext();
            IQueryable<IdentityModels.ApplicationUser> query = _db.Users;
            query = query.Where(c => c.UserName == HttpContext.Current.User.Identity.Name);
            return query;
        }
        protected void Upload(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {                
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/UserManager/photo/") + fileName);                    
                UserNew = (from x in _db.Users where x.UserName == HttpContext.Current.User.Identity.Name select x).First();
                UserNew.UserImg = fileName;
                _db.SaveChanges();
                Response.Redirect("~/UserManager/Kullanici.aspx");
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
             var UserNew = (from x in _db.Users where x.UserName == HttpContext.Current.User.Identity.Name select x).First();

            if (!String.IsNullOrEmpty(UpdatePassword.Text)&& String.IsNullOrEmpty(UpdateAdres.Text))
            {
                ApplicationUserStore Store = new ApplicationUserStore(new ApplicationDbContext());
                ApplicationUserManager userManager = new ApplicationUserManager(Store);
                UserNew.PasswordHash = userManager.PasswordHasher.HashPassword(UpdatePassword.Text);
                UpdateLabelError.Text = "Şifreniz Değiştirildi.";
            }
            else if (!String.IsNullOrEmpty(UpdateAdres.Text)&& String.IsNullOrEmpty(UpdatePassword.Text))
            {
                UserNew.UserAdres = UpdateAdres.Text;
                UpdateLabelError.Text = "Adresiniz Değiştirildi.";
            }
            else if (!String.IsNullOrEmpty(UpdateAdres.Text) && !String.IsNullOrEmpty(UpdatePassword.Text))
            {   UserNew.UserAdres = UpdateAdres.Text;
                ApplicationUserStore Store = new ApplicationUserStore(new ApplicationDbContext());
                ApplicationUserManager userManager = new ApplicationUserManager(Store);
                UserNew.PasswordHash = userManager.PasswordHasher.HashPassword(UpdatePassword.Text);
                UpdateLabelError.Text = "Şifreniz ve Adresiniz Değiştirildi.";
            }
            else
            {
                UpdateLabelError.Text = "Değişim İçin Bilgi girmediniz.";
            }

            _db.SaveChanges();
            UpdatePassword.Text = "";
            UpdateAdres.Text = "";
            

        }

        
    }
}