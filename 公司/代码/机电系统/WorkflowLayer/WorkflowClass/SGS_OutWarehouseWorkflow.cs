using System;
using System.Collections.Generic;
using System.Workflow .Activities;
using System.ComponentModel;
namespace FM2E.WorkflowLayer
{
    public class SGS_OutWarehouseWorkflow: StateMachineWorkflowActivity
    {
        public SGS_OutWarehouseWorkflow()
            : base()
        {
        }

        public Guid InstanceId
        {
            get;
            set;
        }
        static public String WorkflowName
        {
            get
            {
                return "SGS_OutWarehouseWorkflow";
            }
        }
        static public String TableName
        {
            get
            {
                return "FM2E_OutEquipmentsForExpendable";
            }
        }

        /// <summary>
        /// 提交申请
        /// </summary>
        static public String WaitSubmintState
        {
            get
            {
                return "WaitSubmint";
            }
        }
        static public String AppSubmitedEvent
        {
            get
            {
                return "AppSubmited";
            }
        }
        /// <summary>
        /// 等待工程师审批
        /// </summary>
        static public String WaitEngineerState
        {
            get
            {
                return "WaitEngineer";
            }
        }

        static public String EngineerApprovedEvent
        {
            get
            {
                return "EngineerApproved";
            }
        }
        static public String EngineerRejectedEvent
        {
            get
            {
                return "EngineerRejected";
            }
        }

        /// <summary>
        /// 等待经理审批
        /// </summary>
        static public String WaitManagerState
        {
            get
            {
                return "WaitManager";
            }
        }
        static public String ManagerApprovedEvent
        {
            get
            {
                return "ManagerApproved";
            }
        }
        static public String ManagerRejectedEvent
        {
            get
            {
                return "ManagerRejected";
            }
        }
        static public String RetuenEngineerEvent
        {
            get
            {
                return "RetuenEngineer";
            }
        }

        /// <summary>
        /// 等待仓管出库
        /// </summary>
        static public String WaitWarehouseKeeperState
        {
            get
            {
                return "WaitWarehouseKeeper";
            }
        }
        static public String ApprovalFailedState
        {
            get
            {
                return "ApprovalFailed";
            }
        }
        static public String WarehouseKeeperApprovedEvent
        {
            get
            {
                return "WarehouseKeeperApproved";
            }
        }

        static public String OutWarehouseState
        {
            get
            {
                return "OutWarehouse";
            }
        }
      
        /// <summary>
        /// 返回修改
        /// </summary>
        static public String ReturnModifyState
        {
            get
            {
                return "ReturnModify";
            }
        }
        static public String SubmitReturnModifyEvent
        {
            get
            {
                return "SubmitReturnModify";
            }
        }
        /// <summary>
        /// 结束
        /// </summary>
        static public String EndState
        {
            get
            {
                return "End";
            }
        }      
       
    }
}
