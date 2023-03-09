using SuSiparis.DataAccess.Concrete;
using SuSiparis.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.EnterpriseServices;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio.TwiML.Messaging;
using Label = System.Web.UI.WebControls.Label;

namespace SuSiparis.Bayi
{
    public partial class BayiAddProduct : System.Web.UI.Page
    {
        private EfProductDal _productDal = new EfProductDal();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetAllProducts();
        }

        private void GetAllProducts()
        {

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (!uplProductImg.HasFile || String.IsNullOrEmpty(txtProductName.Text)
                || String.IsNullOrEmpty(txtFiyat.Text) || String.IsNullOrEmpty(txtStock.Text))
            {
                lblAddProductResellerError.Text = "Tüm Alanları Doldurun!!!";
                return;
            }
            else
            {
                string fileName = Upload(uplProductImg,uplProductImg.PostedFile.FileName);
                _productDal.Add(new Models.Product
                {
                    ProductImgFilename = fileName,
                    ProductName = txtProductName.Text,
                    Price = Convert.ToInt32(txtFiyat.Text),
                    Stock = Convert.ToInt32(txtStock.Text)
                });
                Response.Redirect(Request.RawUrl);
            }
        }

        private string Upload(FileUpload fileUpload, string path)
        {
            string fileName = Path.GetFileName(path);
            fileUpload.PostedFile.SaveAs(Server.MapPath("~/UserManager/photo/") + fileName);
            return fileName;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var productId = ((Label)((Button)sender).NamingContainer.FindControl("lblProductIdUpdate")).Text;
            _productDal.Delete(new Product
            {
                ProductId = Convert.ToInt32(productId)
            });
            Response.Redirect(Request.RawUrl);
        }

        protected void updateStock_Click(object sender, EventArgs e)
        {
            var productId = ((Label)((Button)sender).NamingContainer.FindControl("lblProductIdUpdate")).Text;
            var productName = ((TextBox)((Button)sender).NamingContainer.FindControl("txtProductNameUpdate")).Text;
            var price = ((TextBox)((Button)sender).NamingContainer.FindControl("txtProductPriceUpdate")).Text;
            var stock = ((TextBox)((Button)sender).NamingContainer.FindControl("txtProductAmountUpdate")).Text;
            var fileUploadBox = (FileUpload)((Button)sender).NamingContainer.FindControl("uploadProductImgUpdate");
            var errorLabel = (Label)((Button)sender).NamingContainer.FindControl("lblUpdateProductResellerError");
            var fileName=((Button)sender).CommandArgument;

            if (String.IsNullOrEmpty(productName)
                || String.IsNullOrEmpty(price) || String.IsNullOrEmpty(stock))
            {
                errorLabel.Text = "Tüm Alanları Doldurun!!!";
                return;
            }
            else
            {
                if (fileUploadBox.HasFile)
                {
                    fileName = Upload(fileUploadBox,fileUploadBox.PostedFile.FileName);
                }               
                _productDal.Update(new Product
                {
                    ProductId = Convert.ToInt32(productId),
                    ProductName = productName,
                    Price = Convert.ToDecimal(price),
                    Stock = Convert.ToInt32(stock),
                    ProductImgFilename = fileName
                });
                Response.Redirect(Request.RawUrl);
            }

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public List<Product> listviewAddedPRoducts_GetData()
        {
            return _productDal.GetAll();
        }
    }
}