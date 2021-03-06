<%@ page title="" language="C#" masterpagefile="~/MasterPage/MasterPageNoCheck.master" autoeventwireup="true" enableeventvalidation="false" inherits="Module_FM2E_MaintainManager_MalFunctionManager_MalfunctionMaintain_MalfunctionHandle, App_Web_roqfceyc" %>

<%@ Register Assembly="WebUtility" Namespace="WebUtility.WebControls" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageBody" runat="Server">

    <script type="text/javascript" src="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/js/common.js"></script>

    <link href="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/css/subModal.css" rel="stylesheet"
        type="text/css" />

    <script type="text/javascript" src="<%=Page.ResolveUrl("~/") %>inc/FineMessBox/js/subModal.js"></script>

    <link href="<%=Page.ResolveUrl("~/") %>Css/modalpopup.css" rel="stylesheet" type="text/css" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" OnNavigate="ScriptManager1_Navigate">
    </asp:ScriptManager>
    <cc1:HeadMenuWebControls ID="HeadMenuWebControls1" runat="server" HeadTitleTxt="故障处理"
        HeadOPTxt="目前操作功能：故障处理" HeadHelpTxt="帮助">
        <cc1:HeadMenuButtonItem ButtonIcon="back.gif" ButtonName="返回" ButtonPopedom="List" />
    </cc1:HeadMenuWebControls>
    <div style="width: 100%;text-align:center;">
        <cc2:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
            <cc2:TabPanel runat="server" HeaderText="故障单受理登记" ID="TabPanel1">
                <HeaderTemplate>
                    故障单受理登记
                </HeaderTemplate>
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="0" border="1" bordercolor="#cccccc"
                        style="border-collapse: collapse; width:100%;">
                        <tr>
                            <td colspan="4" rowspan="2" class="table_body_WithoutWidth">
                                <b style="font-family: 宋体; font-size: medium">
                                    <asp:Label ID="lbCompany" runat="server" Text="XX"></asp:Label>
                                    维修处理单</b>
                            </td>
                            <td colspan="2" class="table_body_WithoutWidth">
                                表单编号
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <asp:Label ID="lbSheetNO" runat="server" Style=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="Table_searchtitle" style="height: 30px">
                                报修情况
                            </td>
                        </tr>
                        <tr>
                            <td class="table_body_WithoutWidth" style="width: 16%">
                                报修单位
                            </td>
                            <td style="width: 18%" class="table_none_WithoutWidth">
                                <asp:Label ID="lbDepartment" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="table_body_WithoutWidth" style="width: 16%">
                                报修人
                            </td>
                            <td style="width: 17%" class="table_none_WithoutWidth">
                                <asp:Label ID="lbReporter" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="table_body_WithoutWidth" style="width: 16%">
                                日期
                            </td>
                            <td style="width: 17%" class="table_none_WithoutWidth">
                                <asp:Label ID="lbReportTime" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="table_body_WithoutWidth">
                                故障设备条形码
                            </td>
                            <td class="table_none_WithoutWidth" colspan="1">
                                <asp:Label ID="lbEqNo" runat="server"></asp:Label>
                            </td>
                            <td class="table_body_WithoutWidth">
                                故障设备名称
                            </td>
                            <td class="table_none_WithoutWidth" colspan="1">
                                <asp:Label ID="lbEqName" runat="server"></asp:Label>
                            </td>
                            <td class="table_body_WithoutWidth">
                                所属系统
                            </td>
                            <td class="table_none_WithoutWidth" colspan="1">
                                <asp:Label ID="lbEqSystem" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="table_body_WithoutWidth">
                                故障设备地址
                            </td>
                            <td class="table_none_WithoutWidth" colspan="5">
                                <asp:Label ID="lbAddress" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="table_body_WithoutWidth">
                                故障描述
                            </td>
                            <td class="table_none_WithoutWidth" colspan="5">
                                <asp:Label ID="lbDescription" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="table_body_WithoutWidth">
                                故障原因
                            </td>
                            <td class="table_none_WithoutWidth">
                                <asp:Label ID="lbMalReason" runat="server"></asp:Label>
                            </td>
                            <td class="table_body_WithoutWidth">
                                维修单位
                            </td>
                            <td class="table_none_WithoutWidth">
                                <asp:Label ID="lbMaintainTeam" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="table_body_WithoutWidth">
                                故障等级
                            </td>
                            <td class="table_none_WithoutWidth">
                                <asp:Label ID="lbMalfunctionRank" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="table_body_WithoutWidth " style="height: 30px;">
                                故障记录部门：
                            </td>
                            <td class="table_none_WithoutWidth " style="height: 30px;" colspan="2">
                                <asp:Label ID="lbRecordDept" runat="server" Text="Label"></asp:Label>
                                &nbsp;
                            </td>
                            <td class="table_body_WithoutWidth " style="height: 30px;">
                                故障记录人：
                            </td>
                            <td class="table_none_WithoutWidth " style="height: 30px;" colspan="2">
                                <asp:Label ID="lbRecorder" runat="server" Text="Label"></asp:Label>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="table_body_WithoutWidth " style="height: 30px;">
                                故障处理单状态：
                            </td>
                            <td class="table_none_WithoutWidth " style="height: 30px;" colspan="2">
                                <asp:Label ID="lbStatus" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                                &nbsp;
                            </td>
                            <td class="table_body_WithoutWidth " style="height: 30px;">
                                最近更新时间：
                            </td>
                            <td class="table_none_WithoutWidth " style="height: 30px;" colspan="2">
                                <asp:Label ID="lbUpdateTime" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                                &nbsp;
                            </td>
                        </tr>
                        <tr id="repairDiv" runat="server">
                            <td id="Td1" class="table_body_WithoutWidth " style="height: 30px;" runat="server">
                                修复时间推迟：
                            </td>
                            <td id="Td2" class="table_none_WithoutWidth " style="height: 30px;" colspan="5" runat="server">
                                <asp:TextBox ID="TB_RepairedTime" runat="server" Columns="5"></asp:TextBox>
                                <asp:DropDownList ID="DDL_RepairedUnit" runat="server" title="请选择时间单位~!">
                                    <asp:ListItem Text="分" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="时" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="天" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="月" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;&nbsp; 修改人：
                                <asp:Label ID="editor" runat="server" ForeColor="Red"></asp:Label>
                                &nbsp;&nbsp; 修改理由：
                                <asp:TextBox ID="editreason" runat="server" Width="80%" TextMode="MultiLine" Rows="2"
                                    MaxLength="200"></asp:TextBox>
                                <span style="color: Red">(不填写不会推迟)<asp:Label runat="server" ID="Label1"></asp:Label></span>
                            </td>
                        </tr>
                    </table>
                    <hr style="width: 95%" />
                    <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#cccccc"
                        style="border-collapse: collapse;" id="tableRepairRecord" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td3" class="Table_searchtitle" style="height: 30px;" colspan="4" runat="server">
                                维修情况登记
                            </td>
                        </tr>
                        <tr id="Tr2" runat="server">
                            <td id="Td4" class="table_body_WithoutWidth " style="height: 30px; width: 15%" runat="server">
                                维修单位：
                            </td>
                            <td id="Td5" class="table_none_WithoutWidth " style="height: 30px; width: 35%" runat="server">
                                <asp:Label ID="lbMaintainTeamx" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td id="Td6" class="table_body_WithoutWidth " style="height: 30px; width: 15%" runat="server">
                                受理人：
                            </td>
                            <td id="Td7" class="table_none_WithoutWidth " style="height: 30px; width: 35%" runat="server">
                                <asp:Label ID="lbReceiver" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr id="Tr3" runat="server">
                            <td id="Td8" class="table_body_WithoutWidth " style="height: 30px; width: 15%" runat="server">
                                受理日期：
                            </td>
                            <td id="Td9" class="table_none_WithoutWidth " style="height: 30px; width: 35%" runat="server">
                                <asp:Label ID="lbReceiveDate" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td id="Td10" class="table_body_WithoutWidth " style="height: 30px; width: 15%" runat="server">
                                维修日期：
                            </td>
                            <td id="Td11" class="table_none_WithoutWidth " style="height: 30px; width: 35%" runat="server">
                                <asp:Label ID="lbMaintainDate" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr id="Tr4" runat="server">
                            <td id="Td12" class="table_body_WithoutWidth " style="height: 30px; width: 15%" runat="server">
                                修复程度：
                            </td>
                            <td id="Td13" class="table_none_WithoutWidth " style="height: 30px; width: 35%" runat="server">
                                <asp:RadioButtonList ID="rblRepairSituation" runat="server" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                            </td>
                            <td id="Td14" class="table_body_WithoutWidth " style="height: 30px; width: 15%" runat="server">
                                是否送修：
                            </td>
                            <td id="Td15" class="table_none_WithoutWidth " style="height: 30px; width: 30%" runat="server">
                                <asp:RadioButtonList ID="rbDelivered" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="否" Value="0" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="是" Value="1"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr id="Tr5" runat="server">
                            <td id="Td16" class="table_body_WithoutWidth " style="height: 20px;" runat="server">
                                故障详细描述：
                            </td>
                            <td id="Td17" class="table_none_WithoutWidth " style="height: 20px;" colspan="3"
                                runat="server">
                                <asp:TextBox ID="tbMaintenanceDescription" runat="server" Width="75%" TextMode="MultiLine"
                                    Rows="2" title="请输入详细描述~200:!" MaxLength="200"></asp:TextBox>
                                <span style="color: Red">*(不少于十字)<asp:Label runat="server" ID="lbmsgdescription"></asp:Label></span>
                            </td>
                        </tr>
                        <tr id="Tr6" runat="server">
                            <td id="Td18" class="table_body_WithoutWidth " style="height: 20px;" runat="server">
                                故障处理办法：
                            </td>
                            <td id="Td19" class="table_none_WithoutWidth " style="height: 20px;" colspan="3"
                                runat="server">
                                <asp:TextBox ID="tbMaintenanceMethod" runat="server" Width="75%" TextMode="MultiLine"
                                    Rows="2" title="请输入详细描述~200:!" MaxLength="200"></asp:TextBox>
                                <span style="color: Red">*(不少于十字)<asp:Label runat="server" ID="lbmsgmethod"></asp:Label></span>
                            </td>
                        </tr>
                        <tr id="Tr7" runat="server">
                            <td id="Td20" colspan="4" runat="server">
                                <asp:UpdatePanel ID="UpdatePanel_Edit" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#cccccc"
                                            style="border-collapse: collapse;">
                                            <tr>
                                                <td colspan="<%= CountPerRow %>" class="table_body_WithoutWidth">
                                                    维修人员列表
                                                </td>
                                            </tr>
                                            <asp:Repeater ID="Repeater_StaffList" runat="server" OnItemCommand="Repeater_StaffList_ItemCommand"
                                                OnItemDataBound="Repeater_StaffList_ItemDataBound">
                                                <ItemTemplate>
                                                    <%# Container.ItemIndex % CountPerRow ==0?"<tr>":""%>
                                                    <td runat="server" id="td_item" style="text-align: left">
                                                        <asp:ImageButton ID="ImageButton_Delete" runat="server" CommandArgument='<%# Container.ItemIndex %>'
                                                            CommandName="DeleteCMD" ImageUrl="~/images/ICON/delete.gif" />
                                                        <%# Eval("MaintenanceStaff")%>
                                                    </td>
                                                    <%# Container.ItemIndex % CountPerRow == (CountPerRow-1) ?"</tr>":""%>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                        <table>
                                            <tr align="right">
                                                <td>
                                                    维修人员名称：<asp:TextBox ID="TextBox_StaffName" runat="server" title="请输入维修人员名称~20"></asp:TextBox><asp:Button
                                                        ID="Button_Add" runat="server" class="button_bak" Text="添加" OnClick="Button_AddStaff_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr id="Tr8" runat="server">
                            <td id="Td21" class="table_body_WithoutWidth " style="height: 30px; border-right-width: 0px"
                                runat="server">
                            </td>
                            <td id="Td22" class="table_body_WithoutWidth " style="height: 30px; border-left-width: 0px;
                                border-right-width: 0px" colspan="2" runat="server">
                                非设备故障请在此填写信息:<input type="text" runat="server" id="noequipment" />
                            </td>
                            <td id="Td23" class="table_body_WithoutWidth " style="height: 30px; text-align: right;
                                border-left-width: 0px; border-right-width: 0px" runat="server">
                            </td>
                        </tr>
                        <tr id="Tr9" runat="server">
                            <td id="Td24" class="table_body_WithoutWidth " style="height: 30px; border-right-width: 0px"
                                runat="server">
                            </td>
                            <td id="Td25" class="table_body_WithoutWidth " style="height: 30px; border-left-width: 0px;
                                border-right-width: 0px" colspan="2" runat="server">
                                已维修的设备
                            </td>
                            <td id="Td26" class="table_body_WithoutWidth " style="height: 30px; text-align: right;
                                border-left-width: 0px; border-right-width: 0px" runat="server">
                                <input id="btAddEquipment" type="button" runat="server" class="button_bak2" value="记录维修设备" />
                                <cc2:ModalPopupExtender ID="ModalPopupExtender_AddEquipment" runat="server" TargetControlID="btAddEquipment"
                                    PopupControlID="plAddEquipment" BackgroundCssClass="modalBackground" OkControlID="Button_OK"
                                    CancelControlID="Button_Cancel" DynamicServicePath="" Enabled="True">
                                </cc2:ModalPopupExtender>
                                <input id="btChangeEquipment" type="button" runat="server" class="button_bak2" value="更换设备" />
                                <cc2:ModalPopupExtender ID="ModalPopupExtender_ChangeEquipment" runat="server" TargetControlID="btChangeEquipment"
                                    PopupControlID="plChangeEquipment" BackgroundCssClass="modalBackground" OkControlID="Button_OK1"
                                    CancelControlID="Button_Cancel1" DynamicServicePath="" Enabled="True">
                                </cc2:ModalPopupExtender>
                            </td>
                        </tr>
                        <tr id="Tr10" runat="server">
                            <td id="Td27" class="table_none_WithoutWidth " colspan="4" style="height: 30px; border-right-width: 0px"
                                runat="server">
                                <asp:UpdatePanel ID="updatePanelEquipments" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvMaintainedEquipments" runat="server" Width="100%" AutoGenerateColumns="False"
                                            OnRowCommand="gvMaintainedEquipments_RowCommand" OnRowDataBound="gvMaintainedEquipments_RowDataBound"
                                            ShowFooter="true">
                                            <EmptyDataTemplate>
                                                暂未添加经过维修的设备
                                            </EmptyDataTemplate>
                                            <EmptyDataRowStyle HorizontalAlign="Center" ForeColor="Red" Font-Bold="True" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        序号</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex+1 %></ItemTemplate>
                                                    <ItemStyle Width="4%" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="EquipmentNO" HeaderText="设备条形码">
                                                    <ItemStyle Width="10%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="EquipmentName" HeaderText="设备名称">
                                                    <ItemStyle Width="10%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Model" HeaderText="型号">
                                                    <ItemStyle Width="10%" />
                                                </asp:BoundField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        设备类型</HeaderTemplate>
                                                    <ItemTemplate runat="Server">
                                                        <asp:Label runat="Server" ID="serialnum" Text='<%#Eval("SerialNum") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle ForeColor="Red" Width="6%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        维修结果</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <%#EnumHelper.GetDescription((Enum)Eval("MaintainResult")) %>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="7%" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="LastAddress" HeaderText="设备跟踪">
                                                    <ItemStyle ForeColor="Red" Width="21%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Remark" HeaderText="维修情况"></asp:BoundField>
                                                <asp:TemplateField Visible="false" HeaderText="维修费用（元）">
                                                    <ItemTemplate>
                                                        <%# Eval("MaintainFee", "{0:#,0.##}") %>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbTotalFee" runat="server"></asp:Label>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="12%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        删除</HeaderTemplate>
                                                    <ItemStyle Width="4%" />
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/ICON/delete.gif"
                                                            CommandName="del" CommandArgument="<%# Container.DataItemIndex %>" OnClientClick="return confirm('确认要删除此申请明细吗？')"
                                                            CausesValidation="false" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#EFEFEF" Height="25px" />
                                            <RowStyle HorizontalAlign="Center" Height="20px" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="pnMoneyStatistics"  runat="server" HorizontalAlign="Center">
                        <asp:UpdatePanel ID="UpdatePanel_MoneyStatistics" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#cccccc"
                                    style="border-collapse: collapse;">
                                    <tr>
                                        <td id="Td28" class="Table_searchtitle" style="height: 30px;" colspan="9" runat="server">
                                            故障费用统计表
                                        </td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td class="table_body_WithoutWidth" style="width: 6%">
                                            一
                                        </td>
                                        <td class="table_body_WithoutWidth" colspan="8">
                                            设备费及材料费
                                        </td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td class="table_body_WithoutWidth" style="width: 6%">
                                            序号
                                        </td>
                                        <td class="table_none_WithoutWidth" style="width: 17%">
                                            名称
                                        </td>
                                        <td class="table_none_WithoutWidth" style="width: 17%">
                                            型号
                                        </td>
                                        <td class="table_none_WithoutWidth" style="width: 8%">
                                            单位
                                        </td>
                                        <td class="table_none_WithoutWidth" style="width: 8%">
                                            数量
                                        </td>
                                        <td class="table_none_WithoutWidth" style="width: 10%">
                                            综合单价
                                        </td>
                                        <td class="table_none_WithoutWidth" style="width: 14%">
                                            合价
                                        </td>
                                        <td class="table_none_WithoutWidth" style="width: 10%">
                                            备注
                                        </td>
                                        <td class="table_none_WithoutWidth" style="width: 10%">
                                            操作
                                        </td>
                                    </tr>
                                    <asp:Repeater ID="rpEquipmentItems" runat="server" OnItemCommand="rpEquipmentItems_OnItemCommand">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="table_body_WithoutWidth">
                                                    <%# (Container.ItemIndex+1)%>
                                                </td>
                                                <td class="table_none_WithoutWidth">
                                                    <label runat="server" id="lbEqName">
                                                        <%#Eval("EqName") %></label>
                                                </td>
                                                <td class="table_none_WithoutWidth">
                                                    <label runat="server" id="lbEqModel">
                                                        <%#Eval("EqModel") %></label>
                                                </td>
                                                <td class="table_none_WithoutWidth">
                                                    <label runat="server" id="lbEqUnit">
                                                        <%#Eval("EqUnit") %></label>
                                                </td>
                                                <td class="table_none_WithoutWidth">
                                                    <label runat="server" id="lbEqNum">
                                                        <%#Eval("EqNum") %></label>
                                                </td>
                                                <td class="table_none_WithoutWidth">
                                                    <label runat="server" id="lbEqSinglePrice">
                                                        <%#Eval("EqUnitPrice") %></label>
                                                </td>
                                                <td class="table_none_WithoutWidth">
                                                    <label runat="server" id="lbEqSumPrice">
                                                        <%#Eval("EqTotalPrice") %></label>
                                                </td>
                                                <td class="table_none_WithoutWidth">
                                                    <label runat="server" id="lbEqRemark">
                                                        <%#Eval("EqRemark") %></label>
                                                </td>
                                                <td class="table_none_WithoutWidth">
                                                    <asp:ImageButton ID="ibDelEqItems" runat="server" ImageUrl="~/images/ICON/delete.gif"
                                                        CommandArgument="<%# Container.ItemIndex %>" CommandName="delEq" OnClientClick="return confirm('确认要删除此设备费用吗？')"
                                                        CausesValidation="false" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <tr id="inputEqItemsTR">
                                        <td class="table_body_WithoutWidth">
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:TextBox ID="tbEqName" runat="server" MaxLength="200"></asp:TextBox>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:TextBox ID="tbEqModel" runat="server" MaxLength="200"></asp:TextBox>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:TextBox ID="tbEqUnit" runat="server" MaxLength="200" Width="40px"></asp:TextBox>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:TextBox ID="tbEqNum" runat="server" MaxLength="200" Width="40px" onBlur="javascript:tpblurtbEqNum(this.id);">0</asp:TextBox>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:TextBox ID="tbEqSinglePrice" runat="server" MaxLength="200" Width="60px" onBlur="javascript:tpblurtbEqSinglePrice(this.id);">0</asp:TextBox>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:TextBox ID="tbEqTotalPrice" runat="server" MaxLength="200" Width="60px">0</asp:TextBox>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:TextBox ID="tbEqRemark" runat="server" MaxLength="200"></asp:TextBox>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:Button runat="server" ID="btAddEquipmentItems" CssClass="button_bak" Text="添加"
                                                OnClick="btAddEquipmentItems_Click1" />
                                        </td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td class="table_body_WithoutWidth">
                                            N
                                        </td>
                                        <td class="table_none_WithoutWidth" colspan="5">
                                            小计
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:Label ID="lbSumTotal" runat="server">0</asp:Label>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                        </td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td class="table_body_WithoutWidth" style="width: 6%">
                                            二
                                        </td>
                                        <td class="table_body_WithoutWidth" colspan="8">
                                            其他费用
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body_WithoutWidth">
                                            1
                                        </td>
                                        <td class="table_none_WithoutWidth" colspan="5" style="font-weight: bold;">
                                            措施费
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:TextBox ID="tbMeasureCost" runat="server" MaxLength="200" title="价格输入格式不正确~int!"
                                                Width="60px" OnTextChanged="tbMeasureCost_TextChanged" AutoPostBack="True">0</asp:TextBox>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body_WithoutWidth">
                                            2
                                        </td>
                                        <td class="table_none_WithoutWidth" colspan="5" style="font-weight: bold;">
                                            规费
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:TextBox ID="tbGuiCost" runat="server" MaxLength="200" title="价格输入格式不正确~int!"
                                                Width="60px" OnTextChanged="tbMeasureCost_TextChanged" AutoPostBack="True">0</asp:TextBox>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <%--<asp:TextBox ID="tbMeasureCostMark" runat="server" MaxLength="200" 
                                    title="备注"  Width="0px"></asp:TextBox>--%>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body_WithoutWidth">
                                            3
                                        </td>
                                        <td class="table_none_WithoutWidth" colspan="5" style="font-weight: bold;">
                                            税金
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:TextBox ID="tbTaxCost" runat="server" MaxLength="200" title="价格输入格式不正确~int!"
                                                Width="60px" OnTextChanged="tbMeasureCost_TextChanged" AutoPostBack="True">0</asp:TextBox>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body_WithoutWidth">
                                            4
                                        </td>
                                        <td class="table_none_WithoutWidth" colspan="5" style="font-weight: bold;">
                                            交通费
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:TextBox ID="tbTrafficCost" runat="server" MaxLength="200" title="价格输入格式不正确~int!"
                                                Width="60px" OnTextChanged="tbMeasureCost_TextChanged" AutoPostBack="True">0</asp:TextBox>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                        </td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td class="table_body_WithoutWidth">
                                            N
                                        </td>
                                        <td class="table_none_WithoutWidth" colspan="5">
                                            小计
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                            <asp:Label ID="lbSumOther" runat="server"></asp:Label>
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                        </td>
                                        <td class="table_none_WithoutWidth">
                                        </td>
                                    </tr>
                                    <tr style="font-weight: bold;">
                                        <td class="table_body_WithoutWidth">
                                            三
                                        </td>
                                        <td class="table_body_WithoutWidth" colspan="5">
                                            合计
                                        </td>
                                        <td style="font-size: 9pt; background: #efefef; height: 30px; padding-left: 8px;
                                            padding-right: 5px; font-family: 'Verdana', 'Arial', 'Helvetica', 'sans-serif';
                                            text-align: left;">
                                            <asp:Label ID="lbSumAll" runat="server"></asp:Label>
                                        </td>
                                        <td class="table_body_WithoutWidth">
                                        </td>
                                        <td class="table_body_WithoutWidth">
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                    <asp:Panel ID="plAddEquipment" runat="server" Style="width:95%; height: 350px; display: none"
                        CssClass="modalPopup">
                        <asp:UpdatePanel ID="updatePanelAddEquipment" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table width="100%" border="1" bordercolor="#cccccc" cellpadding="0" cellspacing="0"
                                    style="border-collapse: collapse;">
                                    <tr>
                                        <td class="Table_searchtitle" style="height: 30px" colspan="4">
                                            添加已维修的设备
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            设备条形码：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:TextBox ID="tbEquipmentNO" runat="server" AutoPostBack="True" OnTextChanged="tbEquipmentNO_TextChanged"
                                                title="请输入设备条形码~20:noChinese"></asp:TextBox><span style="color: Red">*</span>
                                        </td>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            设备名称：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:TextBox ID="tbEquipmentName" runat="server" AutoPostBack="True" OnTextChanged="tbEquipmentName_TextChanged"
                                                MaxLength="20"></asp:TextBox><span style="color: Red">*</span>
                                            <input id="Button7" type="button" runat="server" class="button_bak3" onclick="javascript:selectEquipment()"
                                                value="查询" />
                                            <input id="btSelectEquipment" type="button" runat="server" class="button_bak" value="查询设备"
                                                style="display: none;" />
                                            <cc2:ModalPopupExtender ID="ModalPopupExtender_SelectEquipment" runat="server" TargetControlID="btSelectEquipment"
                                                PopupControlID="plSelectEquipment" BackgroundCssClass="modalBackground" OkControlID="Button_OK"
                                                CancelControlID="Button_Cancel2" DynamicServicePath="" Enabled="True">
                                            </cc2:ModalPopupExtender>
                                            <asp:Panel ID="plSelectEquipment" runat="server" Style="width: 750px; height: 450px;
                                                display: none" ScrollBars="Auto" CssClass="modalPopup">
                                                <div style="float: right; text-align: right;">
                                                    <asp:Button ID="Button_Cancel2" runat="server" class="button_bak" Text="取消" /></div>
                                                <cc2:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="2">
                                                    <cc2:TabPanel runat="server" HeaderText="在用设备查询" ID="TabPanel3">
                                                        <HeaderTemplate>
                                                            在用设备查询</HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td valign="top" style="width: 80%">
                                                                        <div style="width: 100%; text-align: center; vertical-align: top; padding: 0px 0px 0px 0px;">
                                                                            <div id="PrintDiv" style="width: 100%;">
                                                                                <asp:GridView Width="100%" ID="Equipment_GridView" runat="server" AutoGenerateColumns="False"
                                                                                    OnRowCommand="Equipment_GridView_RowCommand" OnRowDataBound="Equipment_GridView_RowDataBound">
                                                                                    <Columns>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <input type="checkbox" id="Checkbox_Select" runat="server" onclick="javascript:selectItem(this.id)" /></ItemTemplate>
                                                                                            <HeaderTemplate>
                                                                                                选择</HeaderTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="设备条形码">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_EquipmentNO" runat="server" Text='<%# Eval("EquipmentNO") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="设备名称">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_EquipmentName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="型号">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_Model" runat="server" Text='<%# Eval("Model") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="维修次数">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_MaintenanceTimes" runat="server" Text='<%# Eval("MaintenanceTimes") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="当前位置">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_AddressName" runat="server" Text='<%# Eval("AddressName") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                    <EmptyDataTemplate>
                                                                                        没有设备信息</EmptyDataTemplate>
                                                                                    <RowStyle HorizontalAlign="Center" Height="20px" />
                                                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#EFEFEF" Height="25px" />
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>
                                                    <cc2:TabPanel runat="server" HeaderText="附属设施查询" ID="TabPanel4">
                                                        <HeaderTemplate>
                                                            附属设施查询
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td valign="top" style="width: 80%">
                                                                        <div style="width: 100%; text-align: center; vertical-align: top; padding: 0px 0px 0px 0px;">
                                                                            <div id="Div1" style="width: 100%;">
                                                                                <asp:GridView Width="100%" ID="SubsidiaryEquipment_GridView" runat="server" AutoGenerateColumns="False"
                                                                                    OnRowCommand="SubsidiaryEquipment_GridView_RowCommand" OnRowDataBound="SubsidiaryEquipment_GridView_RowDataBound">
                                                                                    <Columns>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <input type="checkbox" id="Checkbox_Select" runat="server" onclick="javascript:selectItem(this.id)" /></ItemTemplate>
                                                                                            <HeaderTemplate>
                                                                                                选择</HeaderTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="设备条形码">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_EquipmentNO" runat="server" Text='<%# Eval("SubsidiaryEquipmentNO") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="设备名称">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_EquipmentName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="型号">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_Model" runat="server" Text='<%# Eval("Model") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="维修次数">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_MaintenanceTimes" runat="server" Text='<%# Eval("MaintenanceTimes") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:BoundField DataField="AddressName" HeaderText="当前位置">
                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                        </asp:BoundField>
                                                                                    </Columns>
                                                                                    <EmptyDataTemplate>
                                                                                        没有设备信息</EmptyDataTemplate>
                                                                                    <RowStyle HorizontalAlign="Center" Height="20px" />
                                                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#EFEFEF" Height="25px" />
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>
                                                    <cc2:TabPanel runat="server" HeaderText="低耗品查询" ID="TabPanel5">
                                                        <ContentTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td valign="top" style="width: 80%">
                                                                        <div style="width: 100%; text-align: center; vertical-align: top; padding: 0px 0px 0px 0px;">
                                                                            <div id="Div2" style="width: 100%;">
                                                                                <asp:GridView Width="100%" ID="ConsumableEquipment_GridView" runat="server" AutoGenerateColumns="False"
                                                                                    HeaderStyle-BackColor="#efefef" HeaderStyle-Height="25px" RowStyle-Height="20px"
                                                                                    OnRowCommand="ConsumableEquipment_GridView_RowCommand" HeaderStyle-HorizontalAlign="center"
                                                                                    RowStyle-HorizontalAlign="center" OnRowDataBound="ConsumableEquipment_GridView_RowDataBound">
                                                                                    <Columns>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <input type="checkbox" id="Checkbox_Select" runat="server" onclick="javascript:selectItem(this.id)" /></ItemTemplate>
                                                                                            <HeaderTemplate>
                                                                                                选择</HeaderTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="设备条形码">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_EquipmentNO" runat="server" Text='<%# Eval("ConsumableEquipmentNO") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="设备名称">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_EquipmentName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="型号">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_Model" runat="server" Text='<%# Eval("Model") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="维修次数">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="Label_MaintenanceTimes" runat="server" Text='<%# Eval("MaintenanceTimes") %>'></asp:Label></ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                    <EmptyDataTemplate>
                                                                                        没有设备信息</EmptyDataTemplate>
                                                                                    <RowStyle HorizontalAlign="Center" Height="20px" />
                                                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#EFEFEF" Height="25px" />
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>
                                                </cc2:TabContainer>
                                                <asp:Label ID="lbSelectNo" runat="server"></asp:Label><asp:UpdatePanel ID="updatePanel1"
                                                    runat="server">
                                                    <ContentTemplate>
                                                        <asp:Button ID="Button2" CssClass="button_bak2" runat="server" Text="确定" OnClick="btSelectEquipment_Click" /></ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            规格型号：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:TextBox ID="tbModel" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            维修次数：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:TextBox ID="tbMaintainTimes" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            修复状态：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:DropDownList ID="ddlStatus" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            维修费用：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:TextBox ID="tbMaintainFee" runat="server" Text="0" Width="50px"></asp:TextBox>元
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            设备价格：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:TextBox ID="tbPrice" runat="server" Text="0" Width="50px"></asp:TextBox>元
                                        </td>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            已维修费用：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:TextBox ID="tbTotalFee" runat="server" Text="0" Width="50px"></asp:TextBox>元
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            维修具体情况：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px" colspan="3">
                                            <asp:TextBox ID="tbRemark" runat="server" TextMode="MultiLine" Rows="3" Width="95%"
                                                MaxLength="100"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            设备地址：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px" colspan="3">
                                            <input id="hdAddressID" runat="server" type="hidden" />
                                            <asp:TextBox ID="tbAddress" runat="server" Width="75%" OnTextChanged="tbEquipmentName_TextChanged"></asp:TextBox><input
                                                class="button_bak" onclick="javascript:ClearAddress();" type="button" value="清空" />
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td class="table_body_WithoutWidth" colspan="4">
                                            维修设备零件替换列表
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td colspan="4">
                                            <asp:GridView ID="GridViewEquipmentPart" runat="server" AutoGenerateColumns="False"
                                                OnRowCommand="gvMaintainedEquipmentPart_RowCommand" OnRowDataBound="gvMaintainedEquipmentPart_RowDataBound"
                                                ShowFooter="True" Width="100%">
                                                <EmptyDataTemplate>
                                                    暂未添加经过维修的设备零件
                                                </EmptyDataTemplate>
                                                <EmptyDataRowStyle Font-Bold="True" ForeColor="Red" HorizontalAlign="Center" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            序号
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="4%" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="PartName" HeaderText="零件名称">
                                                        <ItemStyle Width="10%" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="费用">
                                                        <ItemTemplate>
                                                            <%# Eval("MaintainFee")%>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lbTotalMaintainFee" runat="server"></asp:Label>
                                                        </FooterTemplate>
                                                        <ItemStyle Width="12%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            删除
                                                        </HeaderTemplate>
                                                        <ItemStyle Width="4%" />
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>"
                                                                CommandName="del" ImageUrl="~/images/ICON/delete.gif" OnClientClick="return confirm('确认要删除此零件吗？')" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td colspan="4">
                                            零件名称：<asp:TextBox ID="tbEquipmentPartName" runat="server" title="请输入零件名称~20"></asp:TextBox>费用：<asp:TextBox
                                                ID="tbEquipmentMaintainFee" runat="server" title="请输入用费~float">0</asp:TextBox><asp:Button
                                                    ID="Button1" runat="server" class="button_bak" Text="添加" OnClick="Button_AddEquipmentPart_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <center>
                            <table width="100%">
                                <tr>
                                    <td style="width: 40%">
                                        <asp:UpdatePanel ID="updatePanelMsg" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="lbMsg" runat="server" ForeColor="Red"></asp:Label></ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td align="right" style="width: 40%">
                                        <asp:UpdatePanel ID="updatePanelButton" runat="server">
                                            <ContentTemplate>
                                                <input id="btSaveEquipment" class="button_bak2" type="button" runat="server" value="添加到已维修列表"
                                                    onserverclick="btSaveEquipment_Click" /></ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td align="left" style="width: 20%">
                                        &nbsp;&nbsp;
                                        <input id="Button_OK" runat="server" class="button_bak" style="display: none" value="OK"
                                            type="text" />
                                        <asp:Button ID="Button_Cancel" runat="server" class="button_bak" Text="取消" />
                                    </td>
                                </tr>
                            </table>
                        </center>
                    </asp:Panel>
                    <asp:Panel ID="plChangeEquipment" runat="server" Style="width: 95%; height: 350px;
                        display: none" CssClass="modalPopup">
                        <asp:UpdatePanel ID="updatePanelChangeEquipment" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table width="100%" border="1" bordercolor="#cccccc" cellpadding="0" cellspacing="0"
                                    style="border-collapse: collapse;">
                                    <tr>
                                        <td class="Table_searchtitle" style="height: 30px" colspan="4">
                                            添加需要更换的设备
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            原设备条形码：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:TextBox ID="tbCurrentEquipmentNO" runat="server" AutoPostBack="True" OnTextChanged="tbCurrentEquipmentNO_TextChanged"
                                                title="请输入设备条形码~20:noChinese"></asp:TextBox><span style="color: Red">*</span><br />
                                        </td>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            设备名称：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:TextBox ID="tbCurrentEquipmentName" runat="server" MaxLength="20" AutoPostBack="true"
                                                OnTextChanged="tbCurrentEquipmentName_TextChanged"></asp:TextBox><span style="color: Red">*</span>
                                            <input id="Button6" type="button" runat="server" class="button_bak3" onclick="javascript:selectCurrentEquipment()"
                                                value="根据设备名称查询" />
                                            <input id="btSelectCurrentEquipment" type="button" runat="server" class="button_bak3"
                                                value="根据设备名称查询" style="display: none;" />
                                            <cc2:ModalPopupExtender ID="ModalPopupExtender_SelectCurrentEquipment" runat="server"
                                                TargetControlID="btSelectCurrentEquipment" PopupControlID="plSelectCurrentEquipment"
                                                BackgroundCssClass="modalBackground" OkControlID="Button_OK" CancelControlID="Button_Cancel3"
                                                DynamicServicePath="" Enabled="True">
                                            </cc2:ModalPopupExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            原设备详细信息：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px" colspan="3">
                                            <asp:Label ID="lbCurrentEquipmentDetail" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            原设备状态：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:DropDownList ID="ddlCurrentEquipmentStatus" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            进入仓库：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:DropDownList ID="ddlCurrentEquipmentWarehouse" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            更换设备条形码：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:TextBox ID="tbChangeEquipmentNO" runat="server" AutoPostBack="True" OnTextChanged="tbChangeEquipmentNO_TextChanged"
                                                title="请输入已出库的设备条形码~20:noChinese"></asp:TextBox><span style="color: Red">* (该设备必须是已出库的)</span><br />
                                        </td>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            设备名称：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px">
                                            <asp:TextBox ID="tbChangeEquipmentName" runat="server" MaxLength="20"></asp:TextBox><span
                                                style="color: Red">*</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            更换设备详细信息：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px" colspan="3">
                                            <asp:Label ID="lbChangeEquipmentDetail" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_body table_body_NoWidth" style="height: 30px">
                                            更换具体情况说明：
                                        </td>
                                        <td class="table_none table_none_NoWidth" style="height: 30px" colspan="3">
                                            <asp:TextBox ID="tbChangeRemark" runat="server" TextMode="MultiLine" Rows="3" Width="95%"
                                                MaxLength="100">更换设备</asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <asp:Panel ID="plSelectCurrentEquipment" runat="server" Style="width: 650px; height: 450px;
                                    display: none" ScrollBars="Auto" CssClass="modalPopup">
                                    <div style="float: right; text-align: right;">
                                        <asp:Button ID="Button_Cancel3" runat="server" class="button_bak" Text="取消" /></div>
                                    <cc2:TabContainer ID="TabContainer3" runat="server" ActiveTabIndex="0">
                                        <cc2:TabPanel runat="server" HeaderText="在用设备查询" ID="TabPanel6">
                                            <HeaderTemplate>
                                                在用设备查询</HeaderTemplate>
                                            <ContentTemplate>
                                                <table width="100%">
                                                    <tr>
                                                        <td valign="top" style="width: 80%">
                                                            <div style="width: 100%; text-align: center; vertical-align: top; padding: 0px 0px 0px 0px;">
                                                                <div id="Div3" style="width: 100%;">
                                                                    <asp:GridView Width="100%" ID="CurrentEquipment_GridView" runat="server" AutoGenerateColumns="False"
                                                                        OnRowCommand="CurrentEquipment_GridView_RowCommand" OnRowDataBound="CurrentEquipment_GridView_RowDataBound">
                                                                        <Columns>
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <input type="checkbox" id="Checkbox_Select" runat="server" onclick="javascript:selectCurrentItem(this.id)" /></ItemTemplate>
                                                                                <HeaderTemplate>
                                                                                    选择</HeaderTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="设备条形码">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label_EquipmentNO" runat="server" Text='<%# Eval("EquipmentNO") %>'></asp:Label></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="设备名称">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label_EquipmentName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="型号">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label_Model" runat="server" Text='<%# Eval("Model") %>'></asp:Label></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="维修次数">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label_MaintenanceTimes" runat="server" Text='<%# Eval("MaintenanceTimes") %>'></asp:Label></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="当前位置">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label_AddressName" runat="server" Text='<%# Eval("AddressName") %>'></asp:Label></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <EmptyDataTemplate>
                                                                            没有设备信息</EmptyDataTemplate>
                                                                        <RowStyle HorizontalAlign="Center" Height="20px" />
                                                                        <HeaderStyle HorizontalAlign="Center" BackColor="#EFEFEF" Height="25px" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </cc2:TabPanel>
                                    </cc2:TabContainer>
                                    <asp:Label ID="Label2" runat="server"></asp:Label><asp:UpdatePanel ID="updatePanel4"
                                        runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="Button5" CssClass="button_bak2" runat="server" Text="确定" OnClick="btSelectCurrentEquipment_Click" /></ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                                <center>
                                    <table width="100%">
                                        <tr>
                                            <td style="width: 40%">
                                                <asp:UpdatePanel ID="updatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="lberrmsg" runat="server" ForeColor="Red"></asp:Label></ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td align="right" style="width: 40%">
                                                <asp:UpdatePanel ID="updatePanel3" runat="server">
                                                    <ContentTemplate>
                                                        <input id="Button3" class="button_bak2" type="button" runat="server" value="添加列表"
                                                            onserverclick="btChangeEquipment_Click" />
                                                        <input id="Button4" class="button_bak" type="button" runat="server" value="取消" onserverclick="btChangeEquipment_CancelClick" /></ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td align="left" style="width: 20%">
                                                &nbsp;&nbsp;
                                                <input id="Button_OK1" class="button_bak" style="display: none" value="OK" />
                                                <asp:Button ID="Button_Cancel1" runat="server" Style="display: none" class="button_bak"
                                                    Text="取消" />
                                            </td>
                                        </tr>
                                    </table>
                                </center>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <asp:Label ID="lbErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btAccept" runat="server" CssClass="button_bak" Text="我要受理" OnClick="btAccept_Click" />&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <div style="display: none">
                                                <asp:LinkButton ID="chedang_bt" Text="撤单" runat="server"></asp:LinkButton></div>
                                            <asp:UpdatePanel ID="updatePanelSaveButton" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="btSave" runat="server" Text="提交" CssClass="button_bak" OnClick="btSave_Click" />
                                                    &nbsp;&nbsp;<asp:Button ID="btCancel" runat="server" Text="取消" CssClass="button_bak"
                                                        OnClick="btCancel_Click" />
                                                    &nbsp;&nbsp;
                                                    <asp:Button ID="btReturn" OnClientClick="chedangclick()" CssClass="button_bak" runat="server"
                                                        Text="撤单" />&nbsp;&nbsp;
                                                    <asp:Button ID="btTrans" runat="server" CssClass="button_bak" Text="转移" OnClick="btTrans_Click" />&nbsp;&nbsp;
                                                    <asp:DropDownList ID="ddlMaintainTeamType" runat="server" title="请选择维修单位类型~!">
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="ddlMaintainTeam" runat="server" title="请选择维修单位~!">
                                                    </asp:DropDownList>
                                                    <span style="color: Red">
                                                        <asp:Label ID="lgerrmsg" runat="server"></asp:Label></span><cc2:CascadingDropDown
                                                            ID="cddMaintainType" runat="server" Category="DeptType" Enabled="True" LoadingText="维护队类型加载中..."
                                                            PromptText="请选择维护队类型..." ServiceMethod="GetMaintainDeptTypes" ServicePath="~/Module/FM2E/SystemManager/UserManager/CompanyDeptService.asmx"
                                                            TargetControlID="ddlMaintainTeamType">
                                                        </cc2:CascadingDropDown>
                                                    <cc2:CascadingDropDown ID="cddMaintainDept" runat="server" Category="MaintainDeptID"
                                                        Enabled="True" LoadingText="维护队加载中..." ParentControlID="ddlMaintainTeamType"
                                                        PromptText="请选择维护队..." ServiceMethod="GetMaintainDepts" ServicePath="~/Module/FM2E/SystemManager/UserManager/CompanyDeptService.asmx"
                                                        TargetControlID="ddlMaintainTeam">
                                                    </cc2:CascadingDropDown>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </cc2:TabPanel>
            <cc2:TabPanel runat="server" HeaderText="故障单登记记录" ID="TabPanel2">
                <ContentTemplate>
                    <asp:Repeater ID="rptMaintainHistory" runat="server" OnItemCommand="rptrptMaintainHistory_onItemCommand">
                        <HeaderTemplate>
                            <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#cccccc"
                                style="border-collapse: collapse;">
                                <tr>
                                    <td class="Table_searchtitle" style="height: 30px;" colspan="4">
                                        故障单登记记录
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="width: 25px;" rowspan="2">
                                    <asp:ImageButton ID="ImageButton_Delete" runat="server" CausesValidation="False"
                                        CommandArgument='<%#Eval("MaintainID")%>' CommandName="del" ImageUrl="~/images/ICON/delete.gif"
                                        OnClientClick="javascript:return confirm('确认删除该记录？');" />
                                    <%-- <%#Eval("UpdateTime", "{0:yyyy-MM-dd HH:mm}")%>--%>
                                </td>
                                <td rowspan="2" align="center">
                                    <%#Eval("UpdateTime", "{0:yyyy-MM-dd HH:mm}")%>
                                </td>
                                <td style="padding-left: 20px; padding-top: 8px;">
                                    维修时间：<%#Eval("UpdateTime", "{0:yyyy-MM-dd}")%>&nbsp;&nbsp;&nbsp;&nbsp; 维修单位：<%#Eval("MaintenanceTeam")%>&nbsp;&nbsp;&nbsp;&nbsp;维修人：<%#Eval("MaintenanceStaffName")%>&nbsp;&nbsp;&nbsp;&nbsp;
                                    维修总费用：<%#Eval("TotalFee","{0:#,0.#}")%>元&nbsp;&nbsp;&nbsp;&nbsp; 修复情况：<%#EnumHelper.GetDescription((Enum)Eval("RepairSituation"))%><br />
                                    处理意见：<%#Eval("MaintenanceDetail")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Repeater ID="rptHistoryEquipments" runat="server" DataSource='<%# Eval("MaintainedEquipments") %>'
                                        Visible='<%#((IList)Eval("MaintainedEquipments")).Count>0?true:false%>'>
                                        <HeaderTemplate>
                                            <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#cccccc"
                                                style="border-collapse: collapse;">
                                                <tr>
                                                    <td colspan="6" align="center" style="background-color: #EFEFEF; font-weight: bold;">
                                                        经过维修的设备
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" style="width: 10%">
                                                        设备条形码
                                                    </td>
                                                    <td align="center" style="width: 10%">
                                                        设备名称
                                                    </td>
                                                    <td align="center" style="width: 13%">
                                                        型号
                                                    </td>
                                                    <td align="center" style="width: 10%">
                                                        维修结果
                                                    </td>
                                                    <td align="center" style="width: 15%">
                                                        维修费用（元）
                                                    </td>
                                                    <td align="center">
                                                        维修情况
                                                    </td>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td align="center">
                                                    <%#Eval("EquipmentNO") %>
                                                </td>
                                                <td align="center">
                                                    <%#Eval("EquipmentName") %>
                                                </td>
                                                <td align="center">
                                                    <%#Eval("Model") %>
                                                </td>
                                                <td align="center">
                                                    <%#EnumHelper.GetDescription((Enum)Eval("MaintainResult")) %>
                                                </td>
                                                <td align="center">
                                                    <%# Eval("MaintainFee", "{0:#,0.##}") %>
                                                </td>
                                                <td align="center">
                                                    <%#Eval("Remark")%>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </ContentTemplate>
            </cc2:TabPanel>
        </cc2:TabContainer>
    </div>

    <script type="text/javascript" language="javascript">


        function chedangclick() {
            document.getElementById('<%=chedang_bt.ClientID %>').click();
        }


        function ClearAddress() {
            $get('<%=tbAddress.ClientID %>').value = '';
            $get('<%=hdAddressID.ClientID %>').value = '';
        }
        function RecordAddress(val) {
            //alert(val);
            var arr = new Array;
            arr = val.split('|');
            var addid = arr[0];
            var addcode = arr[1];
            var addname = arr[2];

            document.getElementById('<%= hdAddressID.ClientID %>').value = addcode;
            if (addcode != '00') {
                document.getElementById('<%=tbAddress.ClientID %>').value = addname;
            } else document.getElementById('<%=tbAddress.ClientID %>').value = "";

            document.getElementById('<%=btAddEquipment.ClientID %>').click();
        }

        function WriteSelect(file_name) {
            if (file_name != undefined) {
                var ShValues = file_name.split('||');
                switch (ShValues[2]) {
                    default: break;
                }
            }
        }


        function Clear(target) {
            switch (target) {
                case 'tbsAssetName':
                    {
                        break;
                    }
                default: break;
            }
        }

        //选择设备
        function selectItem(radio_id) {

            //先把其他radio设置成为check=false;
            var inputs = document.getElementsByTagName("INPUT");
            for (i = 0; i < inputs.length; i++) {
                if (inputs[i].type == 'checkbox' && inputs[i].id != radio_id) {
                    inputs[i].checked = false;
                }
            }

            var regS = new RegExp(",", "gi"); //去掉逗号

            //设备条形码
            var equipmentno = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_EquipmentNO')).innerText;
            document.getElementById('<%= tbEquipmentNO.ClientID %>').value = equipmentno;

            //设备名称
            var equipmentname = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_EquipmentName')).innerText;
            document.getElementById('<%= tbEquipmentName.ClientID %>').value = equipmentname;

            //设备类型
            var model = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_Model')).innerText;
            document.getElementById('<%= tbModel.ClientID %>').value = model;

            //设备维修次数
            var maintaintimes = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_MaintenanceTimes')).innerText;
            document.getElementById('<%= tbMaintainTimes.ClientID %>').value = maintaintimes;
        }

        function selectCurrentItem(radio_id) {
            //先把其他radio设置成为check=false;
            var inputs = document.getElementsByTagName("INPUT");
            for (i = 0; i < inputs.length; i++) {
                if (inputs[i].type == 'checkbox' && inputs[i].id != radio_id) {
                    inputs[i].checked = false;
                }
            }
            var regS = new RegExp(",", "gi"); //去掉逗号

            //设备条形码
            var equipmentno = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_EquipmentNO')).innerText;
            document.getElementById('<%= tbCurrentEquipmentNO.ClientID %>').value = equipmentno;

            //设备名称
            var equipmentname = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_EquipmentName')).innerText;
            document.getElementById('<%= tbCurrentEquipmentName.ClientID %>').value = equipmentname;

            //设备维修次数
            var maintaintimes = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_MaintenanceTimes')).innerText;

            //设备类型
            var model = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_Model')).innerText;

            //设备类型
            var addressname = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_AddressName')).innerText;


            document.getElementById('<%= lbCurrentEquipmentDetail.ClientID %>').innerText = "设备名称：" + equipmentname + " 设备型号：" + model + " 维修次数：" + maintaintimes + " 设备地址：" + addressname;
        }

        function selectChangeItem(radio_id) {
            //先把其他radio设置成为check=false;
            var inputs = document.getElementsByTagName("INPUT");
            for (i = 0; i < inputs.length; i++) {
                if (inputs[i].type == 'checkbox' && inputs[i].id != radio_id) {
                    inputs[i].checked = false;
                }
            }
            var regS = new RegExp(",", "gi"); //去掉逗号

            //设备条形码
            var equipmentno = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_EquipmentNO')).innerText;
            document.getElementById('<%= tbCurrentEquipmentNO.ClientID %>').value = equipmentno;

            //设备名称
            var equipmentname = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_EquipmentName')).innerText;
            document.getElementById('<%= tbCurrentEquipmentName.ClientID %>').value = equipmentname;

            //设备维修次数
            var maintaintimes = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_MaintenanceTimes')).innerText;

            //设备类型
            var model = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_Model')).innerText;

            //设备类型
            var addressname = document.getElementById(radio_id.replace('Checkbox_Select', 'Label_AddressName')).innerText;


            document.getElementById('<%= lbChangeEquipmentDetail.ClientID %>').innerText = "设备名称：" + equipmentname + " 设备型号：" + model + " 维修次数：" + maintaintimes + " 设备地址：" + addressname;
        }

        function selectCurrentEquipment() {
            alert("查询中");
            document.getElementById("<%= btSelectCurrentEquipment.ClientID %>").click();
        }

        function selectEquipment() {
            alert("查询中");
            document.getElementById("<%= btSelectEquipment.ClientID %>").click();
        }

        //
        var num_1 = 0, price_1 = 0, sum_1 = 0;
        function tpblurtbEqSinglePrice(id) {
            num_1 = document.getElementById(id).value;

            sum_1 = price_1 * num_1;
            document.getElementById("<%= tbEqTotalPrice.ClientID %>").innerText = sum_1;
        }
        function tpblurtbEqNum(id) {
            price_1 = document.getElementById(id).value;

            sum_1 = price_1 * num_1;
            document.getElementById("<%= tbEqTotalPrice.ClientID %>").innerText = sum_1;
        }
    
    </script>

</asp:Content>
