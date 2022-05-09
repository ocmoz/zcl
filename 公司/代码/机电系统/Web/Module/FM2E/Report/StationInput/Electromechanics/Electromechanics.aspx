﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Electromechanics.aspx.cs"
    Inherits="Module_FM2E_Report_Input_Electromechanics" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>报表管理</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <link href="../themes/StyleSheet.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript" charset="gbk">
        function jump(raq, station) {
            var url = "http://";
            var ip1 = "<%=quieeIP1%>";
            var ip2 = "<%=quieeIP2%>";
            var tempurl = document.location.href;
            if (tempurl.indexOf(ip2) > 0) {
                url += "<%=quieeIP1%>";
            }
            else {
                url += "<%=quieeIP%>";
            }
            url += "/quiee/reportJsp/showReport.jsp"
            if (raq != "") url += "?raq=/" + raq;
            if ("<%=station%>" != "") url += "&station=" + "<%=station%>";
            window.open(url);
        }
    </script>

</head>
<body>
    <form runat="Server">
    <div id="main">
        <div id="table">
            <div id="ptk">
                <div id="tabtop-l">
                </div>
                <div id="tabtop-z">
                    机电弱电信息月报
                </div>
            </div>
        </div>
        <div id="DepartmentDIV" runat="Server" style="display: none">
             <td style="width: 10%;"><font size="3" color="red" face="微软雅黑">
                    请选择要修改的部门：</font>
                </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true">
                    <asp:ListItem Value="1">梅林站</asp:ListItem>
                    <asp:ListItem Value="2">葵涌站</asp:ListItem>
                    <asp:ListItem Value="3">小梅沙站</asp:ListItem>
                    <asp:ListItem Value="4">大梅沙站</asp:ListItem>
                    <asp:ListItem Value="5">盐田站</asp:ListItem>
                    <asp:ListItem Value="6">荷坳站</asp:ListItem>
                    <asp:ListItem Value="7">白泥坑站</asp:ListItem>
                    <asp:ListItem Value="8">福民站</asp:ListItem>
                    <asp:ListItem Value="9">石岩站</asp:ListItem>
                    <asp:ListItem Value="10">坂华站</asp:ListItem>
                    <asp:ListItem Value="11">观澜站</asp:ListItem>
                    <asp:ListItem Value="12">塘明站</asp:ListItem>
                    <asp:ListItem Value="13">西丽站</asp:ListItem>
                    <asp:ListItem Value="14">黄鹤站</asp:ListItem>
                    <asp:ListItem Value="15">水朗站</asp:ListItem>
                    <asp:ListItem Value="16">隧道所</asp:ListItem>
                    <asp:ListItem Value="17">客服中心</asp:ListItem>
                </asp:DropDownList>
            </td>
        </div>
        <div id="main-tablist">
            <div id="button-bar">
                <ul>
                    <%-- 
						<li>
							<input type="button"  id="b1" runat="server"
								onclick="javascript:jump('Jidian_Ruodian_SystemOperationMonthly_i.raq','a')"
								value="系统运行情况表"  style="font-family: 微软雅黑;height: 29px; text-align: center;  width: 170px;cursor: hand;"/>
						</li>
						<li>
							<input type="button" id="b2" runat="server"
								onclick="javascript:jump('Jidian_Ruodian_SystemOuterRepairMonthly_i.raq','a')"
								value="代维情况月报" style="font-family: 微软雅黑;height: 29px; text-align: center;  width: 170px;cursor: hand;" />
						</li>
						--%>
                    <li>
                        <input type="button" id="b3" runat="server" onclick="javascript:jump('Jidian_Ruodian_SystemBasicData_i.raq','a')"
                            value="基础数据" style="font-family: 微软雅黑; height: 29px; text-align: center; width: 170px;
                            cursor: hand;" />
                    </li>
                </ul>
            </div>
        </div>
        <%-- 
			<div id="table">
				<div id="ptk">
					<div id="tabtop-l"></div>
					<div id="tabtop-z">
						机电信息月报
					</div>
				</div>
			</div>
			<div id="main-tablist">
				<div id="button-bar">
					<ul>
						<li>
							<input type="button" id="b4" runat="server"
								onclick="javascript:jump('Jidian_Jidian_MechElecInfoMonthly_i.raq','a')"
								value="收费站机电信息月报" style="font-family: 微软雅黑;height: 29px; text-align: center;  width: 170px;cursor: hand;"/>
						</li>
						<li>
							<input type="button" id="b5" runat="server"
								onclick="javascript:jump('Jidian_Jidian_MechElecInfoMonthlySummary_i.raq','a')"
								value="机电信息月报汇总" style="font-family: 微软雅黑;height: 29px; text-align: center;  width: 170px;cursor: hand;"/>
						</li>
						
						
					</ul>
				</div>
				--%>
    </div>
    </div>
    </form>
</body>
</html>
