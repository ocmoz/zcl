﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using FM2E.BLL.BudgetManagement;
using FM2E.Model.BudgetManagement;
using WebUtility.Components;
using WebUtility;
using FM2E.Model.Exceptions;
using FM2E.Model.Utils;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using FM2E.BLL.Basic;
using FM2E.Model.Basic;

public partial class Module_FM2E_BudgetManagement_ImplementationOfTheBudget_MakeImplementationOfTheBudget : System.Web.UI.Page
{
    string cmd = (string)Common.sink("cmd", MethodType.Get, 50, 0, DataType.Str);
    string companyid = UserData.CurrentUserData.CompanyID;
    long YearID = (long)Common.sink("BudgetYearID", MethodType.Get, 255, 0, DataType.Long);
    long id = (long)Common.sink("id", MethodType.Get, 255, 0, DataType.Long);

    protected void Page_Load(object sender, EventArgs e)
    {
        Company companybll = new Company();
        CompanyInfo companyinfo = new CompanyInfo();
        //companyinfo.IsParentCompany = false;
        IList companylist = (List<CompanyInfo>)companybll.Search(companyinfo);
        companycount.Value = companylist.Count.ToString();

        if (YearID == 0)
        {
            QuarterlyBudget annualbll = new QuarterlyBudget();
            QuarterlyBudgetTotalInfo budgetyearinfo = ((QuarterlyBudgetTotalInfo)annualbll.GetQuarterlyBudgetTotal(id));
            if (budgetyearinfo != null)
                YearID = budgetyearinfo.BudgetYearID;
        }
        if (!IsPostBack)
        {
            CheckEditable(YearID, id);
            AddTree(0, (TreeNode)null);
            BindData();
            TreeView1.ShowLines = true;
            BudgetApplTotalydiv.InnerHtml = "";
            TotalExpenditurediv.InnerHtml = "";
            NonPaymentdiv.InnerHtml = "";
            BudgetPermonthdiv.InnerHtml = "";
            Totaldiv.InnerHtml = "";
            SurplusExpenditurediv.InnerHtml = "";
            AddTextBox(TreeView1.Nodes);

            FillData();
        }
    }

