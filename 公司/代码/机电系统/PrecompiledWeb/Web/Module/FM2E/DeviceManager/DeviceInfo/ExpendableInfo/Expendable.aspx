<%@ page language="C#" masterpagefile="~/MasterPage/MasterPage.master" autoeventwireup="true" inherits="Module_FM2E_DeviceManager_DeviceInfo_ExpendableInfo_Expendable, App_Web_4xxpdmqi" enableeventvalidation="false" %>

<%@ Register Assembly="WebUtility" Namespace="WebUtility.WebControls" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageBody" runat="Server">

    <script type="text/javascript" src="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/js/common.js"></script>

    <script type="text/javascript" src="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/js/subModal.js"></script>

    <link href="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/css/subModal.css" rel="stylesheet"
        type="text/css" />
    <link href="<%=Page.ResolveUrl("~/") %>Css/modalpopup.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" language="javascript">
        
        //触发返回后重新加载数据事件
        function BackFillData()
        {
            document.getElementById('<%= Button_FillData.ClientID %>').click();
        }
        
        //弹出修改窗口
        function showChangeWin(id)
        {
            var expendableid=document.getElementById(id.replace("ImageButton_Change", "Hidden_ExpendableID")).value;
            showPopWin("修改易耗品", "ExpendableRecord.aspx?cmd=edit&id=" + expendableid, 900, 380, BackFillData, false, true);
        }
        
        //弹出入库窗口
        function showInWarehouseWin(id)
        {
            var expendableid=document.getElementById(id.replace("ImageButton_InWarehouse", "Hidden_ExpendableID")).value;
            showPopWin("增加入库", "InWarehouse.aspx?cmd=add&id=" + expendableid, 900, 380, BackFillData, true, true);
        }
        
        //弹出出库窗口
        function showOutWarehouseWin(id)
        {
            var expendableid=document.getElementById(id.replace("ImageButton_OutWarehouse", "Hidden_ExpendableID")).value;
            showPopWin("执行出库", "OutWarehouse.aspx?cmd=add&id=" + expendableid, 900, 380, BackFillData, true, true);
        }

        //整套入库
        function showWin(id) {
            var expendableid = document.getElementById(id.replace("ImageButton_Log", "Hidden_ExpendableID")).value;
            showPopWin("出入库记录", "InOutWarehouseRecord.aspx?id=" + expendableid, 900, 410, null, true, true);
        }
        
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"  OnNavigate="ScriptManager1_Navigate" EnableHistory="true">
    </asp:ScriptManager>
    <cc1:HeadMenuWebControls ID="HeadMenuWebControls1" runat="server" HeadTitleTxt="易耗品信息维护"
        HeadOPTxt="目前操作功能：易耗品信息维护" HeadHelpTxt="易耗品列表默认显示新增易耗品">
        <cc1:HeadMenuButtonItem ButtonIcon="new.gif" ButtonName="添加易耗品" ButtonPopedom="New"
            ButtonVisible="true" ButtonUrlType="href" ButtonUrl="EditExpendable.aspx?cmd=add" />
        <cc1:HeadMenuButtonItem ButtonIcon="edit.gif" ButtonName="导入易耗品" ButtonPopedom="List"
            ButtonUrlType="href" ButtonUrl="ImportExpendables.aspx" />
        <cc1:HeadMenuButtonItem ButtonIcon="xls.gif" ButtonName="易耗品统计" ButtonPopedom="List"
            ButtonUrlType="href" ButtonUrl="Statistic.aspx" />
        <cc1:HeadMenuButtonItem ButtonIcon="list.gif" ButtonName="易耗品列表" ButtonPopedom="List"
            ButtonUrlType="href" ButtonUrl="Expendable.aspx" />
            <cc1:HeadMenuButtonItem ButtonIcon="look.gif" ButtonName="导入数据审批" ButtonPopedom="List"
            ButtonUrlType="href" ButtonUrl="ImportApproval.aspx" />
            <cc1:HeadMenuButtonItem ButtonIcon="xls.gif" ButtonName="导出易耗品" ButtonPopedom="List"
            ButtonUrlType="href" ButtonUrl="ExportFile.aspx" />
        <cc1:HeadMenuButtonItem ButtonIcon="back.gif" ButtonName="返回" ButtonUrlType="javaScript"
            ButtonUrl="window.history.go(-1);" />
    </cc1:HeadMenuWebControls>
    <asp:Panel ID="Panel1" runat="server" Style="display: none; width: 300px">
        <asp:Image ID="Image1" runat="server" Width="300px" />
    </asp:Panel>
    
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table style="width: 99%;">
                <tr>
                    <td style="width: 15%" align="left" valign="top">
                        <div style="width: 100%; overflow: auto;">
                            <asp:TreeView ID="TreeTypeView" runat="server" ShowLines="true" OnSelectedNodeChanged="TreeTypeView_SelectedNodeChanged"
                                SelectedNodeStyle-ForeColor="Red" SelectedNodeStyle-Font-Bold="true">
                            </asp:TreeView>
                        </div>
                    </td>
                    <td style="width: 85%" align="left" valign="top">
                        <div style="width: 100%;">
                            <cc2:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                                <cc2:TabPanel runat="server" HeaderText="易耗品列表" ID="TabPanel1">
                                    <HeaderTemplate>
                                        易耗品列表
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    名称：<asp:TextBox ID="TextBox_FilterName" runat="server"></asp:TextBox>
                                                    <cc2:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="TextBox_FilterName"
                                                        ServicePath="ProductModelServiceforIn.asmx" ServiceMethod="GetProductNameList"
                                                        MinimumPrefixLength="1" CompletionInterval="500" DelimiterCharacters="" Enabled="True">
                                                    </cc2:AutoCompleteExtender>
                                                </td>
                                                <td>
                                                    型号：<asp:TextBox ID="TextBox_FilterModel" runat="server"></asp:TextBox>
                                                    <cc2:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" TargetControlID="TextBox_FilterModel"
                                                        ServicePath="ProductModelServiceforIn.asmx" ServiceMethod="GetProductModelList"
                                                        MinimumPrefixLength="1" CompletionInterval="500" DelimiterCharacters="" Enabled="True">
                                                    </cc2:AutoCompleteExtender>
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button_Filter" runat="server" Text="筛选" OnClick="Button_Filter_Click"
                                                        CssClass="button_bak" />
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="width: 100%; text-align: center; vertical-align: top; padding: 0px 0px 0px 0px;">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                                                OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="位置">
                                                        <ItemTemplate>
                                                            <input type="hidden" id="Hidden_ExpendableID" value='<%# Eval("ExpendableID") %>'
                                                                runat="server" />
                                                            <asp:Label ID="Label_CompanyName" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label>
                                                            <input type="hidden" id="Hidden_CompanyID" value='<%# Eval("CompanyID") %>' runat="server" />
                                                   
                                                            <asp:Label ID="Label_WarehouseName" runat="server" Text='<%# Eval("WarehouseName") %>'></asp:Label>
                                                            <input type="hidden" id="Hidden_WarehouseID" value='<%# Eval("WarehouseID") %>' runat="server" />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="10%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="名称">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label_Name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                            <input type="hidden" id="Hidden_CategoryID" value='<%# Eval("CategoryID") %>' runat="server" />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="12%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="型号规格">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label_Model" runat="server" Text='<%# Eval("Model") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label_Specification" runat="server" Text='<%# Eval("Specification") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="8%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="库存">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label_Count" runat="server" Text='<%# Eval("Count","{0:0.##}") %>'></asp:Label>
                                                          </ItemTemplate>
                                                        <ItemStyle Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="单位">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label_Unit" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="单价（元）">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label_Price" runat="server" Text='<%# Eval("Price","{0:0.##}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="备注">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label_Remark" runat="server" Text='<%# Eval("Remark") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="12%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="修改" ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:Image ID="ImageButton_Change" runat="server" ImageUrl="~/images/ICON/edit.gif"
                                                               onclick='javascript:showChangeWin(this.id);'  
                                                              />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="4%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="入库" ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:Image ID="ImageButton_InWarehouse" runat="server" ImageUrl="~/images/ICON/approval.gif"
                                                               onclick='javascript:showInWarehouseWin(this.id);'  
                                                              />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="4%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="出库" ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:Image ID="ImageButton_OutWarehouse" runat="server" ImageUrl="~/images/ICON/move.gif"
                                                               onclick='javascript:showOutWarehouseWin(this.id);'  
                                                              />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="4%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemStyle Width="4%" />
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/ICON/delete.gif"
                                                                CommandName="del" CommandArgument="<%# Container.DataItemIndex %>" OnClientClick="return confirm('确认要删除此消耗品信息吗？')"
                                                                CausesValidation="false" />
                                                        </ItemTemplate>
                                                        <HeaderTemplate>
                                                            删除</HeaderTemplate>
                                                    </asp:TemplateField>
                                                    
                                                    <asp:TemplateField>
                                                        <ItemStyle Width="5%" />
                                                        <ItemTemplate>
                                                            <asp:Image ID="ImageButton_Log" runat="server" ImageUrl="~/images/ICON/select.gif"
                                                               onclick='javascript:showWin(this.id);'  
                                                              />
                                                        </ItemTemplate>
                                                        <HeaderTemplate>
                                                            记录</HeaderTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                  <center><span style="color:Red">  没有符合条件的易耗品</span></center>
                                                </EmptyDataTemplate>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#EFEFEF" Height="25px" />
                                                <RowStyle HorizontalAlign="Center" Height="20px" />
                                            </asp:GridView>
                                            <cc1:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="True" OnPageChanged="AspNetPager1_PageChanged"
                                                CssClass="" CustomInfoClass="" CustomInfoHTML="总记录：0  页码：1/1  每页：10" InvalidPageIndexErrorMessage="页索引不是有效的数值！"
                                                NavigationToolTipTextFormatString="" PageIndexOutOfRangeErrorMessage="页索引超出范围！"
                                                ShowCustomInfoExpendable="Left">
                                            </cc1:AspNetPager>
                                            <input id="Button_FillData" type="button" runat="server" value="重新加载数据" style="display: none"
                                                onserverclick="Button_FillData_Click" />
                                        </div>
                                    </ContentTemplate>
                                </cc2:TabPanel>
                                <cc2:TabPanel runat="server" HeaderText="易耗品查询" ID="TabPanel2">
                                    <ContentTemplate>
                                        <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#cccccc"
                                            style="border-collapse: collapse;">
                                            <tr>
                                                <td class="Table_searchtitle" colspan="4">
                                                    组合查询（支持模糊查询）
                                                </td>
                                            </tr>
                                            <tr style="height: 30px; display: <%= IsShow %>">
                                                <td class="table_body table_body_NoWidth">
                                                    公司：
                                                </td>
                                                <td class="table_none table_none_NoWidth" colspan="3">
                                                    <asp:DropDownList ID="DDLCompany" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr style="height: 30px; display: <%= IsShow2 %>">
                                                <td class="table_body table_body_NoWidth" style="height: 30px">
                                                    仓库：
                                                </td>
                                                <td class="table_none table_none_NoWidth" style="height: 30px" colspan="3">
                                                    <asp:DropDownList ID="DDLWarehouse" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table_body table_body_NoWidth" style="width: 15%">
                                                    名称：
                                                </td>
                                                <td class="table_none table_none_NoWidth" style="width: 35%">
                                                    <asp:TextBox ID="TbName" runat="server"></asp:TextBox>
                                                </td>
                                                <td class="table_body table_body_NoWidth" style="width: 15%">
                                                    型号：
                                                </td>
                                                <td class="table_none table_none_NoWidth" style="width: 35%">
                                                    <asp:TextBox ID="TextBox_Model" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <cc2:CascadingDropDown ID="CascadingDropDown1" runat="server" TargetControlID="DDLCompany"
                                                Category="Company" PromptText="请选择公司..." LoadingText="公司加载中..." ServicePath="CompanyWarehouseService.asmx"
                                                ServiceMethod="GetCompany" Enabled="True">
                                            </cc2:CascadingDropDown>
                                            <cc2:CascadingDropDown ID="CascadingDropDown2" runat="server" TargetControlID="DDLWarehouse"
                                                Category="Warehouse" PromptText="请选择仓库..." LoadingText="仓库加载中..." ServicePath="CompanyWarehouseService.asmx"
                                                ServiceMethod="GetWarehouse" ParentControlID="DDLCompany" Enabled="True">
                                            </cc2:CascadingDropDown>
                                        </table>
                                        <center>
                                            <asp:Button ID="Button1" runat="server" CssClass="button_bak" Text="确定" OnClick="Button1_Click" />
                                            <asp:Button ID="Button2" runat="server" CssClass="button_bak" Height="20px" OnClick="Button2_Click"
                                                Text="重填" Width="61px" />
                                        </center>
                                    </ContentTemplate>
                                </cc2:TabPanel>
                            </cc2:TabContainer>
                        </div>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
