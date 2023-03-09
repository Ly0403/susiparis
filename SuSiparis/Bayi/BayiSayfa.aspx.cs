using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SuSiparis.DataAccess.Concrete;
using SuSiparis.Models;
using static SuSiparis.IdentityConfig;
using static SuSiparis.Models.IdentityModels;
using Label = System.Web.UI.WebControls.Label;

namespace SuSiparis.Bayi
{
    public partial class BayiSayfa : System.Web.UI.Page
    {
        private EfOrderDal _orderDal = new EfOrderDal();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public List<Order> FormView1_GetItem()
        {
            return _orderDal.GetAll();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var orderId = Convert.ToInt32(((Label)((Button)sender).NamingContainer.FindControl("lblOrderIdResellerPage")).Text);
            var status = ((DropDownList)((Button)sender).NamingContainer.FindControl("DropDownList1")).Text;
            Order order = _orderDal.Get(x => x.OrderId == orderId);
            order.OrderStatus = status;
            if (status == "İptal")
            {
                _orderDal.Delete(order);
            }
            else
            {
                _orderDal.Update(order);
            }
            Response.Redirect(Request.RawUrl);

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
    }
}