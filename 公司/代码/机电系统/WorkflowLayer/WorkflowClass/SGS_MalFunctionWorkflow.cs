using System;
using System.Collections.Generic;
using System.Workflow.Activities;
using System.ComponentModel;
namespace FM2E.WorkflowLayer
{
    public class SGS_MalFunctionWorkflow : StateMachineWorkflowActivity
    {
        public SGS_MalFunctionWorkflow()
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
                return "SGS_MalFunctionWorkflow";
            }
        }
        static public String TableName
        {
            get
            {
                return "FM2E_MalfunctionHandle";
            }
        }


        /// <summary>
        /// 新建审批
        /// </summary>
        static public String NewState
        {
            get
            {
                return "New";
            }
        }

        static public String Wait4RegisterState
        {
            get
            {
                return "Wait4Register";
            }
        }

        ///<summary>
        ///等待维护员确定
        ///</summary>
        static public String Wait4MaintenanceConfirmState
        {
            get
            {
                return "Wait4MaintenanceConfirm";
            }
        }


        /// <summary>
        /// 等待维护单位主管确认
        /// </summary>
        static public String Wait4MaintainDeptManagerConfirmState
        {
            get
            {
                return "Wait4MaintainDeptManagerConfirm";
            }
        }

        ///<summary>
        ///等待值班站长确认
        ///</summary>
        static public String Wait4DutyStationConfirmState
        {
            get
            {
                return "Wait4DutyStationConfirm";
            }
        }

        /// <summary>
        /// 等待机电部工程师确认
        /// </summary>
        static public String Wait4ElectDeptEngineerConfirmState
        {
            get
            {
                return "Wait4ElectDeptEngineerConfirm";
            }
        }

        /// <summary>
        /// 等待机电部经理确认
        /// </summary>
        static public String Wait4ElectDeptManagerConfirmState
        {
            get
            {
                return "Wait4ElectDeptManagerConfirm";
            }
        }


        #region 等待机电部高级经理确认

        /// <summary>
        /// 等待机电部高级经理确认
        /// </summary>
        static public String Wait4ElectDeptSeniorManagerConfirmState
        {
            get
            {
                return "Wait4ElectDeptSeniorManagerConfirm";
            }
        }

        //完成
        static public String ManagerDAcceptedEvent
        {
            get
            {
                return "ManagerDAccepted";
            }
        }

        /// <summary>
        /// 审批至副总经理
        /// </summary>
        /// 
        static public String GeneralManagerConfirm3Event
        {
            get
            {
                return "GeneralManagerConfirm3";
            }
        }

        //审批至总经理
        static public String GeneralManagerConfirm1Event
        {
            get
            {
                return "GeneralManagerConfirm1";
            }
        }

        //审批至副总裁
        static public String GeneralManagerConfirm2Event
        {
            get
            {
                return "GeneralManagerConfirm2";
            }
        }

        //不通过
        static public String ElectDeptSeniorManagerRejectedEvent
        {
            get
            {
                return "ElectDeptSeniorManagerRejected";
            }
        }

        #endregion

        #region  审批至副总经理

        //等待副总经理审批
        static public String WaitGeneralManagerConfirm3State
        {
            get
            {
                return "WaitGeneralManagerConfirm3";
            }
        }

        //通过
        static public String GeneralManagerPass3Event
        {
            get
            {
                return "GeneralManagerPass3";
            }
        }
        //不通过
        static public String ElectDeptGeneralManagerRejected3Event
        {
            get
            {
                return "ElectDeptGeneralManagerRejected3";
            }
        }

        #endregion

        #region 审批至总经理


        //等待副总经理审核
        static public String WaitGeneralManagerConfirm1State
        {
            get
            {
                return "WaitGeneralManagerConfirm1";
            }
        }

        //通过
        static public String GeneralManagerPass1Event
        {
            get
            {
                return "GeneralManagerPass1";
            }
        }

        //不通过
        static public String ElectDeptGeneralManagerRejected1Event
        {
            get
            {
                return "ElectDeptGeneralManagerRejected1";
            }
        }

        /// <summary>
        /// 等待机电部总经理确认
        /// </summary>
        static public String Wait4ElectDeptGeneralManagerConfirmState
        {
            get
            {
                return "Wait4ElectDeptGeneralManagerConfirm";
            }
        }

        //通过
        static public String ElectDeptGeneralManagerAcceptedEvent
        {
            get
            {
                return "ElectDeptGeneralManagerAccepted";
            }
        }

        //不通过
        static public String ElectDeptGeneralManagerRejectedEvent
        {
            get
            {
                return "ElectDeptGeneralManagerRejected";
            }
        }

        #endregion

        #region  审批至副总裁

        /// <summary>
        /// 副总经理确认
        /// </summary>
        static public String WaitGeneralManagerConfirm2State
        {
            get
            {
                return "WaitGeneralManagerConfirm2";
            }
        }

        //通过
        static public String GeneralManagerPass2Event
        {
            get
            {
                return "GeneralManagerPass2";
            }
        }
        //不通过
        static public String ElectDeptGeneralManagerRejected2Event
        {
            get
            {
                return "ElectDeptGeneralManagerRejected2";
            }
        }

        /// <summary>
        /// 等待总经理确认
        /// </summary>
        static public String Wait4ElectDeptCManagerConfirmState
        {
            get
            {
                return "Wait4ElectDeptCManagerConfirm";
            }
        }
        //通过
        static public String ManagerCAcceptedEvent
        {
            get
            {
                return "ManagerCAccepted";
            }
        }
        //不通过
        static public String ManagerCRejectedEvent
        {
            get
            {
                return "ManagerCRejected";
            }
        }

        /// <summary>
        /// 等待副总确认
        /// </summary>
        static public String Wait4PresidentConfirmState
        {
            get
            {
                return "Wait4PresidentConfirm";
            }
        }
        //副总裁通过事件
        static public String ManagerAAcceptedEvent
        {
            get
            {
                return "ManagerAAccepted";
            }
        }
        //副总裁不通过事件
        static public String ManagerARejectedEvent
        {
            get
            {
                return "ManagerARejected";
            }
        }

        #endregion

        #region 等待事务经理

        static public String Wait4ElectDeptAManagerConfirmState
        {
            get
            {
                return "Wait4ElectDeptAManagerConfirm";
            }
        }

        //已归还
        static public String ManagerBAcceptedEvent
        {
            get
            {
                return "ManagerBAccepted";
            }
        }

        // 无备件归还
        static public String ManagerBRejectedEvent
        {
            get
            {
                return "ManagerBRejected";
            }
        }
        //包干范围内，无需归还备件
        static public String ManagerDRejectedEvent
        {
            get
            {
                return "ManagerDRejected";
            }
        }

        #endregion

        //处理完毕
        static public String FinishedNormalState
        {
            get
            {
                return "FinishedNormal";
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

        //~~~~~~~~~~~~~~~~~~~~

        ///<summary>
        ///等待维护员确认
        ///</summary>
        static public String MaintainMaintenanceAcceptedEvent
        {
            get
            {
                return "MaintainMaintenanceAccepted";
            }
        }


        ///<summary>
        ///等待值班站长确认
        ///</summary>
        static public String DutyStationAcceptedEvent
        {
            get
            {
                return "DutyStationAccepted";
            }
        }

        /// <summary>
        /// 等待维护队主管确认
        /// </summary>
        static public String MaintainDeptManagerAcceptedEvent
        {
            get
            {
                return "MaintainDeptManagerAccepted";
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

        /// <summary>
        /// 不通过并返回修改
        /// </summary>
        static public String MaintainDeptManagerRejectedAndReturnModifyEvent
        {
            get
            {
                return "MaintainDeptManagerRejectedAndReturnModify";
            }
        }

        static public String ElectDeptEngineerAcceptedEvent
        {
            get
            {
                return "ElectDeptEngineerAccepted";
            }
        }

        static public String ElectDeptEngineerPassedEvent
        {
            get
            {
                return "ElectDeptEngineerPassed";
            }
        }
        static public String ElectDeptEngineerRejectedEvent
        {
            get
            {
                return "ElectDeptEngineerRejected";
            }
        }

        static public String ElectDeptManagerConfirmAcceptedEvent
        {
            get
            {
                return "ElectDeptManagerConfirmAccepted";
            }
        }

        static public String ElectDeptManagerConfirmBackTojiliangEvent
        {
            get
            {
                return "ElectDeptManagerConfirmBackToJiliang";
            }
        }
        static public String ElectDeptManagerConfirmRejectedEvent
        {
            get
            {
                return "ElectDeptManagerConfirmRejected";
            }
        }

        static public String ElectDeptSeniorManagerAcceptedEvent
        {
            get
            {
                return "ElectDeptSeniorManagerAccepted";
            }
        }



        static public String SubmitReturnModifyEvent
        {
            get
            {
                return "SubmitReturnModify";
            }
        }

        static public String SubmitNewApprovelEvent
        {
            get
            {
                return "SubmitNewApprovel";
            }
        }




        static public String ElectDeptGeneralManagerPassEvent
        {
            get
            {
                return "ElectDeptGeneralManagerPass";
            }
        }



    }
}
