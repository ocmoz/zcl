﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

using WebUtility;
using WebUtility.WebControls;
using WebUtility.Components;
using FM2E.BLL.Basic;
using FM2E.Model.Basic;

public partial class Module_FM2E_BasicData_SectionManage_ViewSection : System.Web.UI.Page
{
    string cmd = (string)Common.sink("cmd", MethodType.Get, 50, 0, DataType.Str);
    string id = (string)Common.sink("id", MethodType.Get, 50, 0, DataType.Str);

    protected void Page_Load(object sender, EventArgs e)
    {
        SystemPermission.CheckCommandPermission(cmd);
        if (!IsPostBack)
        {
            FillDate();
            ButtonBind();
        }
    }

    private void FillDate()
    {
        Section Section = new Section();
        SectionInfo s = Section.GetSection(id);
        Session["SectionInfo"] = s;
        Label1.Text = s.SectionID.ToString();
        Label2.Text = s.SectionName;
        Label3.Text = s.CompanyName;
        Label4.Text = s.Length.ToString();
        Label5.Text = s.OpenTime.ToShortDateString();
        Label6.Text = s.PictureUrl;
        Label7.Text = s.Remark;
        if (s.PictureUrl != null && s.PictureUrl != "")
        {
            if (System.IO.File.Exists(Server.MapPath(s.PictureUrl)))
                Image1.ImageUrl = s.PictureUrl;
            else
                Image1.ImageUrl = "~/images/deletedpicture.gif";
        }
        else Image1.ImageUrl = "~/images/nopicture.gif";
    }
    private void ButtonBind()
    {
        if (cmd == "view")
        {
            //删除
            HeadMenuButtonItem button = HeadMenuWebControls1.ButtonList[1];
            button.ButtonUrlType = UrlType.JavaScript;
            button.ButtonUrl = string.Format("DelData('?cmd=delete&id={0}');", id);
            //修改
            button = HeadMenuWebControls1.ButtonList[0];
            button.ButtonUrlType = UrlType.Href;
            button.ButtonUrl = string.Format("EditSection.aspx?cmd=edit&id={0}", id);
        }
        else if (cmd == "delete")
        {
            //执行删除操作
            bool bSuccess = false;
            try
            {
                Section Section = new Section();
                Section.DelSection(id);
                bSuccess = true;
            }
            catch (Exception ex)
            {
                EventMessage.MessageBox(Msg_Type.Error, "操作失败", "删除路段失败", ex, Icon_Type.Error, true, "window.history.go(-1)", UrlType.JavaScript, "");
            }
            if (bSuccess)
                EventMessage.MessageBox(Msg_Type.Info, "操作成功", "删除路段(ID:" + id + ")成功！", Icon_Type.OK, true, Common.GetHomeBaseUrl("Section.aspx"), UrlType.Href, "");
        }
    }
}
