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



        [LoginAuthorize(RoleList = "Admin,Staff")]
        [HttpPost]
        //public JsonResult SelectCheckout(FormCollection collection)
        public JsonResult AddOrderInfi(FormCollection collection)
        {
            int result = 0;
            if (collection["mealService"] == null) { return Json(result, JsonRequestBehavior.AllowGet); }
            //TempData["mealservice_no"] = collection["mealService"];

            if (collection["mealService"] == "A")
            {
                if (collection["Order.table_no"] == "")
                {
                    result = 1;
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
                //TempData["Table_no"] = collection["Order.table_no"];

            }
            if (collection["mealService"] == "B")
            {
                if (collection["Order.SchedulOrderTime"] == "")
                {
                    result = 2;
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
            }
            if (collection["mealService"] == "C")
            {
                if (collection["Order.SchedulOrderTime"] == "" && collection["Order.SchedulOrderTime"] == "")
                {
                    result = 3;
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
                //TempData["receive_address"] = collection["Order.receive_address"];
            }

            //TempData["SchedulOrderTime"] = collection["Order.SchedulOrderTime"];



            //=================================================

            ConfirmationViewModel orderInfoView = new ConfirmationViewModel()
            {
                Order = new Orders(),
                PaymentsList = db.Payments.OrderBy(m => m.paid_no).ToList()
            };
            orderInfoView.Order.total = CartTemp.GetCurrentCart().TotalAmount;
            orderInfoView.Cart = CartTemp.GetCurrentCart().cartItems;

            //TEST
            orderInfoView.Order.mealservice_no = collection["mealService"];
            //orderInfoView.Order.mealservice_no = "A";
            string mealservice_no = orderInfoView.Order.mealservice_no;

            if (mealservice_no == "A")
            {
                //TEST
                //orderInfoView.Order.table_no = "D3"
                orderInfoView.Order.table_no = collection["Order.table_no"];
                orderInfoView.Order.SchedulOrderTime = DateTime.Now;

            }
            else if (mealservice_no == "C")
            {
                orderInfoView.Order.receive_address = collection["Order.receive_address"];
                orderInfoView.Order.SchedulOrderTime = Convert.ToDateTime(collection["Order.SchedulOrderTime"]);
            }
            else
            {
                orderInfoView.Order.SchedulOrderTime = Convert.ToDateTime(collection["Order.SchedulOrderTime"]);

            }

            var mealservice = db.MealService.Where(m => m.mealservice_no == mealservice_no).FirstOrDefault();
            orderInfoView.mealservice_name = mealservice.mealservice_name;

            TempData["CheckoutInfo"] = orderInfoView;

            result = 4;
            return Json(result, JsonRequestBehavior.AllowGet);

        }


        public ActionResult OrderBox(string id, int qty, string prop_select)
        {
            var currentCart = CartTemp.GetCurrentCart();
            currentCart.AddCart(id, qty, prop_select);
            return PartialView("_PartialOrderBox");

        }

        public JsonResult CheckoutLater()
        {
            bool result = false;
            ConfirmationViewModel model = (ConfirmationViewModel)TempData["CheckoutInfo"];
            if (model.Cart.Count() !=0)
            {
                try
                {
                    Cart.AddNewOrder(model, false, "TBP");
                    string OrderNo = Cart.GetOrderNO();
                    Cart.StaffNewOrderDetail();
                    result = true;
                    return Json(OrderNo, JsonRequestBehavior.AllowGet);
                }
                catch (Exception)
                {
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

    


        [HttpPost]
        public ActionResult CheckoutNow(ConfirmationViewModel model)
        {
            if (!ModelState.IsValid)
            {
                if (model.PaymentsList == null)
                {
                    model.PaymentsList = db.Payments.OrderBy(m => m.paid_no).ToList();
                }
                return View(model);
            }

            //Cart.AddNewOrder(model,);
            string a = Cart.GetOrderNO();
            //Cart.AddNewOrderDetail();
            return RedirectToAction("Index", "Home");
        }
        public ActionResult Chectout()
        {
            return View(TempData["CheckoutInfo"]);
        }

    }
}