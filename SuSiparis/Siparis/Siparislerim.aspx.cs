using SuSiparis.DataAccess.Concrete;
using SuSiparis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuSiparis.Siparis
{
    public partial class Siparislerim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression

        private EfOrderDal _orderDal = new EfOrderDal();
        public List<Order> ListView1_GetData()
        {
            return _orderDal.GetAll(x => x.CustomerName == HttpContext.Current.User.Identity.Name);
        }

        protected void btnCancelOrderCustomer_Click(object sender, EventArgs e)
        {
            var orderId = Convert.ToInt32(((Button)sender).CommandArgument);
            var orderStatus = _orderDal.Get(x => x.OrderId == orderId).OrderStatus;
            if (orderStatus == "Alındı")
            {
                _orderDal.Delete(new Order
                {
                    OrderId = orderId
                });
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}