using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace foodfun.Areas.Staff.Controllers
{
    public class StaffOrderController : Controller
    {

        [LoginAuthorize(RoleList = "Admin/Staff")]
        // GET: Staff/StaffOrder
        public ActionResult OnlineOrder()
        {

            return View(StaffOrder.GetOrderList(DateTime.Today,false));
        }
    }
}