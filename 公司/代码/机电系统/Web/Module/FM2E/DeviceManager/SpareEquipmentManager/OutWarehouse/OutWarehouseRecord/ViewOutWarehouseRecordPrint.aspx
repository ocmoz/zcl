﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageNoCheck.master"
    AutoEventWireup="true" CodeFile="ViewOutWarehouseRecordPrint.aspx.cs" Inherits="Module_FM2E_DeviceManager_SpareEquipmentManager_OutWarehouse_OutWarehouseRecord_ViewOutWarehouseRecordPrint" %>

<%@ Register Assembly="WebUtility" Namespace="WebUtility.WebControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageBody" runat="Server">

    <script type="text/javascript" src="<%=Page.ResolveUrl("~/") %>js/Common.js"></script>
    
    <div style="width: 100%; text-align: center;">
        <table style="width:649px;border-collapse: collapse; margin: auto;" cellpadding="0" cellspacing="0" border="1" bordercolor="#000000">
            <tr>
            <td class="Table_searchtitle" colspan="4">设备出库信息
            </td>
            </tr>
            <tr>
                <td class="table_body table_body_NoWidth" style="width: 15%">
                    申请单编号：
                </td>
                <td class="table_none table_none_NoWidth" style="width: 35%">
                    <asp:Label ID="Label_SheetName" runat="server"></asp:Label>
                </td>
                <td class="table_body table_body_NoWidth" style="width: 15%">
                    仓库：
                </td>
                <td class="table_none table_none_NoWidth" style="width: 35%">
                    <asp:Label ID="Label_WarehouseName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="table_body table_body_NoWidth">
                    申请人：
                </td>
                <td class="table_none table_none_NoWidth">
                    <asp:Label ID="Label_ApplicantName" runat="server"></asp:Label>
                </td>
                <td class="table_body table_body_NoWidth">
                    申请日期：
                </td>
                <td class="table_none table_none_NoWidth">
                    <asp:Label ID="Label_ApplyTime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="table_body table_body_NoWidth">
                    申请备注：
                </td>
                <td colspan="3" class="table_none table_none_NoWidth">
                    <asp:Label ID="Label_ApplyRemark" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="table_body table_body_NoWidth">
                    状态：
                </td>
                <td class="table_none table_none_NoWidth">
                    <asp:Label ID="Label_Status" runat="server"></asp:Label>
                </td>
                <td class="table_body table_body_NoWidth">
                    仓管员：
                </td>
                <td class="table_none table_none_NoWidth">
                    <asp:Label ID="Label_OperatorName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="table_body table_body_NoWidth">
                    经办人：
                </td>
                <td class="table_none table_none_NoWidth">
                    <asp:Label ID="Label_ReceiverName" runat="server"></asp:Label>
                </td>
                <td class="table_body table_body_NoWidth">
                    领用时间：
                </td>
                <td class="table_none table_none_NoWidth">
                    <asp:Label ID="Label_OutTime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="table_body table_body_NoWidth">
                    出库备注：
                </td>
                <td class="table_none table_none_NoWidth" colspan="3">
                    <asp:Label ID="Label_WarehouseRemark" runat="server"></asp:Label>             
            </tr>
            <tr>
                   </td>
                   <td class="table_body table_body_NoWidth">
                    领用人：
                </td>
                <td class="table_none table_none_NoWidth" colspan="3">
                 <asp:Label ID="LabelArea1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="Table_searchtitle" colspan="4">
                    出库申请明细
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div style="width: 100%; text-align: center; vertical-align: top; padding: 0px 0px 0px 0px;">
                        <table style="width: 100%; border-collapse: collapse; vertical-align: middle; border: solid 1px #a7c5e2;"
                            border="1px">
                            <tr>
                                <th class="table_body table_body_NoWidth" style="width: 5%; text-align: center">
                                    序号
                                </th>
                                <th class="table_body table_body_NoWidth" style="width: 10%; text-align: center">
                                    系统
                                </th>
                                <th class="table_body table_body_NoWidth" style="width: 10%; text-align: center">
                                    产品名称
                                </th>
                                <th class="table_body table_body_NoWidth" style="width: 10%; text-align: center">
                                    规格型号
                                </th>
                                <th class="table_body table_body_NoWidth" style="width: 10%; text-align: center">
                                    申请数量
                                </th>
                                <th class="table_body table_body_NoWidth" style="width: 10%; text-align: center">
                                    已出库数量
                                </th>
                                <th class="table_body table_body_NoWidth" style="width: 5%; text-align: center">
                                    单位
                                </th>
                                <th class="table_body table_body_NoWidth" style="width: 15%; text-align: center">
                                    使用地址
                                </th>
                                <th class="table_body table_body_NoWidth" style="width: 15%; text-align: center">
                                    备注
                                </th>
                            </tr>
                            <asp:Repeater ID="Repeater_Detail" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td rowspan="2">
                                            <%# Container.ItemIndex + 1%>
                                        </td>
                                        <td>
                                            <%# Eval("SystemName") %>
                                        </td>
                                        <td>
                                            <%# Eval("ProductName") %>
                                        </td>
                                        <td>
                                            <%# Eval("Model") %>
                                        </td>
                                        <td>
                                            <%# Eval("Count","{0:#,0.#####}") %>
                                        </td>
                                        <td>
                                            <%#Eval("OutCount","{0:#,0.#####}") %>
                                        </td>
                                        <td>
                                            <%# Eval("Unit") %>
                                        </td>
                                        <td>
                                            <%# Eval("AddressName") %>
                                        </td>
                                        <td>
                                            <%# Eval("Remark") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="9">
                                            <asp:GridView ID="GridView_OutDetail" runat="server" AutoGenerateColumns="False"
                                                Width="100%" DataSource='<%# Eval("OutEquipmentList") %>'>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号">
                                                        <ItemTemplate>
                                                            [<%# Container.DataItemIndex + 1%>]
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="25px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="EquipmentNO" HeaderText="设备条形码"></asp:BoundField>
                                                    <asp:BoundField DataField="Name" HeaderText="产品名称"></asp:BoundField>
                                                    <asp:BoundField DataField="Model" HeaderText="型号"></asp:BoundField>
                                                    <asp:BoundField DataField="Count" DataFormatString="{0:#,0.#####}" HeaderText="数量">
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Unit" HeaderText="单位"></asp:BoundField>
                                                    <asp:BoundField DataField="OutTime" DataFormatString="{0:yyyy-MM-dd HH:mm}" HtmlEncode="false"
                                                        HeaderText="出库时间"></asp:BoundField>
                                                    <asp:BoundField DataField="AddressName" HeaderText="使用地址"></asp:BoundField>
                                                    <asp:BoundField DataField="Remark" HeaderText="备注"></asp:BoundField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <center>
                                                        <span style="color: Red">没有出库明细信息 </span>
                                                    </center>
                                                </EmptyDataTemplate>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#EFEFEF" Height="25px" />
                                                <RowStyle HorizontalAlign="Center" Height="20px" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </td>
            </tr>           
           
            <tr>
                <td class="Table_searchtitle" colspan="4">
                    审批记录
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="gridview_ApprovalRecord" runat="server" AutoGenerateColumns="False"
                        HeaderStyle-BackColor="#efefef" HeaderStyle-Height="25px" RowStyle-Height="20px"
                        Width="100%" HeaderStyle-HorizontalAlign="center" RowStyle-HorizontalAlign="center">
                        <Columns>
                            <asp:TemplateField HeaderText="审批人 ">
                                <ItemTemplate>
                                    <asp:Label ID="Label_Approvaler" runat="server" Text='<%# Eval("ApprovalerName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="审批结果">
                                <ItemTemplate>
                                    <asp:Label ID="Label_ApprovalResult" runat="server" Text='<%# Eval("Result") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="反馈意见">
                                <ItemTemplate>
                                    <asp:Label ID="Label_FeeBack" runat="server" Text='<%# Eval("FeedBack") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="25%" HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="审批时间">
                                <ItemTemplate>
                                    <asp:Label ID="Label_ApprovalDate" runat="server" Text='<%# Eval("ApprovalTime", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="10%" />
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle Height="20px" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#EFEFEF" Height="25px" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <center>
                                <span style="color: Red">未经审批</span></center>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    
    <object id='WebBrowser' width="0" height="0" classid='CLSID:8856F961-340A-11D0-A96B-00C04FD705A2'>
    </object>

    <script language="javascript" type="text/javascript">
        PrintPreview('WebBrowser');
    </script>

</asp:Content>
