using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace SuSiparis.Models
{
    public class YorumModel
    {
        public class Yorumlar
        {
            [Key]
            public int YorumID { get; set; }
            public string UserName { get; set; }
            public string Yorum { get; set; }
        }
    }
}