﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true"
    CodeFile="Approval.aspx.cs" Inherits="Module_FM2E_DeviceManager_AssetManager_ScrapManager_ScrapApproval_Approval"
    Title="无标题页" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="WebUtility" Namespace="WebUtility.WebControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageBody" runat="Server">
<script type="text/javascript" src="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/js/common.js"></script>

    <link href="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/css/subModal.css" rel="stylesheet"
        type="text/css" />

    <script type="text/javascript" src="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/js/subModal.js"></script>

    <link href="<%=Page.ResolveUrl("~/") %>Css/modalpopup.css" rel="stylesheet" type="text/css" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <cc1:HeadMenuWebControls ID="HeadMenuWebControls1" runat="server" HeadTitleTxt="设备报废审批"
        HeadHelpTxt="帮助" HeadOPTxt="目前操作功能：报废申请审批">
        <cc1:HeadMenuButtonItem ButtonName="返回" ButtonIcon="back.gif" ButtonPopedom="List"
            ButtonUrl="window.history.go(-1);" ButtonUrlType="JavaScript" />
    </cc1:HeadMenuWebControls>
    <div style="width: 900px; ">
        <cc2:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
            <cc2:TabPanel runat="server" HeaderText="报废申请审批" ID="TabPanel1">
                <ContentTemplate>
                    <div style="width: 880px; text-align: center; vertical-align: top; padding: 0px 0px 0px 0px;">
                        <table style="width: 100%; border-collapse: collapse; vertical-align: middle; text-align: left;
                            text-indent: 13px; border: solid 1px #a7c5e2;" border="1px">
                            <tr>
                                <td style="width: 20%">
                                    报废单编号：
                                </td>
                                <td style="width: 30%">
                                    <asp:Label ID="lbSheetName" runat="server" Text="Label"></asp:Label>
                                    &nbsp;
                                </td>
                                <td style="width: 20%">
                                    公司：
                                </td>
                                <td style="width: 30%">
                                    <asp:Label ID="lbCompany" runat="server" Text="Label"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    部门：
                                </td>
                                <td style="width: 30%">
                                    <asp:Label ID="lbDep" runat="server" Text="Label"></asp:Label>
                                    &nbsp;
                                </td>
                                <td style="width: 20%">
                                    申请人：
                                </td>
                                <td style="width: 30%">
                                    <asp:Label ID="lbApplicant" runat="server" Text="Label"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    报废设备：
                                </td>
                                <td style="width: 30%" >
                                    <asp:Label ID="lbEquipment" runat="server" Text=""></asp:Label>
                                    &nbsp;
                                </td><td style="width: 20%">
                                    报废设备条码：
                                </td>
                                <td style="width: 30%" >
                                    <asp:Literal ID="lbEquipmentNo" runat="server" Text=""></asp:Literal>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    报废原因：
                                </td>
                                <td style="width: 30%" colspan="3">
                                    <asp:Label ID="lbReason" runat="server" Text=""></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                             <tr>
                            <td style="height: 30px;">
                                附件记录：
                            </td>
                            <td colspan="3">                               
                                <asp:HyperLink ID="HyperLink_File" ForeColor="Blue" Font-Underline="true"
                                runat="server" ></asp:HyperLink>
                            </td>
                        </tr>
                            <td style="width: 20%">
                                备注：
                            </td>
                            <td style="width: 30%" colspan="3">
                                <asp:Label ID="lbRemark" runat="server" Text=""></asp:Label>
                                &nbsp;
                            </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    申请单状态：
                                </td>
                                <td style="width: 30%">
                                    <asp:Label ID="lbStatus" runat="server" Text="Label"></asp:Label>
                                    &nbsp;
                                </td>
                                <td style="width: 20%">
                                    申请时间：
                                </td>
                                <td style="width: 30%">
                                    <asp:Label ID="lbApplyDate" runat="server" Text="Label"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table style="width: 100%; border-collapse: collapse; vertical-align: middle; text-align: left;
                            text-indent: 13px; border: solid 1px #a7c5e2;" border="1px">
                            <tr>
                                <td class="Table_searchtitle" style="width: 20%">
                                    审批历史
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1%>
                                                </ItemTemplate>
                                                <HeaderStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ApprovalerName" HeaderText="审批人">
                                                <HeaderStyle Width="100px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="审批结果">
                                                <ItemTemplate>
                                                    <%#Convert.ToBoolean(Eval("Result"))?"通过":"不通过" %>
                                                </ItemTemplate>
                                                <HeaderStyle Width="100px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ApprovalDate" HeaderText="审批时间">
                                                <HeaderStyle Width="100px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="FeeBack" HeaderText="审批备注"></asp:BoundField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            暂没审批记录
                                        </EmptyDataTemplate>
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#EFEFEF" Height="25px" />
                                        <RowStyle HorizontalAlign="Center" Height="20px" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <div style="width: 100%" id="ApprovalPanel" runat="server">
                            <hr />
                            <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#cccccc"
                                style="border-collapse: collapse;">
                                <tr>
                                    <td class="Table_searchtitle" colspan="2">
                                        设备报废申请单审批
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table_body table_body_NoWidth" style="height: 30px">
                                        审批结果：
                                    </td>
                                    <td class="table_none table_none_NoWidth" style="height: 30px" colspan="3">
                                        <asp:DropDownList ID="DDLApproval" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table_body table_body_NoWidth">
                                        反馈意见：
                                    </td>
                                    <td class="table_none table_none_NoWidth" style="height: 30px" colspan="3">
                                        <asp:TextBox ID="tbFeeBack" runat="server" TextMode="MultiLine" title="请输入反馈意见~50:"
                                            Height="58px" Width="507px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%">
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="errMsg" ForeColor="Red" runat="server"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="Button1" runat="server" CssClass="button_bak" Text="提交审批" OnClick="Button1_Click" />
                                        <input type="button" class="button_bak" value="关闭" onclick="javascript:window.location.href='ScrapApproval.aspx'" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </ContentTemplate>
            </cc2:TabPanel>
        </cc2:TabContainer>
    </div>
</asp:Content>
