using SuSiparis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SuSiparis.DataAccess.Concrete
{
    public class EfProductDal:EfDbRepository<Product,DbContextBase>
    {
    }
}