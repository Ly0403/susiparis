using SuSiparis.DataAccess.Concrete;
using SuSiparis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SuSiparis.IdentityConfig;
using static SuSiparis.Models.IdentityModels;

namespace SuSiparis
{
    public partial class OnlineSiparis : System.Web.UI.Page
    {
        private EfProductDal _productDal = new EfProductDal();
        private EfOrderDal _orderDal = new EfOrderDal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                siparisOnline.Visible = true;
                siparisOffline.Visible = false;
            }
            else
            {
                siparisOnline.Visible = false;
                siparisOffline.Visible = true;
            }

        }
        protected void SiparisButton_Click(object sender, EventArgs e)
        {

            var _db2 = new IdentityModels.ApplicationDbContext();
            ApplicationUserStore Store2 = new ApplicationUserStore(_db2);
            ApplicationUserManager userManager2 = new ApplicationUserManager(Store2);
            ApplicationUser user = (from x in _db2.Users where x.PhoneNumber == SiparisTel.Text select x).FirstOrDefault();
            if (user == null || user.EmailConfirmed == false)
            {
                SiparisError.Text = "Geçersiz Tel veya Şifre yada Email Doğrulanmadı.";
            }
            else
            {
                if (userManager2.CheckPasswordAsync(user, SiparisSifre.Text).Result == true)
                {
                    foreach (var item in orderListView.Items)
                    {
                        var amount = ((DropDownList)item.FindControl("dropdownOrderAmount")).Text;
                        var productName = ((System.Web.UI.WebControls.Label)item.FindControl("lblProductNameOfflineSale")).Text;
                        if (Convert.ToInt32(amount) > 0)
                        {
                            _orderDal.Add(new Order
                            {
                                CustomerName = user.UserName,
                                OrderAmount = Convert.ToInt32(amount),
                                OrderStatus = "Alındı",
                                ProductName = productName
                            });
                            SiparisError.Text = "Siparişiniz Alındı";
                        }
                    }
                }
                else
                {
                    SiparisError.Text = "Geçersiz Tel veya Şifre";
                }

            }

        }

        protected void OnlineSiparisButton_Click(object sender, EventArgs e)
        {
            var _db = new IdentityModels.ApplicationDbContext();
            ApplicationUser user = (from x in _db.Users where x.UserName == HttpContext.Current.User.Identity.Name select x).FirstOrDefault();
            foreach (var item in onlineOrderListView.Items)
            {
                var amount = ((DropDownList)item.FindControl("dropdownOrderAmountOnline")).Text;
                var productName = ((System.Web.UI.WebControls.Label)item.FindControl("lblProductNameOnlineSale")).Text;
                if (Convert.ToInt32(amount) > 0)
                {
                    _orderDal.Add(new Order 
                    {
                        CustomerName = user.UserName,
                        CustomerAddress=user.UserAdres,
                        CustomerPhone=user.PhoneNumber,
                        OrderAmount = Convert.ToInt32(amount),
                        OrderStatus = "Alındı",
                        ProductName = productName
                    });
                    OnlineSiparisError.Text = "Siparişiniz Alındı";
                }
            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public List<Product> orderListView_GetData()
        {
            return _productDal.GetAll();
        }
    }
}