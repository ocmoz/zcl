﻿using System;
using System.Collections.Generic;
using System.Text;

namespace FM2E.Model.Basic
{
    /// <summary>
    /// 承包商实体
    /// </summary>
    public class ContractorInfo
    {
        private long  contractorID;

        public long ContractorID
        {
            get { return contractorID; }
            set { contractorID = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private int credit;
        public int Credit
        {
            get { return credit; }
            set { credit = value; }
        }
        private string service;
        public string Service
        {
            get { return service; }
            set { service = value; }
        }
        private string address;

        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        private string phone;

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private string fax;

        public string Fax
        {
            get { return fax; }
            set { fax = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string homePage;

        public string HomePage
        {
            get { return homePage; }
            set { homePage = value; }
        }

        private string resName;

        public string ResName
        {
            get { return resName; }
            set { resName = value; }
        }

        private string resPhone;

        public string ResPhone
        {
            get { return resPhone; }
            set { resPhone = value; }
        }

        private string remark;

        public string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        private bool isDeleted;

        public bool IsDeleted
        {
            get { return isDeleted; }
            set { isDeleted = value; }
        }
    }
}
