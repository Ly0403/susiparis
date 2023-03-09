using SuSiparis.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using static SuSiparis.Models.YorumModel;

namespace SuSiparis.DataAccess.Concrete
{
    public class DbContextBase:DbContext
    {
        public DbContextBase() : base("YorumCon")
        {

        }
        public DbSet<Product> Products { get; set; }
        public DbSet<Yorumlar> YorumlarVeriTabani { get; set; }

        public DbSet<Order> Orders { get; set; }

    }
}