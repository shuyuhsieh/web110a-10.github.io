using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using foodfun.Models;

namespace foodfun.Areas.Admin.Controllers
{
    public class PaymentsController : Controller
    {
        // GET: Admin/Payments
        public ActionResult Index()
        {
           

            using (GoPASTAEntities db = new GoPASTAEntities())
            {
                return View(db.Payments.OrderBy(m => m.rowid).ToList());

            }
        }

        public ActionResult Create()
        {
            using (GoPASTAEntities db = new GoPASTAEntities())
            {

                Payments model = new Payments();

                return View(model);

            }
        }

        [HttpPost]
        public ActionResult Create(Payments model)
        {
            if (!ModelState.IsValid) return View(model);


            using (GoPASTAEntities db = new GoPASTAEntities())
            {
                db.Payments.Add(model);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }

        [HttpGet]
        [LoginAuthorize(RoleList = "Admin")]
        public ActionResult Edit(int id)
        {
            using (GoPASTAEntities db = new GoPASTAEntities())
            {
                //if (id == 0)
                //{
                //    Categorys new_model = new Categorys();
                //    return View(new_model);
                //}
                var models = db.Payments.Where(m => m.rowid == id).FirstOrDefault();
                return View(models);
            }
        }

        [HttpPost]
        [LoginAuthorize(RoleList = "Admin")]
        public ActionResult Edit(Payments model)
        {

            if (!ModelState.IsValid) return View(model);
            using (GoPASTAEntities db = new GoPASTAEntities())
            {
                // var data = db.Propertys.Where(m => m.property_no == model.property_no).FirstOrDefault();
                var data = db.Payments.Where(m => m.rowid == model.rowid).FirstOrDefault();
                // data.rowid = model.rowid;
                data.rowid = model.rowid;
                data.paid_no = model.paid_no;
                data.paid_name = model.paid_name;
                data.remark = model.remark;

                db.SaveChanges();
                return RedirectToAction("Index");
            }

        }

        [HttpGet]

        public ActionResult Delete(int id)
        {
            using (GoPASTAEntities db = new GoPASTAEntities())
            {
                var model = db.Payments.Where(m => m.rowid == id).FirstOrDefault();
                if (model != null)
                {
                    db.Payments.Remove(model);
                    db.SaveChanges();
                }
                //return RedirectToAction("Index", "Product");    //Product為controller可略,會以目前controller為主
                return RedirectToAction("Index");
            }
        }

    }
}