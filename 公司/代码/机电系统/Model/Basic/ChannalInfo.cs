﻿using System;
using System.Collections.Generic;
using System.Text;

namespace FM2E.Model.Basic
{
    public class ChannalInfo
    {
        #region Model
        private string _channalid;
        private string _companyid;
        private string _companyname;
        private string _sectionid;
        private string _sectionname;
        private string _channalname;
        private decimal  _length;
        private DateTime _opentime;
        private string _remark;
        private string _pictureurl;
        private bool _isdeleted;
        /// <summary>
        /// 
        /// </summary>
        public string ChannalID
        {
            set { _channalid = value; }
            get { return _channalid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyID
        {
            set { _companyid = value; }
            get { return _companyid; }
        }
        /// <summary>
        /// 隧道所属公司名称，不属于数据库表FM2E_Channal
        /// </summary>
        /// 
        public string CompanyName
        {
            set { _companyname = value; }
            get { return _companyname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string SectionID
        {
            set { _sectionid = value; }
            get { return _sectionid; }
        }
        /// <summary>
        /// 隧道所属路段名称，不属于数据库表FM2E_Channal
        /// </summary>
        public string SectionName
        {
            set { _sectionname = value; }
            get { return _sectionname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ChannalName
        {
            set { _channalname = value; }
            get { return _channalname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal Length
        {
            set { _length = value; }
            get { return _length; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime OpenTime
        {
            set { _opentime = value; }
            get { return _opentime; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Remark
        {
            set { _remark = value; }
            get { return _remark; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string PictureUrl
        {
            set { _pictureurl = value; }
            get { return _pictureurl; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool IsDeleted
        {
            set { _isdeleted = value; }
            get { return _isdeleted; }
        }
        #endregion Model
    }
}
