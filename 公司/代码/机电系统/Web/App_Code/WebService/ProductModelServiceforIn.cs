﻿using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Collections.Generic;
using AjaxControlToolkit;
using FM2E.BLL.Equipment;
using FM2E.Model.Equipment;
using FM2E.Model.Utils;
using System.Collections.Specialized;

/// <summary>
///ProductModelService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。 
[System.Web.Script.Services.ScriptService]
public class ProductModelServiceforIn : System.Web.Services.WebService
{

    public ProductModelServiceforIn()
    {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public CascadingDropDownNameValue[] GetProduct(string knownCategoryValues, string category)
    {
        List<CascadingDropDownNameValue> ProductList = new List<CascadingDropDownNameValue>();
        Expendable bll = new Expendable();
        IList list = bll.GetAllExpendableName();
        foreach (ExpendableInfo item in list)
        {
            ProductList.Add(new CascadingDropDownNameValue(item.Name, item.Name));
        }
        return ProductList.ToArray();
    }
    [WebMethod]
    public CascadingDropDownNameValue[] GetModel(string knownCategoryValues, string category)
    {
        List<CascadingDropDownNameValue> ModelList = new List<CascadingDropDownNameValue>();
        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        string productname = kv["Product"];
        Expendable bll = new Expendable();
        IList list = bll.GetAllExpendableModelbyName(productname);
        foreach (ExpendableInfo item in list)
        {
            ModelList.Add(new CascadingDropDownNameValue(item.Model, item.ExpendableID.ToString()));
        }
        return ModelList.ToArray();
    }
    [WebMethod]
    public string[] GetProductNameList(string prefixText, int count)
    {
        Expendable bll = new Expendable();
        IList<string> list = bll.GetProductNames(prefixText, count);
        return list.ToArray();
    }

    [WebMethod]
    public string[] GetProductModelList(string prefixText, int count)
    {
        Expendable bll = new Expendable();
        IList<string> list = bll.GetProductModels(prefixText, count);
        return list.ToArray();
    }
}

