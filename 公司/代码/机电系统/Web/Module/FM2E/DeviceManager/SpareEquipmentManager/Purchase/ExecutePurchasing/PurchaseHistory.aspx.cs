﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

using WebUtility;
using WebUtility.WebControls;
using WebUtility.Components;

using FM2E.Model.Basic;
using FM2E.Model.System;
using FM2E.Model.Equipment;
using FM2E.Model.Exceptions;

using FM2E.BLL.Basic;
using FM2E.BLL.System;
using FM2E.BLL.Equipment;

public partial class Module_FM2E_DeviceManager_SpareEquipmentManager_Purchase_ExecutePurchasing_PurchaseHistory : System.Web.UI.Page
{
    /// <summary>
    /// 采购管理业务逻辑处理类对象
    /// </summary>
    Purchase purchaseBll = new Purchase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitialPage(); 
        }
    }

    /// <summary>
    /// 初始化页面
    /// </summary>
    private void InitialPage()
    {
        FillData();
    }

    /// <summary>
    /// 换页
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        //if (ScriptManager1.IsInAsyncPostBack && !ScriptManager1.IsNavigating)
        //{
        //    ScriptManager1.AddHistoryPoint("Index", AspNetPager1.CurrentPageIndex.ToString());
        //}
        FillData();
    }

    /// <summary>
    /// 填充列表
    /// </summary>
    private void FillData()
    {
        try
        {
            int pageIndex = AspNetPager1.CurrentPageIndex;
            int listCount = 0;
            IList list = purchaseBll.GetPurchaseOrdersByApplier(pageIndex, AspNetPager1.PageSize, out listCount, Common.Get_UserName);
            AspNetPager1.RecordCount = listCount;
            //排序，先把草稿的排在前面，然后按照UPDATETIME倒序
            //list.Sort(new PurchaseOrderComparer());
            gridview_PurchaseApplyList.DataSource = list;
            gridview_PurchaseApplyList.DataBind();
        }
        catch (Exception ex)
        {
            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "读取信息列表失败", ex, Icon_Type.Error, true, "window.history.go(-1)", UrlType.JavaScript, "");
        }
    }

    /// <summary>
    /// 删除草稿状态下的申请单
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gridview_PurchaseApplyList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        long id = (long)gridview_PurchaseApplyList.DataKeys[e.RowIndex].Values["ID"];
        bool success = false;
        try
        {
            purchaseBll.DeletePurchase(id);
            success = true;
        }
        catch (Exception ex)
        {
            EventMessage.MessageBox(Msg_Type.Error, "删除失败", "删除失败，请刷新后重试", ex, Icon_Type.Error, true, "window.history.go(-1)", UrlType.JavaScript, "");
        }
        if (success)
        {
            FillData(); 
        }
    }

    /// <summary>
    /// 编辑草稿状态下的申请单
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gridview_PurchaseApplyList_RowEditing(object sender, GridViewEditEventArgs e)
    {
        long id = (long)gridview_PurchaseApplyList.DataKeys[e.NewEditIndex].Values["ID"];
        Response.Redirect("PurchaseApply.aspx?id=" + id);
    }
}




