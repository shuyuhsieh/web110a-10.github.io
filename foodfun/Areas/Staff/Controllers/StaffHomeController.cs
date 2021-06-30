using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using foodfun.Models;

namespace foodfun.Areas.Staff.Controllers
{
    public class StaffHomeController : Controller
    {
        GoPASTAEntities db;
        public StaffHomeController()
        {
            db = new GoPASTAEntities();
        }

        [LoginAuthorize(RoleList = "Admin/Staff")]
        // GET: Staff/Home
        public ActionResult Index(string id = "HOT")
        {
            //找商品類別名稱
            string int_id = "";         //Category 的rowid
            ViewBag.CategoryNo = id;       //分類的編號   
            ViewBag.CategoryName = Shop.GetCategoryName(id, ref int_id);    //int_id 用ref 傳入改寫原值，把商品分類子類名稱給VB.CategoryName

            //商品list
            AdminOrderViewModel model = new AdminOrderViewModel()
            {
                Order = new Orders(),
                mealServiceList = db.MealService.OrderBy(m => m.mealservice_no).ToList(),
                PaymentsList = db.Payments.OrderBy(m => m.paid_no).ToList(),
                
            };
            if (id == "HOT")
            {
                model.products = Shop.GetHotProducts();
            }
            else
            {
                //prod1 這個編號的商品有沒有   
                var prod1 = db.Products.Where(m => m.category_no == id).ToList();
                model.products = prod1;
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Index(FormCollection collection)
        {

            //if (!ModelState.IsValid)
            //{
            //    AdminOrderViewModel model = new AdminOrderViewModel()
            //    {
            //        Order = new Orders(),
            //        mealServiceList = db.MealService.OrderBy(m => m.mealservice_no).ToList(),
            //        PaymentsList = db.Payments.OrderBy(m => m.paid_no).ToList(),

            //    };

            //}

            TempData["mealservice_no"] = collection["mealService"];
            if (collection["mealservice_no"] == "A")
            {
                TempData["Table_no"] = collection["Order.table_no"];
            }
            else if (collection["mealservice_no"] == "C")
            {
                TempData["receive_address"] = collection["Order.receive_address"];
            }

            TempData["SchedulOrderTime"] = collection["Order.SchedulOrderTime"];
            return View();
        
        }

 
        public ActionResult OrderBox(string id,int qty,string prop_select) 
        {
            var currentCart = CartTemp.GetCurrentCart();
            currentCart.AddCart(id,qty,prop_select);

            return PartialView("_PartialOrderBox");

        }


        public ActionResult Confirmation()
        {

            ConfirmationViewModel orderInfoView = new ConfirmationViewModel()
            {
                Order = new Orders(),
                PaymentsList = db.Payments.OrderBy(m => m.paid_no).ToList()
            };

            orderInfoView.Order.total = Cart.Totals;
            Users userinfo = new Users();

            userinfo = db.Users.Where(m => m.account_name == UserAccount.UserNo).FirstOrDefault();

            if (UserAccount.IsLogin)
            {
                orderInfoView.Cart = db.Carts.Where(m => m.mno == UserAccount.UserNo).ToList();
                orderInfoView.Order.mno = UserAccount.UserNo;
                orderInfoView.Order.receive_name = userinfo.mname;
                orderInfoView.Order.receive_phone = userinfo.phone;
            }
            else
            {
                orderInfoView.Cart = db.Carts.Where(m => m.cart_lotno == Cart.LotNo).ToList();
            }
            orderInfoView.Order.mealservice_no = TempData["mealservice_no"].ToString();
            orderInfoView.Order.SchedulOrderTime = Convert.ToDateTime(TempData["SchedulOrderTime"]);
            string mealservice_no = orderInfoView.Order.mealservice_no;

            if (mealservice_no == "A")
            {
                orderInfoView.Order.table_no = TempData["Table_no"].ToString();

            }
            else if (mealservice_no == "C")
            {
                orderInfoView.Order.receive_address = TempData["receive_address"].ToString();
            }

            var mealservice = db.MealService.Where(m => m.mealservice_no == mealservice_no).FirstOrDefault();
            orderInfoView.mealservice_name = mealservice.mealservice_name;


            return View(orderInfoView);

        }

    }
}