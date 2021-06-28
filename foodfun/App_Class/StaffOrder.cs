using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using foodfun.Models;


/// <summary>
/// 訂單類別
/// </summary>
public static class StaffOrder
{

    #region 公開屬性

    /// <summary>
    /// 又否有未結訂單
    /// </summary>




    #endregion

    #region 公用函數


    /// <summary>
    /// 取得今日未完成訂單
    /// </summary>
    public static List<StaffOrderViewModel> GetOrderList(string mealserver_no)
    {
        using (GoPASTAEntities db = new GoPASTAEntities())
        {
            DateTime dateTime = DateTime.Today.AddDays(1);
            var order = db.Orders.Where(m => m.isclosed == false)
                                 .Where(m => m.SchedulOrderTime >= DateTime.Today && m.SchedulOrderTime < dateTime)
                                 .Where(m => m.mealservice_no == mealserver_no)
                                 .OrderBy(m => m.order_no).ToList();

            int num = order.Count();

            List<StaffOrderViewModel> ordersViewModels = new List<StaffOrderViewModel>();
            for (int i = 0; i < num; i++)
            {
                string status_no = order[i].orderstatus_no;
                string meal_no = order[i].mealservice_no;
                string order_no = order[i].order_no;
                string paid_no = order[i].paid_no;

                ordersViewModels.Add(new StaffOrderViewModel()
                {
                    orders = order[i],
                    
                    orderDetails = db.OrdersDetails.Where(m => m.order_no == order_no).OrderBy(m => m.rowid).ToList(),
                    orderstatus_name = db.OrderStatus.Where(m => m.orderstatus_no == status_no).FirstOrDefault().orderstatus_name,
                    mealservice_name = db.MealService.Where(m => m.mealservice_no == meal_no).FirstOrDefault().mealservice_name,
                    paid_name = db.Payments.Where(m => m.paid_no == paid_no ).FirstOrDefault().paid_name

                });
            }
            return ordersViewModels;
        }
    }


    public static List<OrdersDetails> GetOrderDetails(string order_no)
    {
        using (GoPASTAEntities db = new GoPASTAEntities())
        {
            var detailList = db.OrdersDetails.Where(m => m.order_no == order_no).ToList();
            return detailList;

        }
    }

    #endregion

    #region 私有函數


    #endregion



}
