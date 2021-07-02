using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using foodfun.Models;



public static class Backend
{
    public static string CreateProductNo(string id)
    {


        GoPASTAEntities db = new GoPASTAEntities();

        string productno;
        var P = db.Products.Where(m => m.product_no.StartsWith(id)).Select(m => m.product_no).Max();
        if (P != null)
        {
            int X = Convert.ToInt32(P.Substring(3));
            X += 1;

            productno = id + X.ToString("D4");
        }
        else
        {
            productno = id + "0001";

        }

        return productno;


    }


    public static string GetCodeName(string typeNo)
    {

        using (GoPASTAEntities db = new GoPASTAEntities())
        {
            string str_name = "";

            //var data = repoAppCode.ReadSingle(m => m.type_no == typeNo && m.mno == codeNo);
            //var data = db.Products.Where(m => m.category_no == typeNo && m.product_no == codeNo);
            //var cc = db.Categorys.Where(m => m.category_name == cname).ToString();
            //if (data != null) str_name = data + cc;
            //return str_name;

            var model = db.Categorys.Where(m => m.category_no == typeNo).FirstOrDefault();
            if (model!=null)
            {
                str_name = model.category_name;
            }
            return str_name;

        }

        //老師範例
        //public string GetCodeName(string typeNo, string codeNo)
        //{
        //    string str_name = "";
        //    var data = repoAppCode.ReadSingle(m => m.type_no == typeNo && m.mno == codeNo);
        //    if (data != null) str_name = data.mname;
        //    return str_name;
        //}


    }

    //老師範例
    //public static string GetCategoryTypeList()
    //{
    //    using (GoPASTAEntities db = new GoPASTAEntities())
    //    {
    //        var data = db.Categorys.OrderBy(m => m.category_no).ToList();
    //        if (data != null)
    //        {

    //                for (int i = 0; i < data.Count; i++)
    //                {
    //                    data[i].category_no = Backend.GetCodeName("Member", data[i].category_no);
    //                }

    //        }
    //        return data;
    //    }
    //}


    //public IPagedList<appadmin.Models.AppMember> GetAppMemberPageList(int page = 1, int pageSize = 10)
    //{
    //    var data = repoAppMember
    //         .ReadAll()
    //         .OrderByDescending(m => m.mno)
    //         .ToPagedList(page, pageSize);
    //    if (data != null)
    //    {
    //        using (tblAppCode appCode = new tblAppCode())
    //        {
    //            for (int i = 0; i < data.Count; i++)
    //            {
    //                data[i].code_no = appCode.GetCodeName("Member", data[i].code_no);
    //            }
    //        }
    //    }
    //    return data;
    //}



}
