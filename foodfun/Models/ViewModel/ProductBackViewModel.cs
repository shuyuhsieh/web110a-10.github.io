using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace foodfun.Models
{
    public class ProductBackViewModel
    {
        public  Products  products{ get; set; }
   

        [Display(Name = "類別名稱")]
        public string category_name { get; set; }
    }
}