﻿<%@ page title="" language="C#" masterpagefile="~/MasterPage/MasterPage.master" enableeventvalidation="false" autoeventwireup="true" inherits="Module_FM2E_Report_Import_EmployeeImport, App_Web__plsqh8b" %>

<%@ Register Assembly="WebUtility" Namespace="WebUtility.WebControls" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageBody" runat="Server">

    SGS<script type="text/javascript" src="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/js/common.js"></script><script type="text/javascript" src="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/js/subModal.js"></script><link href="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/css/subModal.css" rel="stylesheet" type="text/css" /><link href="<%=Page.ResolveUrl("~/") %>Css/modalpopup.css" rel="stylesheet" type="text/css" /><script type="text/javascript" language="javascript">
     </script><asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <cc1:HeadMenuWebControls ID="HeadMenuWebControls1" runat="server" HeadTitleTxt="员工关系管理"
        HeadOPTxt="目前操作功能：员工关系管理">
        <cc1:HeadMenuButtonItem ButtonIcon="back.gif" ButtonName="返回" ButtonUrlType="JavaScript"
            ButtonUrl="window.history.go(-1);" />
    </cc1:HeadMenuWebControls>
    <asp:Panel ID="Panel1" runat="server" Style="display: none; width: 300px">
        <asp:Image ID="Image1" runat="server" Width="300px" />
    </asp:Panel>
    <div style="width: 100%;">
        <cc2:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
            <cc2:TabPanel ID="TabPanelImport" runat="server">
            <HeaderTemplate>员工关系导入</HeaderTemplate>
            <ContentTemplate>
                 <asp:FileUpload ID="FileUpload_ImportDevice" runat="server"  />
                <asp:Button ID="Button_Import" runat="server" Text="导入" OnClick="Button_Import_Click" CssClass="button_bak" />
            </ContentTemplate>
            </cc2:TabPanel>
        </cc2:TabContainer>
    </div>
</asp:Content>
