using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static SuSiparis.IdentityConfig;
using static SuSiparis.Models.IdentityModels;
using Microsoft.Owin.Security;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Host.SystemWeb;
using System.Globalization;
using SuSiparis.Models;
using System.Web.ModelBinding;
using Microsoft.AspNet.Identity;
using static SuSiparis.Models.YorumModel;
using SuSiparis.DataAccess.Concrete;

namespace SuSiparis
{
    public partial class _Default : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            

        }
        private DbContextBase _db = new DbContextBase();
        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<SuSiparis.Models.YorumModel.Yorumlar> YorumlarListview_GetData()
        {            
            IQueryable<Yorumlar> query = _db.YorumlarVeriTabani;
            return query;
        }

        protected void YorumButton_Click(object sender, EventArgs e)
        {
            var newYorum = new Yorumlar();
            newYorum.UserName = YorumUserName.Text;
            newYorum.Yorum = YorumText.Text;
            _db.YorumlarVeriTabani.Add(newYorum);
            _db.SaveChanges();
            Response.Redirect("/");
           
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<SuSiparis.Models.Product> listviewProducts_GetData()
        {
            return _db.Products.Where(x=>x.Stock>0);
        }
    }
}