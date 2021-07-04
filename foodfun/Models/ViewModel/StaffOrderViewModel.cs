using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace foodfun.Models
{
    public class StaffOrderViewModel
    {
        public Orders orders { get; set; }
        public List<OrdersDetails> orderDetails { get; set; }

        [Display(Name = "訂單狀態")]
        public string orderstatus_name { get; set; }

        [Display(Name = "用餐方式")]
        public string mealservice_name { get; set; }

        [Display(Name = "付款方式")]
        public string paid_name { get; set; }



    }
}