    private void FillData()
    {
        try
        {
            QuarterlyBudget bll = new QuarterlyBudget();
            QuarterlyBudgetDetailInfo budgetdetailinfo = new QuarterlyBudgetDetailInfo();
            budgetdetailinfo.TotalID = id;
            IList list = (List<QuarterlyBudgetDetailInfo>)bll.Search(budgetdetailinfo);
            GridView2.DataSource = convertfromreallist(list);
            GridView2.DataBind();
        }
        catch (Exception ex)
        {
            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "获取开支明细列表失败", ex, Icon_Type.Error, true, "window.history.go(-1)", UrlType.JavaScript, "");
        }
    }

    private IList convertfromreallist(IList list)
    {
        IList listtemp = new List<QuarterlyBudgetDetailInfo>();
        int count = 0;
        decimal expenditure = 0;
        decimal budgetapproval = 0;
        int comcount = Convert.ToInt32(companycount.Value);
        foreach (QuarterlyBudgetDetailInfo budgetdetailinfo in (List<QuarterlyBudgetDetailInfo>)list)
        {
            if (count % comcount == 0)
            {
                expenditure = budgetdetailinfo.Expenditure;
                budgetapproval = budgetdetailinfo.BudgetApprove;
                listtemp.Add(budgetdetailinfo);
                ((QuarterlyBudgetDetailInfo)listtemp[count / comcount]).ExpenditureStr = budgetdetailinfo.CompanyName + ":" + budgetdetailinfo.Expenditure + " ";
                ((QuarterlyBudgetDetailInfo)listtemp[count / comcount]).BudgetApproveStr = budgetdetailinfo.CompanyName + ":" + budgetdetailinfo.BudgetApprove + " ";

            }
            else
            {
                expenditure += budgetdetailinfo.Expenditure;
                budgetapproval += budgetdetailinfo.BudgetApprove;
                ((QuarterlyBudgetDetailInfo)listtemp[count / comcount]).ExpenditureStr += budgetdetailinfo.CompanyName + ":" + budgetdetailinfo.Expenditure + " ";
                ((QuarterlyBudgetDetailInfo)listtemp[count / comcount]).BudgetApproveStr += budgetdetailinfo.CompanyName + ":" + budgetdetailinfo.BudgetApprove + " ";
                if (count % comcount == 3)
                {
                    ((QuarterlyBudgetDetailInfo)listtemp[count / comcount]).ExpenditureStr += "小计" + ":" + expenditure;
                    ((QuarterlyBudgetDetailInfo)listtemp[count / comcount]).BudgetApproveStr += "小计" + ":" + budgetapproval;
                }

            }
            count++;
        }
        return listtemp;
    }

    /// <summary>
    /// 检查预算能否修改的函数
    /// </summary>
    /// <param name="id"></param>
    private void CheckEditable(long id, long MonthlyID)
    {
        Session.RemoveAll();

        if (cmd == "edit")
        {
            QuarterlyBudget bll = new QuarterlyBudget();
            QuarterlyBudgetTotalInfo budgetpermonthtotalinfo = bll.GetQuarterlyBudgetTotal(MonthlyID);
            if (budgetpermonthtotalinfo == null)
                EventMessage.MessageBox(Msg_Type.Error, "操作失败", "指定的季度预算不存在！", new WebException("指定的季度预算不存在！"), Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
            //if (budgetpermonthtotalinfo != null && budgetpermonthtotalinfo.Status == 3)
            //    EventMessage.MessageBox(Msg_Type.Error, "操作失败", "本月度预算已经验收过，不能再编辑！", new WebException("本月度预算已经验收过，不能再编辑！"), Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
            //if (budgetpermonthtotalinfo != null && budgetpermonthtotalinfo.Status == 2)
            //    EventMessage.MessageBox(Msg_Type.Error, "操作失败", "本月度预算已经提交到审批，不能再编辑！", new WebException("本月度预算已经提交到审批，不能再编辑！"), Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
            Year.Value = budgetpermonthtotalinfo.Year.ToString();
            Month.Value = budgetpermonthtotalinfo.Quarter.ToString();
            INPTitle.Value = budgetpermonthtotalinfo.Title;
            ViewState["Approvaler"] = budgetpermonthtotalinfo.Approvaler;
        }


    }

    private void BindData()
    {
        if (cmd == "edit")
        {
            GetMonthlySessionFromDatabase();
            staticsfunction(TreeView1.Nodes);
            staticstotal();

        }

    }

    public void AddTree(long ParentID, TreeNode pNode)
    {
        SubjectPerYear subjectperyearinfo = new SubjectPerYear();
        subjectperyearinfo.ParentID = ParentID;
        subjectperyearinfo.Year = YearID;
        SubjectRelation bll = new SubjectRelation();
        QueryParam qp = bll.GenerateSearchTermByYear(subjectperyearinfo);
        int recordcount = 0;
        IList nodelist = bll.GetListByYear(qp, out recordcount, companyid);
        List<SubjectRelationInfos> subnodes = new List<SubjectRelationInfos>();
        foreach (SubjectRelationInfos node in nodelist)
        {
            if (node.ParentID == ParentID)
                subnodes.Add(node);
        }

        //循环递归
        foreach (SubjectRelationInfos node in subnodes)
        {
            //声明节点
            TreeNode Node = new TreeNode();
            //绑定超级链接
            //Node.NavigateUrl = "ViewSubjectRelation.aspx?cmd=view&id=" + node.SubID;
            if (pNode == null)
            {
                Node.Text = node.Name;
                Node.Value = node.SubID.ToString();
                TreeView1.Nodes.Add(Node);
                Node.Expanded = true;
                Node.ToolTip = node.Name;

                //HtmlInputText inputtext = new HtmlInputText();
                //TextBox tb = new TextBox();
                //tb.ID = "int" + Node.Value;
                //inputtext.Attributes["style"] = "display:block";
                //inputrow.Controls.Add(tb);
                //inputrow.InnerHtml += "<input type='text' id='int" + Node.Value + "' style='display:block' runat='server' enableviewstate='true' />";
                AddTree(node.SubID, Node);

            }
            else
            {
                Node.Text = node.Name;
                Node.Value = node.SubID.ToString();
                pNode.ChildNodes.Add(Node);
                Node.Expanded = true;
                Node.ToolTip = node.Name;
                //HtmlInputText inputtext = new HtmlInputText();
                //inputtext.ID = "int" + Node.Value;
                //inputtext.Attributes["style"] = "display:none";
                //inputrow.Controls.Add(inputtext);
                //inputrow.InnerHtml += "<input type='text' id='int" + Node.Value + "' style='display:none' runat='server' enableviewstate='true' />";
                AddTree(node.SubID, Node);
            }
        }
    }

    /// <summary>
    /// 从数据库中获取预算金额到Session中
    /// </summary>
    private void GetAnnualSessionFromDatabase()
    {
        AnnualBudget bll = new AnnualBudget();
        BudgetYearInfo budgetyeatinfo = bll.GetBudgetYear(YearID);

        BudgetYearDetailInfo budgetyeardetailinfo = new BudgetYearDetailInfo();
        budgetyeardetailinfo.BudgetYearID = YearID;
        IList<BudgetYearDetailInfo> list = bll.Search(budgetyeardetailinfo);

        foreach (BudgetYearDetailInfo item in list)
        {
            Session[item.SubID.ToString() + "BudgetApply"] = item.BudgetApply;
            Session[item.SubID.ToString() + "BudgetPermonth"] = item.BudgetApply / 12;

        }



    }

    private void GetMonthlySessionFromDatabase()
    {
        QuarterlyBudget bll = new QuarterlyBudget();

        QuarterlyBudgetInfo budgetpermonthinfo = new QuarterlyBudgetInfo();
        budgetpermonthinfo.TotalID = id;

        QuarterlyBudgetDetailInfo budgetdetailinfo = new QuarterlyBudgetDetailInfo();
        budgetdetailinfo.TotalID = id;

        IList budgetdetaillist = (List<QuarterlyBudgetDetailInfo>)bll.Search(budgetdetailinfo);
        Session["BudgetDetaillist"] = budgetdetaillist;
        GridView1.DataSource = budgetdetaillist;
        GridView1.DataBind();


        IList<QuarterlyBudgetInfo> list = bll.Search(budgetpermonthinfo);

        foreach (QuarterlyBudgetInfo item in list)
        {
            Session[item.SubID.ToString() + "BudgetApply"] = item.BudgetApply;
            Session[item.SubID.ToString() + "TotalExpenditure"] = item.TotalExpenditure;
            Session[item.SubID.ToString() + "NonPayment"] = item.NonPayment;
            Session[item.SubID.ToString() + "BudgetPermonth"] = item.BudgetPermonth;
            Session[item.SubID.ToString() + "Total"] = item.Total;
            Session[item.SubID.ToString() + "SurplusExpenditure"] = item.SurplusExpenditure;
        }
    }

    /// <summary>
    /// 动态生成输入框
    /// </summary>
    /// <param name="nodes"></param>
    private void AddTextBox(TreeNodeCollection nodes)
    {
        foreach (TreeNode nodetemp in nodes)
        {
            string BudgetApply = "";
            string TotalExpenditure = "";
            string NonPayment = "";
            string BudgetPermonth = "";
            string Total = "";
            string SurplusExpenditure = "";
            if (nodetemp.Parent != null)
            {
                string showornot = (nodetemp.Parent.Expanded == true) ? "block" : "none";
                if (showornot == "none")
                    nodetemp.Expanded = false;
                if (Session[nodetemp.Value + "BudgetApply"] != null)
                    BudgetApply = Session[nodetemp.Value + "BudgetApply"].ToString();
                if (Session[nodetemp.Value + "TotalExpenditure"] != null)
                    TotalExpenditure = Session[nodetemp.Value + "TotalExpenditure"].ToString();
                if (Session[nodetemp.Value + "NonPayment"] != null)
                    NonPayment = Session[nodetemp.Value + "NonPayment"].ToString();
                if (Session[nodetemp.Value + "BudgetPermonth"] != null)
                    BudgetPermonth = Session[nodetemp.Value + "BudgetPermonth"].ToString();
                if (Session[nodetemp.Value + "Total"] != null)
                    Total = Session[nodetemp.Value + "Total"].ToString();
                if (Session[nodetemp.Value + "SurplusExpenditure"] != null)
                    SurplusExpenditure = Session[nodetemp.Value + "SurplusExpenditure"].ToString();
                if (nodetemp.ChildNodes.Count > 0)
                {
                    BudgetApplTotalydiv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "BudgetApply' style='background:#d0d0d0;display:" + showornot + "' runat='server' value='" + BudgetApply + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    TotalExpenditurediv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "' size='14' id='" + nodetemp.Value + "TotalExpenditure' style='background:#d0d0d0;display:" + showornot + "' runat='server' value='" + TotalExpenditure + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    NonPaymentdiv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "' size='14' id='" + nodetemp.Value + "NonPayment' style='background:#d0d0d0;display:" + showornot + "' runat='server' value='" + NonPayment + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    BudgetPermonthdiv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "BudgetPermonth' style='background:#d0d0d0;display:" + showornot + "' runat='server' value='" + BudgetPermonth + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    Totaldiv.InnerHtml += "<input type='text' size='14' title='" + nodetemp.Text + "'  id='" + nodetemp.Value + "Total' style='background:#d0d0d0;display:" + showornot + "' runat='server' value='" + Total + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    SurplusExpenditurediv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "SurplusExpenditure' style='background:#d0d0d0;display:" + showornot + "' runat='server' value='" + SurplusExpenditure + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                }
                else
                {
                    BudgetApplTotalydiv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "BudgetApply' style='display:" + showornot + "' runat='server' value='" + BudgetApply + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    TotalExpenditurediv.InnerHtml += "<input type='text'  title='" + nodetemp.Text + "' size='14' id='" + nodetemp.Value + "TotalExpenditure' style='display:" + showornot + "' runat='server' value='" + TotalExpenditure + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    NonPaymentdiv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "NonPayment' style='display:" + showornot + "' runat='server' value='" + NonPayment + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    BudgetPermonthdiv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "BudgetPermonth' style='display:" + showornot + "' runat='server' value='" + BudgetPermonth + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    Totaldiv.InnerHtml += "<input type='text' size='14' title='" + nodetemp.Text + "'  id='" + nodetemp.Value + "Total' style='display:" + showornot + "' runat='server' value='" + Total + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    SurplusExpenditurediv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "SurplusExpenditure' style='display:" + showornot + "' runat='server' value='" + SurplusExpenditure + "' onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                }
            }
            else
            {
                if (Session[nodetemp.Value + "BudgetApply"] != null)
                    BudgetApply = Session[nodetemp.Value + "BudgetApply"].ToString();
                if (Session[nodetemp.Value + "TotalExpenditure"] != null)
                    TotalExpenditure = Session[nodetemp.Value + "TotalExpenditure"].ToString();
                if (Session[nodetemp.Value + "NonPayment"] != null)
                    NonPayment = Session[nodetemp.Value + "NonPayment"].ToString();
                if (Session[nodetemp.Value + "BudgetPermonth"] != null)
                    BudgetPermonth = Session[nodetemp.Value + "BudgetPermonth"].ToString();
                if (Session[nodetemp.Value + "Total"] != null)
                    Total = Session[nodetemp.Value + "Total"].ToString();
                if (Session[nodetemp.Value + "SurplusExpenditure"] != null)
                    SurplusExpenditure = Session[nodetemp.Value + "SurplusExpenditure"].ToString();
                if (nodetemp.ChildNodes.Count > 0)
                {
                    BudgetApplTotalydiv.InnerHtml += "<input  title='" + nodetemp.Text + "' type='text' size='14' id='" + nodetemp.Value + "BudgetApply' style='background:#d0d0d0;display:block' runat='server' value='" + BudgetApply + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    TotalExpenditurediv.InnerHtml += "<input title='" + nodetemp.Text + "'  type='text' size='14' id='" + nodetemp.Value + "TotalExpenditure' style='background:#d0d0d0;display:block' runat='server' value='" + TotalExpenditure + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    NonPaymentdiv.InnerHtml += "<input title='" + nodetemp.Text + "'  type='text' size='14' id='" + nodetemp.Value + "NonPayment' style='background:#d0d0d0;display:block' runat='server' value='" + NonPayment + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    BudgetPermonthdiv.InnerHtml += "<input title='" + nodetemp.Text + "'  type='text' size='14' id='" + nodetemp.Value + "BudgetPermonth' style='background:#d0d0d0;display:block' runat='server' value='" + BudgetPermonth + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    Totaldiv.InnerHtml += "<input title='" + nodetemp.Text + "'  type='text' size='14' id='" + nodetemp.Value + "Total' style='background:#d0d0d0;display:block' runat='server' value='" + Total + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    SurplusExpenditurediv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "SurplusExpenditure' style='background:#d0d0d0;display:block' runat='server' value='" + SurplusExpenditure + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                }
                else
                {
                    BudgetApplTotalydiv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "BudgetApply' style='display:block' runat='server' value='" + BudgetApply + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    TotalExpenditurediv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "TotalExpenditure' style='display:block' runat='server' value='" + TotalExpenditure + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    NonPaymentdiv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "NonPayment' style='display:block' runat='server' value='" + NonPayment + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    BudgetPermonthdiv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "BudgetPermonth' style='display:block' runat='server' value='" + BudgetPermonth + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    Totaldiv.InnerHtml += "<input type='text' size='14' title='" + nodetemp.Text + "'  id='" + nodetemp.Value + "Total' style='display:block' runat='server' value='" + Total + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                    SurplusExpenditurediv.InnerHtml += "<input type='text' title='" + nodetemp.Text + "'  size='14' id='" + nodetemp.Value + "SurplusExpenditure' style='display:block' runat='server' value='" + SurplusExpenditure + "'onblur='javascript:AddSession(this.id,this.value);' readonly='readonly' />";
                }
            }
            AddTextBox(nodetemp.ChildNodes);
        }

    }

    /// <summary>
    /// 用于统计的函数
    /// </summary>
    /// <param name="nodes">树节点</param>
    private void staticsfunction(TreeNodeCollection nodes)
    {
        foreach (TreeNode nodetemp in nodes)
        {
            staticsfunction(nodetemp.ChildNodes);
            if (nodetemp.ChildNodes.Count > 0)
            {
                decimal BudgetApply = 0;
                decimal TotalExpenditure = 0;
                decimal NonPayment = 0;
                decimal BudgetPermonth = 0;
                decimal Total = 0;
                decimal SurplusExpenditure = 0;
                foreach (TreeNode subnodetemp in nodetemp.ChildNodes)
                {

                    if (Session[subnodetemp.Value + "BudgetApply"] != null)
                    {
                        BudgetApply += Convert.ToDecimal(Session[subnodetemp.Value + "BudgetApply"]);
                    }
                    if (Session[subnodetemp.Value + "TotalExpenditure"] != null)
                    {
                        TotalExpenditure += Convert.ToDecimal(Session[subnodetemp.Value + "TotalExpenditure"]);
                    }
                    if (Session[subnodetemp.Value + "NonPayment"] != null)
                    {
                        NonPayment += Convert.ToDecimal(Session[subnodetemp.Value + "NonPayment"]);
                    }
                    if (Session[subnodetemp.Value + "BudgetPermonth"] != null)
                    {
                        BudgetPermonth += Convert.ToDecimal(Session[subnodetemp.Value + "BudgetPermonth"]);
                    }
                    if (Session[subnodetemp.Value + "Total"] != null)
                    {
                        Total += Convert.ToDecimal(Session[subnodetemp.Value + "Total"]);
                    }
                    if (Session[subnodetemp.Value + "SurplusExpenditure"] != null)
                    {
                        SurplusExpenditure += Convert.ToDecimal(Session[subnodetemp.Value + "SurplusExpenditure"]);
                    }
                }
                Session[nodetemp.Value + "BudgetApply"] = BudgetApply;
                Session[nodetemp.Value + "TotalExpenditure"] = TotalExpenditure;
                Session[nodetemp.Value + "NonPayment"] = NonPayment;
                Session[nodetemp.Value + "BudgetPermonth"] = BudgetPermonth;
                Session[nodetemp.Value + "Total"] = Total;
                Session[nodetemp.Value + "SurplusExpenditure"] = SurplusExpenditure;

            }
            else
            {
                decimal BudgetApply = 0;
                decimal TotalExpenditure = 0;
                decimal NonPayment = 0;
                decimal BudgetPermonth = 0;
                decimal Total = 0;
                decimal SurplusExpenditure = 0;
                if (Session[nodetemp.Value + "BudgetApply"] != null)
                {
                    BudgetApply = Convert.ToDecimal(Session[nodetemp.Value + "BudgetApply"]);
                }
                else
                    Session[nodetemp.Value + "BudgetApply"] = decimal.Zero;
                if (Session[nodetemp.Value + "TotalExpenditure"] != null)
                {
                    TotalExpenditure = Convert.ToDecimal(Session[nodetemp.Value + "TotalExpenditure"]);
                }
                else
                    Session[nodetemp.Value + "TotalExpenditure"] = decimal.Zero;
                if (Session[nodetemp.Value + "NonPayment"] != null)
                {
                    NonPayment = Convert.ToDecimal(Session[nodetemp.Value + "NonPayment"]);
                }
                else
                    Session[nodetemp.Value + "NonPayment"] = decimal.Zero;
                if (Session[nodetemp.Value + "BudgetPermonth"] != null)
                {
                    BudgetPermonth = Convert.ToDecimal(Session[nodetemp.Value + "BudgetPermonth"]);
                }
                else
                    Session[nodetemp.Value + "BudgetPermonth"] = decimal.Zero;

                Total = TotalExpenditure + NonPayment + BudgetPermonth;
                SurplusExpenditure = BudgetApply - Total;
                Session[nodetemp.Value + "Total"] = Total;
                Session[nodetemp.Value + "SurplusExpenditure"] = SurplusExpenditure;
            }
        }
    }

    private void staticstotal()
    {
        decimal BudgetApply = 0;
        decimal TotalExpenditure = 0;
        decimal NonPayment = 0;
        decimal BudgetPermonth = 0;
        decimal Total = 0;
        decimal SurplusExpenditure = 0;
        foreach (TreeNode nodetemp in TreeView1.Nodes)
        {
            if (Session[nodetemp.Value + "BudgetApply"] != null)
            {
                BudgetApply += Convert.ToDecimal(Session[nodetemp.Value + "BudgetApply"]);
            }
            if (Session[nodetemp.Value + "TotalExpenditure"] != null)
            {
                TotalExpenditure += Convert.ToDecimal(Session[nodetemp.Value + "TotalExpenditure"]);
            }
            if (Session[nodetemp.Value + "NonPayment"] != null)
            {
                NonPayment += Convert.ToDecimal(Session[nodetemp.Value + "NonPayment"]);
            }
            if (Session[nodetemp.Value + "BudgetPermonth"] != null)
            {
                BudgetPermonth += Convert.ToDecimal(Session[nodetemp.Value + "BudgetPermonth"]);
            }
            if (Session[nodetemp.Value + "Total"] != null)
            {
                Total += Convert.ToDecimal(Session[nodetemp.Value + "Total"]);
            }
            if (Session[nodetemp.Value + "SurplusExpenditure"] != null)
            {
                SurplusExpenditure += Convert.ToDecimal(Session[nodetemp.Value + "SurplusExpenditure"]);
            }
        }
        Session["TotalBudgetApply"] = BudgetApply;
        Session["TotalTotalExpenditure"] = TotalExpenditure;
        Session["TotalNonPayment"] = NonPayment;
        Session["TotalBudgetPermonth"] = BudgetPermonth;
        Session["TotalTotal"] = Total;
        Session["TotalSurplusExpenditure"] = SurplusExpenditure;
    }

    /// <summary>
    /// 树的展开事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    public void TreeView1_OnTreeNodeExpanded(object sender, TreeNodeEventArgs e)
    {
        AddSession();
        BudgetApplTotalydiv.InnerHtml = "";
        TotalExpenditurediv.InnerHtml = "";
        NonPaymentdiv.InnerHtml = "";
        BudgetPermonthdiv.InnerHtml = "";
        Totaldiv.InnerHtml = "";
        SurplusExpenditurediv.InnerHtml = "";
        AddTextBox(TreeView1.Nodes);
    }

    /// <summary>
    /// 树展开事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    public void TreeView1_OnTreeNodeCollapsed(object sender, TreeNodeEventArgs e)
    {
        AddSession();
        BudgetApplTotalydiv.InnerHtml = "";
        TotalExpenditurediv.InnerHtml = "";
        NonPaymentdiv.InnerHtml = "";
        BudgetPermonthdiv.InnerHtml = "";
        Totaldiv.InnerHtml = "";
        SurplusExpenditurediv.InnerHtml = "";
        AddTextBox(TreeView1.Nodes);
    }

    /// <summary>
    /// 保存输入的信息
    /// </summary>
    private void AddSession()
    {
        string[] sessionarray = sessionvalue.Value.Split('|');
        foreach (string sessioncontent in sessionarray)
        {
            if (sessioncontent != null && sessioncontent != string.Empty)
            {
                string[] temp = sessioncontent.Split(',');
                Session[temp[0]] = temp[1];

            }
        }
    }

    ///// <summary>
    ///// 提交月度预算事件
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void Sure_Click(object sender, EventArgs e)
    //{
    //    AddSession();
    //    staticsfunction(TreeView1.Nodes);
    //    staticstotal();
    //    long newMonthlyBudgetid = id;
    //    if (cmd == "add")
    //    {
    //        QuarterlyBudgetTotalInfo budgetpermonthtotalinfo = new QuarterlyBudgetTotalInfo();
    //        try
    //        {
    //            budgetpermonthtotalinfo.Year = Convert.ToInt32(Year.Value);
    //            budgetpermonthtotalinfo.Quarter = Convert.ToInt32(Month.Value);
    //            budgetpermonthtotalinfo.Title = INPTitle.Value;
    //            budgetpermonthtotalinfo.CompanyID = companyid;
    //            budgetpermonthtotalinfo.ViceEngineerReview = "";
    //            budgetpermonthtotalinfo.ViceManagerReview = "";
    //            budgetpermonthtotalinfo.ManagerReview = "";
    //            budgetpermonthtotalinfo.FinanceReview = "";
    //            budgetpermonthtotalinfo.Result = false;
    //            budgetpermonthtotalinfo.TotalExpenditure = (Session["TotalTotalExpenditure"] != null) ? Convert.ToDecimal(Session["TotalTotalExpenditure"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.BudgetPermonth = (Session["TotalBudgetPermonth"] != null) ? Convert.ToDecimal(Session["TotalBudgetPermonth"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.SurplusExpenditure = (Session["TotalSurplusExpenditure"] != null) ? Convert.ToDecimal(Session["TotalSurplusExpenditure"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.NonPayment = (Session["TotalNonPayment"] != null) ? Convert.ToDecimal(Session["TotalNonPayment"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.Total = (Session["TotalTotal"] != null) ? Convert.ToDecimal(Session["TotalTotal"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.MakeTime = DateTime.Now;
    //            budgetpermonthtotalinfo.Expenditure = decimal.Zero;
    //            budgetpermonthtotalinfo.Allocation = decimal.Zero;
    //            budgetpermonthtotalinfo.Deviation = decimal.Zero;
    //            budgetpermonthtotalinfo.BudgetApply = (Session["TotalBudgetApply"] != null) ? Convert.ToDecimal(Session["TotalBudgetApply"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.Status = Convert.ToInt16(1);
    //            budgetpermonthtotalinfo.BudgetYearID = YearID;
    //            budgetpermonthtotalinfo.DetailList = new List<QuarterlyBudgetInfo>();
    //            budgetpermonthtotalinfo.BudgetDetailList = new List<QuarterlyBudgetDetailInfo>();
    //            budgetpermonthtotalinfo.Approvaler = ViewState["Approvaler"].ToString();
    //            foreach (QuarterlyBudgetDetailInfo budgetdetailinfo in (List<QuarterlyBudgetDetailInfo>)Session["BudgetDetaillist"])
    //            {
    //                budgetpermonthtotalinfo.BudgetDetailList.Add(budgetdetailinfo);
    //            }
    //            GetDetailList(TreeView1.Nodes, budgetpermonthtotalinfo.DetailList);

    //        }
    //        catch (Exception ex)
    //        {
    //            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "输入预算数额不符合格式要求", ex, Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
    //        }

    //        QuarterlyBudget bll = new QuarterlyBudget();
    //        QuarterlyBudgetTotalInfo searchinfo = new QuarterlyBudgetTotalInfo();
    //        searchinfo.BudgetYearID = budgetpermonthtotalinfo.BudgetYearID;
    //        searchinfo.Quarter = budgetpermonthtotalinfo.Quarter;
    //        if (bll.Search(searchinfo).Count > 0)
    //            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "本季度预算已经提交过了，不能再创建", new WebException("本季度预算已经提交过了，不能再创建"), Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
    //        try
    //        {
    //            newMonthlyBudgetid = bll.InsertQuarterlyBudgetTotal(budgetpermonthtotalinfo);
    //        }
    //        catch (Exception ex)
    //        {
    //            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "提交季度预算失败", ex, Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
    //        }


    //    }
    //    if (cmd == "edit")
    //    {
    //        QuarterlyBudget bll = new QuarterlyBudget();
    //        QuarterlyBudgetTotalInfo budgetpermonthtotalinfo = new QuarterlyBudgetTotalInfo();
    //        try
    //        {
    //            budgetpermonthtotalinfo.TotalID = id;
    //            budgetpermonthtotalinfo.Year = Convert.ToInt32(Year.Value);
    //            budgetpermonthtotalinfo.Quarter = Convert.ToInt32(Month.Value);
    //            budgetpermonthtotalinfo.Title = INPTitle.Value;
    //            budgetpermonthtotalinfo.CompanyID = companyid;
    //            budgetpermonthtotalinfo.ViceEngineerReview = "";
    //            budgetpermonthtotalinfo.ViceManagerReview = "";
    //            budgetpermonthtotalinfo.ManagerReview = "";
    //            budgetpermonthtotalinfo.FinanceReview = "";
    //            budgetpermonthtotalinfo.Result = false;
    //            budgetpermonthtotalinfo.TotalExpenditure = (Session["TotalTotalExpenditure"] != null) ? Convert.ToDecimal(Session["TotalTotalExpenditure"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.BudgetPermonth = (Session["TotalBudgetPermonth"] != null) ? Convert.ToDecimal(Session["TotalBudgetPermonth"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.SurplusExpenditure = (Session["TotalSurplusExpenditure"] != null) ? Convert.ToDecimal(Session["TotalSurplusExpenditure"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.NonPayment = (Session["TotalNonPayment"] != null) ? Convert.ToDecimal(Session["TotalNonPayment"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.Total = (Session["TotalTotal"] != null) ? Convert.ToDecimal(Session["TotalTotal"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.MakeTime = DateTime.Now;
    //            budgetpermonthtotalinfo.Expenditure = decimal.Zero;
    //            budgetpermonthtotalinfo.Allocation = decimal.Zero;
    //            budgetpermonthtotalinfo.Deviation = decimal.Zero;
    //            budgetpermonthtotalinfo.BudgetApply = (Session["TotalBudgetApply"] != null) ? Convert.ToDecimal(Session["TotalBudgetApply"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.Status = Convert.ToInt16(1);
    //            budgetpermonthtotalinfo.BudgetYearID = bll.GetQuarterlyBudgetTotal(id).BudgetYearID;
    //            budgetpermonthtotalinfo.DetailList = new List<QuarterlyBudgetInfo>();
    //            budgetpermonthtotalinfo.BudgetDetailList = new List<QuarterlyBudgetDetailInfo>();
    //            budgetpermonthtotalinfo.Approvaler = ViewState["Approvaler"].ToString();

    //        }
    //        catch (Exception ex)
    //        {
    //            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "输入预算数额不符合格式要求", ex, Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
    //        }

    //        foreach (QuarterlyBudgetDetailInfo budgetdetailinfo in (List<QuarterlyBudgetDetailInfo>)Session["BudgetDetaillist"])
    //        {
    //            budgetpermonthtotalinfo.BudgetDetailList.Add(budgetdetailinfo);
    //        }
    //        GetDetailList(TreeView1.Nodes, budgetpermonthtotalinfo.DetailList);



    //        try
    //        {
    //            budgetpermonthtotalinfo.UpdateBudgetDetail = true;
    //            bll.UpdateQuarterlyBudgetTotal(budgetpermonthtotalinfo);
    //        }
    //        catch (Exception ex)
    //        {
    //            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "提交季度预算失败", ex, Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
    //        }
    //    }
    //    Session.RemoveAll();
    //    if (newMonthlyBudgetid > 0)
    //        EventMessage.MessageBox(Msg_Type.Info, "操作成功", "实际开支保存成功", Icon_Type.OK, true, Common.GetHomeBaseUrl("ImplementationOfTheBudget.aspx"), UrlType.Href, "");
    //    //Response.Redirect("ViewMonthlyBudget.aspx?cmd=view&id=" + newMonthlyBudgetid);
    //    //if (newMonthlyBudgetid > 0)
    //    //    EventMessage.MessageBox(Msg_Type.Info, "操作成功", "已保存为草稿", Icon_Type.OK, true, Common.GetHomeBaseUrl("MonthlyBudget.aspx"), UrlType.Href, "");

    //}

    ///// <summary>
    ///// 保存为草稿
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void SaveAsTemp_Click(object sender, EventArgs e)
    //{
    //    AddSession();
    //    staticsfunction(TreeView1.Nodes);
    //    staticstotal();
    //    long newMonthlyBudgetid = id;
    //    if (cmd == "add")
    //    {
    //        QuarterlyBudgetTotalInfo budgetpermonthtotalinfo = new QuarterlyBudgetTotalInfo();
    //        try
    //        {
    //            budgetpermonthtotalinfo.Year = Convert.ToInt32(Year.Value);
    //            budgetpermonthtotalinfo.Quarter = Convert.ToInt32(Month.Value);
    //            budgetpermonthtotalinfo.CompanyID = companyid;
    //            budgetpermonthtotalinfo.ViceEngineerReview = "";
    //            budgetpermonthtotalinfo.ViceManagerReview = "";
    //            budgetpermonthtotalinfo.ManagerReview = "";
    //            budgetpermonthtotalinfo.FinanceReview = "";
    //            budgetpermonthtotalinfo.Result = false;
    //            budgetpermonthtotalinfo.TotalExpenditure = (Session["TotalTotalExpenditure"] != null) ? Convert.ToDecimal(Session["TotalTotalExpenditure"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.BudgetPermonth = (Session["TotalBudgetPermonth"] != null) ? Convert.ToDecimal(Session["TotalBudgetPermonth"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.SurplusExpenditure = (Session["TotalSurplusExpenditure"] != null) ? Convert.ToDecimal(Session["TotalSurplusExpenditure"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.NonPayment = (Session["TotalNonPayment"] != null) ? Convert.ToDecimal(Session["TotalNonPayment"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.Total = (Session["TotalTotal"] != null) ? Convert.ToDecimal(Session["TotalTotal"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.MakeTime = DateTime.Now;
    //            budgetpermonthtotalinfo.Expenditure = decimal.Zero;
    //            budgetpermonthtotalinfo.Allocation = decimal.Zero;
    //            budgetpermonthtotalinfo.Deviation = decimal.Zero;
    //            budgetpermonthtotalinfo.BudgetApply = (Session["TotalBudgetApply"] != null) ? Convert.ToDecimal(Session["TotalBudgetApply"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.Status = Convert.ToInt16(2);
    //            budgetpermonthtotalinfo.BudgetYearID = YearID;
    //            budgetpermonthtotalinfo.DetailList = new List<QuarterlyBudgetInfo>();
    //            budgetpermonthtotalinfo.BudgetDetailList = new List<QuarterlyBudgetDetailInfo>();
    //            foreach (QuarterlyBudgetDetailInfo budgetdetailinfo in (List<QuarterlyBudgetDetailInfo>)Session["BudgetDetaillist"])
    //            {
    //                budgetpermonthtotalinfo.BudgetDetailList.Add(budgetdetailinfo);
    //            }
    //            GetDetailList(TreeView1.Nodes, budgetpermonthtotalinfo.DetailList);

    //        }
    //        catch (Exception ex)
    //        {
    //            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "输入预算数额不符合格式要求", ex, Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
    //        }

    //        QuarterlyBudget bll = new QuarterlyBudget();
    //        QuarterlyBudgetTotalInfo searchinfo = new QuarterlyBudgetTotalInfo();
    //        searchinfo.BudgetYearID = budgetpermonthtotalinfo.BudgetYearID;
    //        searchinfo.Quarter = budgetpermonthtotalinfo.Quarter;
    //        if (bll.Search(searchinfo).Count > 0)
    //            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "本季度预算已经提交过了，不能再创建", new WebException("本季度预算已经提交过了，不能再创建"), Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
    //        try
    //        {
    //            newMonthlyBudgetid = bll.InsertQuarterlyBudgetTotal(budgetpermonthtotalinfo);
    //        }
    //        catch (Exception ex)
    //        {
    //            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "保存季度预算失败", ex, Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
    //        }


    //    }
    //    if (cmd == "edit")
    //    {
    //        QuarterlyBudget bll = new QuarterlyBudget();
    //        QuarterlyBudgetTotalInfo budgetpermonthtotalinfo = new QuarterlyBudgetTotalInfo();

    //        try
    //        {
    //            budgetpermonthtotalinfo.TotalID = id;
    //            budgetpermonthtotalinfo.Year = Convert.ToInt32(Year.Value);
    //            budgetpermonthtotalinfo.Quarter = Convert.ToInt32(Month.Value);
    //            budgetpermonthtotalinfo.CompanyID = companyid;
    //            budgetpermonthtotalinfo.ViceEngineerReview = "";
    //            budgetpermonthtotalinfo.ViceManagerReview = "";
    //            budgetpermonthtotalinfo.ManagerReview = "";
    //            budgetpermonthtotalinfo.FinanceReview = "";
    //            budgetpermonthtotalinfo.Result = false;
    //            budgetpermonthtotalinfo.TotalExpenditure = (Session["TotalTotalExpenditure"] != null) ? Convert.ToDecimal(Session["TotalTotalExpenditure"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.BudgetPermonth = (Session["TotalBudgetPermonth"] != null) ? Convert.ToDecimal(Session["TotalBudgetPermonth"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.SurplusExpenditure = (Session["TotalSurplusExpenditure"] != null) ? Convert.ToDecimal(Session["TotalSurplusExpenditure"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.NonPayment = (Session["TotalNonPayment"] != null) ? Convert.ToDecimal(Session["TotalNonPayment"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.Total = (Session["TotalTotal"] != null) ? Convert.ToDecimal(Session["TotalTotal"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.MakeTime = DateTime.Now;
    //            budgetpermonthtotalinfo.Expenditure = decimal.Zero;
    //            budgetpermonthtotalinfo.Allocation = decimal.Zero;
    //            budgetpermonthtotalinfo.Deviation = decimal.Zero;
    //            budgetpermonthtotalinfo.BudgetApply = (Session["TotalBudgetApply"] != null) ? Convert.ToDecimal(Session["TotalBudgetApply"]) : decimal.Zero;
    //            budgetpermonthtotalinfo.Status = Convert.ToInt16(2);
    //            budgetpermonthtotalinfo.BudgetYearID = bll.GetQuarterlyBudgetTotal(id).BudgetYearID;
    //            budgetpermonthtotalinfo.DetailList = new List<QuarterlyBudgetInfo>();
    //            budgetpermonthtotalinfo.BudgetDetailList = new List<QuarterlyBudgetDetailInfo>();
    //            foreach (QuarterlyBudgetDetailInfo budgetdetailinfo in (List<QuarterlyBudgetDetailInfo>)Session["BudgetDetaillist"])
    //            {
    //                budgetpermonthtotalinfo.BudgetDetailList.Add(budgetdetailinfo);
    //            }
    //            GetDetailList(TreeView1.Nodes, budgetpermonthtotalinfo.DetailList);
    //        }
    //        catch (Exception ex)
    //        {
    //            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "输入预算数额不符合格式要求", ex, Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
    //        }
    //        try
    //        {
    //            budgetpermonthtotalinfo.UpdateBudgetDetail = true;
    //            bll.UpdateQuarterlyBudgetTotal(budgetpermonthtotalinfo);
    //        }
    //        catch (Exception ex)
    //        {
    //            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "保存季度预算失败", ex, Icon_Type.Error, true, "history.go(-1)", UrlType.JavaScript, "");
    //        }
    //    }
    //    Session.RemoveAll();
    //    if (newMonthlyBudgetid > 0)
    //        EventMessage.MessageBox(Msg_Type.Info, "操作成功", "已保存为草稿", Icon_Type.OK, true, Common.GetHomeBaseUrl("ImplementationOfTheBudget.aspx"), UrlType.Href, "");


    //}

    private void GetDetailList(TreeNodeCollection nodes, IList list)
    {
        foreach (TreeNode nodetemp in nodes)
        {
            if (nodetemp.ChildNodes.Count == 0)
            {
                QuarterlyBudgetInfo item = new QuarterlyBudgetInfo();
                item.BudgetYearDetailID = Convert.ToInt32(Year.Value);
                item.CompanyID = companyid;
                item.Quarter = Convert.ToInt32(Month.Value);
                item.TotalExpenditure = (Session[nodetemp.Value + "TotalExpenditure"] != null) ? Convert.ToDecimal(Session[nodetemp.Value + "TotalExpenditure"]) : decimal.Zero;
                item.BudgetPermonth = (Session[nodetemp.Value + "BudgetPermonth"] != null) ? Convert.ToDecimal(Session[nodetemp.Value + "BudgetPermonth"]) : decimal.Zero;
                item.SurplusExpenditure = (Session[nodetemp.Value + "SurplusExpenditure"] != null) ? Convert.ToDecimal(Session[nodetemp.Value + "SurplusExpenditure"]) : decimal.Zero;
                item.NonPayment = (Session[nodetemp.Value + "NonPayment"] != null) ? Convert.ToDecimal(Session[nodetemp.Value + "NonPayment"]) : decimal.Zero;
                item.Total = (Session[nodetemp.Value + "Total"] != null) ? Convert.ToDecimal(Session[nodetemp.Value + "Total"]) : decimal.Zero;
                item.BudgetApply = (Session[nodetemp.Value + "BudgetApply"] != null) ? Convert.ToDecimal(Session[nodetemp.Value + "BudgetApply"]) : decimal.Zero;
                item.Remarks = "";
                item.Manager = UserData.CurrentUserData.PersonName;
                item.MakeTime = DateTime.Now;
                item.Expenditure = decimal.Zero;
                item.Allocation = decimal.Zero;
                item.Deviation = decimal.Zero;
                item.ReasonForDeviation = "";
                item.EvaluationForDeviation = "";
                item.Review = Convert.ToInt16(1);
                item.SubID = Convert.ToInt64(nodetemp.Value);

                list.Add(item);

            }
            GetDetailList(nodetemp.ChildNodes, list);
        }
    }

    ///// <summary>
    ///// 统计输入的预算额,并计算出其他预算的项
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void Tatics_Click(object sender, EventArgs e)
    //{
    //    AddSession();
    //    staticsfunction(TreeView1.Nodes);
    //    staticstotal();
    //    BudgetApplTotalydiv.InnerHtml = "";
    //    TotalExpenditurediv.InnerHtml = "";
    //    NonPaymentdiv.InnerHtml = "";
    //    BudgetPermonthdiv.InnerHtml = "";
    //    Totaldiv.InnerHtml = "";
    //    SurplusExpenditurediv.InnerHtml = "";
    //    AddTextBox(TreeView1.Nodes);
    //}

    /// <summary>
    /// 列表绑定事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标移动到每项时颜色交替效果    
            e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='White';");
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#f7f7f7';");

            //设置悬浮鼠标指针形状为"小手"    
            e.Row.Attributes["style"] = "Cursor:hand";

            QuarterlyBudgetDetailInfo dv = (QuarterlyBudgetDetailInfo)e.Row.DataItem;
            e.Row.Attributes["DetailID"] = dv.DetailID.ToString();

        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //GridViewRow gvRow = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];
        //int i = 0;
        //foreach (BudgetDetailInfo item in (List<BudgetDetailInfo>)Session["BudgetDetaillist"])
        //{
        //    if (item.DetailID == Convert.ToInt64(gvRow.Attributes["DetailID"]))
        //    {
        //        break;
        //    }
        //    i++;
        //}
        //ScriptManager.RegisterClientScriptBlock(treediv, treediv.GetType(), "Showpopwin", "showPopWin('请输入你审批的金额和意见','EditDetail.aspx?index=" +  + "', 900, 400, refreshclick,true,true);", true);

    }

    public void TreeView1_OnSelectedNodeChanged(object sender, EventArgs e)
    {
        refresh.Value = "false";
        string str = TreeView1.SelectedNode.ToolTip;
        SelectFromSession();
        TreeView1.SelectedNode.Selected = false;
        ScriptManager.RegisterClientScriptBlock(TreeView1, this.GetType(), "click", "setslectrowcolor('" + str + "');", true);
    }

    protected void GridviewRefresh(object sender, EventArgs e)
    {
        if (refresh.Value != "true")
            SelectFromSession();
        else
        {
            GridView1.DataSource = Session["BudgetDetaillist"];
            GridView1.DataBind();
        }
    }

    protected void showallexpenditure_click(object sender, EventArgs e)
    {
        GridView1.DataSource = Session["BudgetDetaillist"];
        GridView1.DataBind();
        refresh.Value = "true";

    }

    /// <summary>
    /// 根据所选树节点刷选列表
    /// </summary>
    private void SelectFromSession()
    {
        try
        {
            IList list = new List<QuarterlyBudgetDetailInfo>();
            //Session["templist"] = Session["BudgetDetaillist"];
            using (MemoryStream stream = new MemoryStream())
            {
                BinaryFormatter formatter = new BinaryFormatter();
                stream.Position = 0;
                formatter.Serialize(stream, Session["BudgetDetaillist"]);
                stream.Position = 0;
                Session["templist"] = formatter.Deserialize(stream);
            }
            GetBudgetDetailByNodeSelect(TreeView1.SelectedNode, list);
            GridView1.DataSource = list;
            GridView1.DataBind();
            Session.Remove("templist");
        }
        catch (Exception ex)
        {
            EventMessage.MessageBox(Msg_Type.Error, "操作失败", "获取开支明细列表失败", ex, Icon_Type.Error, true, "window.history.go(-1)", UrlType.JavaScript, "");
        }

    }

    private void GetBudgetDetailByNodeSelect(TreeNode node, IList list)
    {
        if (node.ChildNodes.Count > 0)
        {
            foreach (TreeNode subnode in node.ChildNodes)
            {
                GetBudgetDetailByNodeSelect(subnode, list);
            }
        }
        else
        {
            //foreach (BudgetDetailInfo item in (List<BudgetDetailInfo>)Session["templist"])
            //{
            //    if (item.SubID == Convert.ToInt64(node.Value))
            //    {
            //        BudgetDetailInfo newitem = BudgetDetailInfo.CloneObject(item);
            //        list.Add(newitem);
            //        ((List<BudgetDetailInfo>)Session["templist"]).Remove(item);

            //    }
            //}
            int count = ((List<QuarterlyBudgetDetailInfo>)Session["templist"]).Count;

            for (int i = 0; i < count; i++)
            {
                if (((List<QuarterlyBudgetDetailInfo>)Session["templist"])[i].SubID == Convert.ToInt64(node.Value))
                {
                    QuarterlyBudgetDetailInfo newitem = QuarterlyBudgetDetailInfo.CloneObject(((List<QuarterlyBudgetDetailInfo>)Session["templist"])[i]);
                    list.Add(newitem);
                    ((List<QuarterlyBudgetDetailInfo>)Session["templist"]).RemoveAt(i);
                    count = ((List<QuarterlyBudgetDetailInfo>)Session["templist"]).Count;
                    i--;
                }
            }


        }
    }
}
