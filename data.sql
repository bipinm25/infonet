/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 10.4.12-MariaDB-log : Database - infonetu_demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `activation` */

DROP TABLE IF EXISTS `activation`;

CREATE TABLE `activation` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `HardwareID` char(100) CHARACTER SET utf8mb4 NOT NULL,
  `ActivationID` char(150) CHARACTER SET utf8mb4 NOT NULL,
  `PCName` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Activated_Date` date DEFAULT NULL,
  `Activation_Valid` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `activation` */

/*Table structure for table `advancepayable` */

DROP TABLE IF EXISTS `advancepayable`;

CREATE TABLE `advancepayable` (
  `AdvancePayable_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Transaction_Date` datetime(6) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  `Amount` decimal(18,4) NOT NULL,
  `Deduction` decimal(18,4) NOT NULL,
  PRIMARY KEY (`AdvancePayable_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `advancepayable` */

/*Table structure for table `advancereceipt` */

DROP TABLE IF EXISTS `advancereceipt`;

CREATE TABLE `advancereceipt` (
  `AdvanceReceipt_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Transaction_Date` datetime(6) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Amount` decimal(18,4) NOT NULL,
  `Deduction` decimal(18,4) NOT NULL,
  PRIMARY KEY (`AdvanceReceipt_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `advancereceipt` */

/*Table structure for table `alternativebarcode` */

DROP TABLE IF EXISTS `alternativebarcode`;

CREATE TABLE `alternativebarcode` (
  `AlterNative_Barcode_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `UnitDetail_Id` int(11) DEFAULT NULL,
  `AlterNative_Barcode` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`AlterNative_Barcode_Id`),
  UNIQUE KEY `IX_AlterNativeBarcode` (`AlterNative_Barcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `alternativebarcode` */

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `Bank_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Bank_Name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Bank_Account_No` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Op_Debit` decimal(18,4) DEFAULT NULL,
  `Op_Credit` decimal(18,4) DEFAULT NULL,
  `IFSC_Code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Branch` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Bank_Description` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Bank_ID`),
  UNIQUE KEY `IX_Bank` (`Bank_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bank` */

/*Table structure for table `bankledger_detail` */

DROP TABLE IF EXISTS `bankledger_detail`;

CREATE TABLE `bankledger_detail` (
  `BankLedger_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Transaction_Date` date DEFAULT NULL,
  `Transaction_Time` time(6) DEFAULT NULL,
  `Auto_Receipt_No` int(11) DEFAULT NULL,
  `Receipt_No` int(11) DEFAULT NULL,
  `Particular` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Bank_Id` int(11) NOT NULL,
  `Debit` decimal(18,4) DEFAULT NULL,
  `Credit` decimal(18,4) DEFAULT NULL,
  `Kot_Master_ID` int(11) DEFAULT NULL,
  `Kot_Parcel_ID` int(11) DEFAULT NULL,
  `Kot_Delivery_ID` int(11) DEFAULT NULL,
  `Sales_Master_Id` int(11) DEFAULT NULL,
  `SalesReturn_Master_Id` int(11) DEFAULT NULL,
  `Purchase_Master_Id` int(11) DEFAULT NULL,
  `PurchaseReturn_Master_Id` int(11) DEFAULT NULL,
  `Customer_Ledger_Detail_Id` int(11) DEFAULT NULL,
  `Supplier_Ledger_Detail_Id` int(11) DEFAULT NULL,
  `Employee_Ledger_Detail_Id` int(11) DEFAULT NULL,
  `Payment_Mode` int(11) DEFAULT NULL,
  `IsEdit` tinyint(1) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`BankLedger_Detail_Id`),
  KEY `FK_BankLedger_Detail_Bank` (`Bank_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bankledger_detail` */

/*Table structure for table `billno` */

DROP TABLE IF EXISTS `billno`;

CREATE TABLE `billno` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Invoice_No` int(11) DEFAULT NULL,
  `Kot_Master_ID` int(11) DEFAULT NULL,
  `Kot_Parcel_ID` int(11) DEFAULT NULL,
  `Kot_Delivery_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `billno` */

/*Table structure for table `branch` */

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
  `Branch_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Branch_Code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Branch_Name` varchar(100) DEFAULT NULL,
  `Branch_Description` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Branch_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `branch` */

/*Table structure for table `color` */

DROP TABLE IF EXISTS `color`;

CREATE TABLE `color` (
  `Color_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Color_Code` varchar(50) DEFAULT NULL,
  `Color_Name` varchar(100) NOT NULL,
  `ColorHex` varchar(50) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Color_ID`),
  UNIQUE KEY `IX_Color` (`Color_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `color` */

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `Company_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Company_Name` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Mobile` varchar(50) DEFAULT NULL,
  `Website` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Logo` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Financial_Year` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TRN_NO` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Report_Mail` varchar(50) DEFAULT NULL,
  `Report_Mail_Pass` varchar(20) DEFAULT NULL,
  `TermAndCondition` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Activation_ID` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Slogan` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Return_Days` int(11) DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Company_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `company` */

insert  into `company`(`Company_ID`,`Company_Name`,`Address`,`Phone`,`Mobile`,`Website`,`Email`,`Logo`,`Invoice_No`,`Financial_Year`,`TRN_NO`,`Report_Mail`,`Report_Mail_Pass`,`TermAndCondition`,`Activation_ID`,`Slogan`,`Return_Days`,`Color`,`Modified_By`,`Modified_Date`) values 
(1,'bbc1',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#f73b3b',NULL,NULL),
(2,'bbc2',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#3abf9a',NULL,NULL),
(3,'bbc3',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#3471e0',NULL,NULL),
(4,'bbc4',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#c836ec',NULL,NULL);

/*Table structure for table `counter` */

DROP TABLE IF EXISTS `counter`;

CREATE TABLE `counter` (
  `Counter_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Counter_Code` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Counter_Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Counter_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `counter` */

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `Country_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Country_Code` char(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Country_Name` varchar(50) DEFAULT NULL,
  `Currency_Name1` varchar(50) DEFAULT NULL,
  `Currency_Name2` char(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Currency_Symbol` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Country_Id`),
  UNIQUE KEY `IX_Country` (`Country_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `country` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `Customer_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_Code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Customer_Group_Id` int(11) DEFAULT NULL,
  `Customer_Name` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Gender` int(11) DEFAULT NULL,
  `OB_Debit` decimal(18,4) DEFAULT NULL,
  `OB_Credit` decimal(18,4) DEFAULT NULL,
  `Address` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Place` int(11) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Mobile` varchar(50) DEFAULT NULL,
  `Nationality` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Contact_Person` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `WebSite` varchar(50) DEFAULT NULL,
  `Dateofbirth` datetime(6) DEFAULT NULL,
  `Marital_Status` int(11) DEFAULT NULL,
  `Blood_Group` varchar(50) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `SalesMan_Id` int(11) DEFAULT NULL,
  `Image64` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Star_Rating` int(11) DEFAULT NULL,
  `Allow_Credit` tinyint(1) DEFAULT NULL,
  `Credit_Limit` int(11) DEFAULT NULL,
  `Credit_Duration` int(11) DEFAULT NULL,
  `TRN_No` varchar(50) DEFAULT NULL,
  `Registration_No` varchar(50) DEFAULT NULL,
  `Aadhar_No` varchar(50) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `State_Code` int(11) DEFAULT NULL,
  `Street_No` varchar(50) DEFAULT NULL,
  `Appartment` varchar(50) DEFAULT NULL,
  `Room_No` varchar(50) DEFAULT NULL,
  `Company_Id` int(11) NOT NULL,
  `Reference_Id` int(11) DEFAULT NULL,
  `Category_Id` int(11) DEFAULT NULL,
  `Bank_Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Branch` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Account_No` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IFSC_Code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Manager` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Swift` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Set_Rate` int(11) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT NULL,
  `CardNo` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Height` decimal(18,2) DEFAULT NULL,
  `Weight` decimal(18,2) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`,`Company_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=1018 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`Customer_Id`,`Customer_Code`,`Customer_Group_Id`,`Customer_Name`,`Gender`,`OB_Debit`,`OB_Credit`,`Address`,`Place`,`Phone`,`Mobile`,`Nationality`,`Contact_Person`,`Email`,`Fax`,`WebSite`,`Dateofbirth`,`Marital_Status`,`Blood_Group`,`Status`,`SalesMan_Id`,`Image64`,`Star_Rating`,`Allow_Credit`,`Credit_Limit`,`Credit_Duration`,`TRN_No`,`Registration_No`,`Aadhar_No`,`State`,`State_Code`,`Street_No`,`Appartment`,`Room_No`,`Company_Id`,`Reference_Id`,`Category_Id`,`Bank_Name`,`Branch`,`Account_No`,`IFSC_Code`,`Manager`,`Swift`,`Set_Rate`,`Discount`,`CardNo`,`Height`,`Weight`,`Is_Active`,`Modified_By`,`Modified_Date`) values 
(1017,'123',NULL,'Out Customer',-1,0.0000,0.0000,'',NULL,'','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'',0,1,0,0,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'','','','','','',-1,0.0000,'',NULL,NULL,1,2,'2020-07-17 20:15:54.000000'),
(1016,'',NULL,'Niya',1,500.0000,0.0000,'',NULL,'','987465265','India ','','','',NULL,NULL,NULL,NULL,NULL,NULL,'',0,1,0,0,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'','','','','','',-1,0.0000,'',NULL,NULL,1,1,'2020-07-17 20:15:55.000000'),
(1015,'',NULL,'Test Customer',-1,1200.0000,0.0000,'',NULL,'','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'',1,1,0,0,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'','','','','','',-1,0.0000,'',NULL,NULL,1,1,'2020-07-17 20:15:57.000000'),
(3,'',NULL,'Noushad',-1,0.0000,1500.0000,'',NULL,'','','India ','','','',NULL,NULL,NULL,NULL,NULL,NULL,'',0,1,0,0,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'','','','','','',-1,0.0000,'',NULL,NULL,1,1,'2020-07-17 20:15:59.000000'),
(2,'',NULL,'Cust343',-1,0.0000,0.0000,'',NULL,'100','0554307535','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'',0,1,0,0,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'','','','','','',1,0.0000,'',NULL,NULL,1,1,'2020-07-17 20:16:01.000000'),
(1,'',NULL,'Customer 15454',-1,0.0000,0.0000,'\r\n',NULL,'','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,0,0,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'','','','','','',-1,0.0000,'',NULL,NULL,1,1,'2020-07-17 20:16:03.000000');

/*Table structure for table `customer_detail` */

DROP TABLE IF EXISTS `customer_detail`;

CREATE TABLE `customer_detail` (
  `Customer_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_Id` int(11) DEFAULT NULL,
  `Transaction_Date` datetime(6) DEFAULT NULL,
  `Package_Id` int(11) DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `No_Of_Visit` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Expired_Date` date DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Customer_Detail_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `customer_detail` */

/*Table structure for table `customer_detail_sub` */

DROP TABLE IF EXISTS `customer_detail_sub`;

CREATE TABLE `customer_detail_sub` (
  `Customer_Detail_Sub_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_Detail_Id` int(11) DEFAULT NULL,
  `Transaction_Date` datetime(6) DEFAULT NULL,
  `Height` decimal(18,2) DEFAULT NULL,
  `Weight` decimal(18,2) DEFAULT NULL,
  `BP` decimal(18,2) DEFAULT NULL,
  `cholesterol` decimal(18,2) DEFAULT NULL,
  `Visit_Count` int(11) DEFAULT NULL,
  `Nxt_Visit_Date` date DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Customer_Detail_Sub_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `customer_detail_sub` */

/*Table structure for table `customerledger_detail` */

DROP TABLE IF EXISTS `customerledger_detail`;

CREATE TABLE `customerledger_detail` (
  `CustomerLedger_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Transaction_Date` date DEFAULT NULL,
  `Transaction_Time` time(6) DEFAULT NULL,
  `Receipt_No` int(11) DEFAULT NULL,
  `Auto_Receipt_No` int(11) DEFAULT NULL,
  `Particular` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Customer_Id` int(11) NOT NULL,
  `Debit` decimal(18,4) DEFAULT NULL,
  `Credit` decimal(18,4) DEFAULT NULL,
  `Kot_Master_ID` int(11) DEFAULT NULL,
  `Kot_Parcel_ID` int(11) DEFAULT NULL,
  `Kot_Delivery_ID` int(11) DEFAULT NULL,
  `Sales_Master_Id` int(11) DEFAULT NULL,
  `SalesReturn_Master_Id` int(11) DEFAULT NULL,
  `BankLedger_Detail_Id` int(11) DEFAULT NULL,
  `Is_CreditNote` tinyint(1) DEFAULT NULL,
  `Payment_Mode` int(11) DEFAULT NULL,
  `Bank_Id` int(11) DEFAULT NULL,
  `IsEdit` tinyint(1) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`CustomerLedger_Detail_Id`),
  KEY `FK_CustomerLedger_Detail_Customer` (`Customer_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `customerledger_detail` */

/*Table structure for table `dailyreport_temp` */

DROP TABLE IF EXISTS `dailyreport_temp`;

CREATE TABLE `dailyreport_temp` (
  `Item_ID` int(11) DEFAULT NULL,
  `Item_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Quantity` decimal(18,2) DEFAULT NULL,
  `Rate` decimal(18,2) DEFAULT NULL,
  `Net_Value` decimal(18,2) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Tax_Amount` decimal(18,2) DEFAULT NULL,
  `Discount` decimal(18,2) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Waiter_id` int(11) DEFAULT NULL,
  `Waiter_Name` varchar(100) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Narration` varchar(50) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `User_Name` varchar(50) DEFAULT NULL,
  `InvTime` time(6) DEFAULT NULL,
  `InvTimeFormat` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `dailyreport_temp` */

/*Table structure for table `deleted_kot_detail` */

DROP TABLE IF EXISTS `deleted_kot_detail`;

CREATE TABLE `deleted_kot_detail` (
  `Kot_Detail_Id` int(11) NOT NULL,
  `Kot_Master_Id` int(11) DEFAULT NULL,
  `Table_ID` int(11) DEFAULT NULL,
  `Item_ID` int(11) DEFAULT NULL,
  `Quantity` decimal(18,2) DEFAULT NULL,
  `Rate` decimal(18,2) DEFAULT NULL,
  `Tax_Percentage` decimal(18,4) DEFAULT NULL,
  `Rate_Type` varchar(10) DEFAULT NULL,
  `Kot_Parcel_Id` int(11) DEFAULT NULL,
  `Kot_Delivery_Id` int(11) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `deleted_kot_detail` */

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `Department_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Department_Name` varchar(50) DEFAULT NULL,
  `Department_Head` varchar(50) DEFAULT NULL,
  `IsEditable` tinyint(1) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Department_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `department` */

/*Table structure for table `designation` */

DROP TABLE IF EXISTS `designation`;

CREATE TABLE `designation` (
  `Designation_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Designation_Code` varchar(50) DEFAULT NULL,
  `Designation_Name` varchar(50) DEFAULT NULL,
  `IsEditable` tinyint(1) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Designation_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `designation` */

/*Table structure for table `document` */

DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `Document_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Document_Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Document_Description` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Document_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `document` */

/*Table structure for table `duplicate_detail` */

DROP TABLE IF EXISTS `duplicate_detail`;

CREATE TABLE `duplicate_detail` (
  `Sales_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sales_Master_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Quantity` decimal(18,4) DEFAULT NULL,
  `Extra` decimal(18,4) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Convertion_Factor` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(18,4) DEFAULT NULL,
  `TaxInclusive` tinyint(1) DEFAULT NULL,
  `Disc_Percentage` decimal(18,2) DEFAULT NULL,
  `Sales_Rate` decimal(18,4) DEFAULT NULL,
  `Sales_Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Rate_Type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT NULL,
  `Net_Amount` decimal(18,4) DEFAULT NULL,
  `Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Amount` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Inclusive` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Exclusive` decimal(18,4) DEFAULT NULL,
  `SGST_Percentage` decimal(18,4) DEFAULT NULL,
  `CGST_Percentage` decimal(18,4) DEFAULT NULL,
  `IGST_Percentage` decimal(18,4) DEFAULT NULL,
  `Package_Id` int(11) DEFAULT NULL,
  `Supplier_Id` int(11) DEFAULT NULL,
  `Commission_Percentage` decimal(18,4) DEFAULT NULL,
  `Service_Percentage` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`Sales_Detail_Id`),
  KEY `FK_Duplicate_Detail_Product_Detail` (`Product_Detail_Id`),
  KEY `FK_Duplicate_Detail_Product_Master` (`Product_Id`),
  KEY `FK_Duplicate_Detail_Sales_Master` (`Sales_Master_Id`),
  KEY `FK_Duplicate_Detail_Unit` (`Base_Unit_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `duplicate_detail` */

/*Table structure for table `duplicate_detail_temp` */

DROP TABLE IF EXISTS `duplicate_detail_temp`;

CREATE TABLE `duplicate_detail_temp` (
  `Sales_DetailTemp_Id` int(11) NOT NULL,
  `Sales_MasterTemp_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Quantity` decimal(18,4) DEFAULT NULL,
  `Extra` decimal(18,4) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Convertion_Factor` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(18,4) DEFAULT NULL,
  `TaxInclusive` tinyint(1) DEFAULT NULL,
  `Disc_Percentage` decimal(18,2) DEFAULT NULL,
  `Sales_Rate` decimal(18,4) DEFAULT NULL,
  `Sales_Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Rate_Type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT NULL,
  `Net_Amount` decimal(18,4) DEFAULT NULL,
  `Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Amount` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Inclusive` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Exclusive` decimal(18,4) DEFAULT NULL,
  `SGST_Percentage` decimal(18,4) DEFAULT NULL,
  `CGST_Percentage` decimal(18,4) DEFAULT NULL,
  `IGST_Percentage` decimal(18,4) DEFAULT NULL,
  `Package_Id` int(11) DEFAULT NULL,
  `Supplier_Id` int(11) DEFAULT NULL,
  `Commission_Percentage` decimal(18,4) DEFAULT NULL,
  `Service_Percentage` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`Sales_DetailTemp_Id`),
  KEY `FK_Duplicate_DetailTemp_Product_Detail` (`Product_Detail_Id`),
  KEY `FK_Duplicate_DetailTemp_Product_Master` (`Product_Id`),
  KEY `FK_Duplicate_DetailTemp_Sales_Master` (`Sales_MasterTemp_Id`),
  KEY `FK_Duplicate_DetailTemp_Unit` (`Base_Unit_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `duplicate_detail_temp` */

/*Table structure for table `duplicate_master` */

DROP TABLE IF EXISTS `duplicate_master`;

CREATE TABLE `duplicate_master` (
  `Sales_Master_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Delivery_Date` datetime(6) DEFAULT NULL,
  `Invoice_Time` time(6) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Serial_No` int(11) DEFAULT NULL,
  `Branch_Id` int(11) DEFAULT NULL,
  `Counter_Id` int(11) DEFAULT NULL,
  `Counter_Name` varchar(50) DEFAULT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  `Customer_Name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `IsCash` int(11) DEFAULT NULL,
  `Bank_Id` int(11) DEFAULT NULL,
  `Card_Id` int(11) DEFAULT NULL,
  `Card_No` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Vehicle_Id` int(11) DEFAULT NULL,
  `Destination` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  `Quotation_Id` int(11) DEFAULT NULL,
  `Sales_Order_Id` int(11) DEFAULT NULL,
  `Remark` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TermsAndConditions` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Total_Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Net_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Amount` decimal(18,4) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Freight_Charge` decimal(18,4) DEFAULT NULL,
  `Round_Off` decimal(18,4) DEFAULT NULL,
  `Grand_Total` decimal(18,4) DEFAULT NULL,
  `MultiCash` decimal(18,4) DEFAULT NULL,
  `MultiCard` decimal(18,4) DEFAULT NULL,
  `Is_Saved` tinyint(1) DEFAULT NULL,
  `Is_Cancelled` tinyint(1) DEFAULT NULL,
  `Is_Sync` tinyint(1) DEFAULT NULL,
  `Is_Hold` tinyint(1) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Sales_Master_Id`),
  KEY `FK_Duplicate_Master_Bank` (`Bank_Id`),
  KEY `FK_Duplicate_Master_Counter` (`Counter_Id`),
  KEY `FK_Duplicate_Master_Customer` (`Customer_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `duplicate_master` */

/*Table structure for table `duplicate_master_temp` */

DROP TABLE IF EXISTS `duplicate_master_temp`;

CREATE TABLE `duplicate_master_temp` (
  `Sales_MasterTemp_Id` int(11) NOT NULL,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Delivery_Date` datetime(6) DEFAULT NULL,
  `Invoice_Time` time(6) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Serial_No` int(11) DEFAULT NULL,
  `Branch_Id` int(11) DEFAULT NULL,
  `Counter_Id` int(11) DEFAULT NULL,
  `Counter_Name` varchar(50) DEFAULT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  `Customer_Name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `IsCash` int(11) DEFAULT NULL,
  `Bank_Id` int(11) DEFAULT NULL,
  `Card_Id` int(11) DEFAULT NULL,
  `Card_No` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Vehicle_Id` int(11) DEFAULT NULL,
  `Destination` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  `Quotation_Id` int(11) DEFAULT NULL,
  `Sales_Order_Id` int(11) DEFAULT NULL,
  `Remark` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TermsAndConditions` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Total_Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Net_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Amount` decimal(18,4) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Freight_Charge` decimal(18,4) DEFAULT NULL,
  `Round_Off` decimal(18,4) DEFAULT NULL,
  `Grand_Total` decimal(18,4) DEFAULT NULL,
  `MultiCash` decimal(18,4) DEFAULT NULL,
  `MultiCard` decimal(18,4) DEFAULT NULL,
  `Is_Saved` tinyint(1) DEFAULT NULL,
  `Is_Cancelled` tinyint(1) DEFAULT NULL,
  `Is_Sync` tinyint(1) DEFAULT NULL,
  `Is_Hold` tinyint(1) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Sales_MasterTemp_Id`),
  KEY `FK_Duplicate_MasterTemp_Bank` (`Bank_Id`),
  KEY `FK_Duplicate_MasterTemp_Counter` (`Counter_Id`),
  KEY `FK_Duplicate_MasterTemp_Customer` (`Customer_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `duplicate_master_temp` */

/*Table structure for table `employeeattendance` */

DROP TABLE IF EXISTS `employeeattendance`;

CREATE TABLE `employeeattendance` (
  `Attendance_ID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkingDate` datetime(6) DEFAULT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `BasicWorkingTime` varchar(30) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `InTime` time(6) DEFAULT NULL,
  `OutTime` time(6) DEFAULT NULL,
  `Overtime` time(6) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Attendance_ID`),
  KEY `FK_EmployeeAttendance_EmployeeRegistration` (`Employee_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `employeeattendance` */

/*Table structure for table `employeedocument` */

DROP TABLE IF EXISTS `employeedocument`;

CREATE TABLE `employeedocument` (
  `EmployeeDocument_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_Id` int(11) DEFAULT NULL,
  `Document_Id` int(11) DEFAULT NULL,
  `Document_No` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Given_Date` datetime(6) DEFAULT NULL,
  `Valid_From` datetime(6) DEFAULT NULL,
  `Valid_To` datetime(6) DEFAULT NULL,
  `Image64` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`EmployeeDocument_Id`),
  KEY `FK_EmployeeDocument_Document` (`Document_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `employeedocument` */

/*Table structure for table `employeeledger_detail` */

DROP TABLE IF EXISTS `employeeledger_detail`;

CREATE TABLE `employeeledger_detail` (
  `EmployeeLedger_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Transaction_Date` date DEFAULT NULL,
  `Transaction_Time` time(6) DEFAULT NULL,
  `Receipt_No` int(11) DEFAULT NULL,
  `Auto_Receipt_No` int(11) DEFAULT NULL,
  `Particular` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Employee_Id` int(11) NOT NULL,
  `Debit` decimal(18,4) DEFAULT NULL,
  `Credit` decimal(18,4) DEFAULT NULL,
  `Sales_Master_Id` int(11) DEFAULT NULL,
  `SalesReturn_Master_Id` int(11) DEFAULT NULL,
  `BankLedger_Detail_Id` int(11) DEFAULT NULL,
  `Advance_ID` int(11) DEFAULT NULL,
  `Payment_ID` int(11) DEFAULT NULL,
  `Payment_Mode` int(11) DEFAULT NULL,
  `Bank_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`EmployeeLedger_Detail_Id`),
  KEY `FK_EmployeeLedger_Detail_Employee` (`Employee_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `employeeledger_detail` */

/*Table structure for table `employeepayment` */

DROP TABLE IF EXISTS `employeepayment`;

CREATE TABLE `employeepayment` (
  `Payment_ID` int(11) NOT NULL,
  `DateFrom` datetime(6) NOT NULL,
  `DateTo` datetime(6) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `PresentDays` int(11) NOT NULL,
  `Salary` decimal(18,4) NOT NULL,
  `Advance` decimal(18,4) NOT NULL,
  `Deduction` decimal(18,4) NOT NULL,
  `Overtime` char(50) CHARACTER SET utf8mb4 NOT NULL,
  `OvertimeRate` decimal(18,4) NOT NULL,
  `OvertimeAmount` decimal(18,4) NOT NULL,
  `PaymentDate` datetime(6) NOT NULL,
  `ModeOfPayment` char(150) CHARACTER SET utf8mb4 NOT NULL,
  `PaymentModeDetails` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `NetPay` decimal(18,4) NOT NULL,
  PRIMARY KEY (`Payment_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `employeepayment` */

/*Table structure for table `employeeregistration` */

DROP TABLE IF EXISTS `employeeregistration`;

CREATE TABLE `employeeregistration` (
  `Employee_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_Code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `EmployeeName` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `Address` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address1` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address2` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Ob_Debit` decimal(18,4) DEFAULT NULL,
  `Ob_Credit` decimal(18,4) DEFAULT NULL,
  `Mobile` varchar(30) DEFAULT NULL,
  `Home_Phone` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DateOfJoining` datetime(6) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Photo` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Gender` int(11) DEFAULT NULL,
  `BloodGroup` int(11) DEFAULT NULL,
  `Department` int(11) DEFAULT NULL,
  `Designation` int(11) DEFAULT NULL,
  `Nationality` varchar(30) DEFAULT NULL,
  `Post_Code` varchar(10) DEFAULT NULL,
  `Account_No` varchar(30) DEFAULT NULL,
  `IFSC_CODE` varchar(30) DEFAULT NULL,
  `Branch` varchar(30) DEFAULT NULL,
  `Marital_Status` int(11) DEFAULT NULL,
  `Salary` decimal(18,4) DEFAULT NULL,
  `BasicWorkingTime` time(6) DEFAULT NULL,
  `Password` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Access_Password` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `FK_EmployeeRegistration_Department` (`Department`),
  KEY `FK_EmployeeRegistration_Designation` (`Designation`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `employeeregistration` */

/*Table structure for table `expenseentry_detail` */

DROP TABLE IF EXISTS `expenseentry_detail`;

CREATE TABLE `expenseentry_detail` (
  `ExpenseEntry_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `ExpenseEntry_Master_Id` int(11) DEFAULT NULL,
  `Ledger_Id` int(11) DEFAULT NULL,
  `Invoice_No` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Narration` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Payment_Mode` int(11) DEFAULT NULL,
  `Debit` decimal(18,4) DEFAULT NULL,
  `Credit` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ExpenseEntry_Detail_Id`),
  KEY `FK_ExpenseEntry_Detail_ExpenseEntry_Detail` (`ExpenseEntry_Master_Id`),
  KEY `FK_ExpenseEntry_Detail_Ledger_Master` (`Ledger_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `expenseentry_detail` */

/*Table structure for table `expenseentry_master` */

DROP TABLE IF EXISTS `expenseentry_master`;

CREATE TABLE `expenseentry_master` (
  `ExpenseEntry_Master_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Voucher_No` int(11) DEFAULT NULL,
  `Transaction_Date` datetime(6) DEFAULT NULL,
  `Transaction_Time` time(6) DEFAULT NULL,
  `Taken_By` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ExpenseEntry_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `expenseentry_master` */

/*Table structure for table `general_settings` */

DROP TABLE IF EXISTS `general_settings`;

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `GeneralSettings_Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Value` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Type_Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `general_settings` */

/*Table structure for table `godown` */

DROP TABLE IF EXISTS `godown`;

CREATE TABLE `godown` (
  `Godown_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Godown_Code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Godown_Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Godown_Description` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Godown_ID`),
  UNIQUE KEY `IX_Godown` (`Godown_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `godown` */

/*Table structure for table `item_brand` */

DROP TABLE IF EXISTS `item_brand`;

CREATE TABLE `item_brand` (
  `Brand_ID` int(11) NOT NULL,
  `Brand_Code` varchar(50) DEFAULT NULL,
  `Brand_Name` varchar(100) NOT NULL,
  `BrandImage` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) NOT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Brand_ID`,`Company_Id`),
  UNIQUE KEY `IX_Item_Brand` (`Brand_Name`,`Company_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `item_brand` */

insert  into `item_brand`(`Brand_ID`,`Brand_Code`,`Brand_Name`,`BrandImage`,`Company_Id`,`Modified_By`,`Modified_Date`) values 
(8,'','new','',0,0,'2020-07-17 20:10:43.000000'),
(7,'','tasty food s','',0,0,'2020-07-17 20:10:41.000000'),
(6,'','tasty food','',0,0,'2020-07-17 20:10:39.000000'),
(5,'','fresh fine','',0,0,'2020-07-17 20:10:37.000000'),
(4,'','hermano','',0,0,'2020-07-17 20:10:35.000000'),
(3,'','organic','',0,0,'2020-07-17 20:10:33.000000'),
(2,'','hayyaf','',0,0,'2020-07-17 20:10:31.000000'),
(0,'','64','',0,1,'2020-07-17 08:13:35.000000'),
(1,'','600','',0,1,'2020-07-17 08:22:49.000000'),
(1,'','Brand1','',1,0,'2020-07-17 20:10:29.000000');

/*Table structure for table `item_category` */

DROP TABLE IF EXISTS `item_category`;

CREATE TABLE `item_category` (
  `Category_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category_Code` varchar(50) DEFAULT '',
  `Category_Name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `CategoryImage` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Regional_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) NOT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Category_ID`,`Company_Id`),
  UNIQUE KEY `IX_Item_Category` (`Category_Name`,`Company_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `item_category` */

insert  into `item_category`(`Category_ID`,`Category_Code`,`Category_Name`,`CategoryImage`,`Regional_Name`,`Company_Id`,`Modified_By`,`Modified_Date`) values 
(1,'','Honey2','','',0,1,'2020-07-17 19:54:38.000000'),
(2,'2','Herbal Drinks',NULL,NULL,0,NULL,NULL),
(3,'3','spices',NULL,NULL,0,NULL,NULL),
(4,'4','supplement',NULL,NULL,0,NULL,NULL),
(5,'5','Beauty Oils',NULL,NULL,0,NULL,NULL),
(6,'6','soap',NULL,NULL,0,NULL,NULL),
(7,'','Sample',NULL,NULL,0,NULL,NULL),
(8,'','sugar',NULL,NULL,0,NULL,NULL),
(9,'','new',NULL,NULL,0,NULL,NULL),
(10,'','sugar','','1',1,1,'2020-07-17 20:10:58.000000'),
(11,'','new','','1',1,1,'2020-07-17 20:11:01.000000'),
(12,'3','spices','','1',1,1,'2020-07-17 20:10:49.000000'),
(13,'4','supplement','','1',1,1,'2020-07-17 20:10:51.000000'),
(14,'5','Beauty Oils','','1',1,1,'2020-07-17 20:10:52.000000'),
(15,'6','soap','','1',1,1,'2020-07-17 20:10:54.000000'),
(16,'','Sample','','1',1,1,'2020-07-17 20:10:56.000000');

/*Table structure for table `item_group` */

DROP TABLE IF EXISTS `item_group`;

CREATE TABLE `item_group` (
  `Group_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Group_Code` varchar(50) DEFAULT '',
  `Group_Name` varchar(100) NOT NULL,
  `GroupImage` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Regional_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Printer_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Group_ID`),
  UNIQUE KEY `IX_Item_Group` (`Group_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `item_group` */

/*Table structure for table `item_master` */

DROP TABLE IF EXISTS `item_master`;

CREATE TABLE `item_master` (
  `Item_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Item_Code` varchar(50) DEFAULT NULL,
  `Item_Name` varchar(100) NOT NULL,
  `Stock` decimal(18,2) DEFAULT NULL,
  `Group_ID` int(11) DEFAULT NULL,
  `Tax_Id` int(11) DEFAULT NULL,
  `Rate` decimal(18,2) DEFAULT NULL,
  `Parcel` decimal(18,2) DEFAULT NULL,
  `Delivery` decimal(18,2) DEFAULT NULL,
  `Image` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  `Regional_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Item_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `item_master` */

/*Table structure for table `kot_delivery_master` */

DROP TABLE IF EXISTS `kot_delivery_master`;

CREATE TABLE `kot_delivery_master` (
  `Kot_Delivery_Id` int(11) NOT NULL,
  `Waiter_ID` int(11) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Discount` decimal(18,2) DEFAULT NULL,
  `Iscash` int(11) DEFAULT NULL,
  `IsKotPrinted` tinyint(1) DEFAULT NULL,
  `IsBillPrinted` tinyint(1) DEFAULT NULL,
  `IsPrinted` tinyint(1) DEFAULT NULL,
  `IsCancel` tinyint(1) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Narration` varchar(500) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `IsCredit` tinyint(1) DEFAULT NULL,
  `Referral_ID` int(11) DEFAULT NULL,
  `Is_Online` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Kot_Delivery_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kot_delivery_master` */

/*Table structure for table `kot_delivery_master_temp` */

DROP TABLE IF EXISTS `kot_delivery_master_temp`;

CREATE TABLE `kot_delivery_master_temp` (
  `Kot_Delivery_Id` int(11) NOT NULL,
  `Waiter_ID` int(11) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Discount` decimal(18,2) DEFAULT NULL,
  `Iscash` int(11) DEFAULT NULL,
  `IsKotPrinted` tinyint(1) DEFAULT NULL,
  `IsBillPrinted` tinyint(1) DEFAULT NULL,
  `IsPrinted` tinyint(1) DEFAULT NULL,
  `IsCancel` tinyint(1) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Narration` varchar(500) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `IsCredit` tinyint(1) DEFAULT NULL,
  `Referral_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Kot_Delivery_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kot_delivery_master_temp` */

/*Table structure for table `kot_detail` */

DROP TABLE IF EXISTS `kot_detail`;

CREATE TABLE `kot_detail` (
  `Kot_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Kot_Master_Id` int(11) DEFAULT NULL,
  `Table_ID` int(11) DEFAULT NULL,
  `Item_ID` int(11) DEFAULT NULL,
  `Quantity` decimal(18,2) DEFAULT NULL,
  `Rate` decimal(18,2) DEFAULT NULL,
  `Tax_Percentage` decimal(18,4) DEFAULT NULL,
  `Rate_Type` varchar(10) DEFAULT NULL,
  `Kot_Parcel_Id` int(11) DEFAULT NULL,
  `Kot_Delivery_Id` int(11) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `Narration` varchar(500) DEFAULT NULL,
  `Comment` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Is_KotPrinted` tinyint(1) DEFAULT NULL,
  `Is_SplitBill` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Kot_Detail_Id`),
  KEY `FK_Kot_Detail_Item_Master` (`Item_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kot_detail` */

/*Table structure for table `kot_detail_temp` */

DROP TABLE IF EXISTS `kot_detail_temp`;

CREATE TABLE `kot_detail_temp` (
  `Kot_Detail_Id` int(11) NOT NULL,
  `Kot_Master_Id` int(11) DEFAULT NULL,
  `Table_ID` int(11) DEFAULT NULL,
  `Item_ID` int(11) DEFAULT NULL,
  `Quantity` decimal(18,2) DEFAULT NULL,
  `Rate` decimal(18,2) DEFAULT NULL,
  `Tax_Percentage` decimal(18,4) DEFAULT NULL,
  `Rate_Type` varchar(10) DEFAULT NULL,
  `Kot_Parcel_Id` int(11) DEFAULT NULL,
  `Kot_Delivery_Id` int(11) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `Narration` varchar(500) DEFAULT NULL,
  `Comment` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Kot_Detail_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kot_detail_temp` */

/*Table structure for table `kot_master` */

DROP TABLE IF EXISTS `kot_master`;

CREATE TABLE `kot_master` (
  `Kot_Master_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Table_ID` int(11) DEFAULT NULL,
  `Waiter_ID` int(11) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Discount` decimal(18,2) DEFAULT NULL,
  `Iscash` int(11) DEFAULT NULL,
  `IsKotPrinted` tinyint(1) DEFAULT NULL,
  `IsBillPrinted` tinyint(1) DEFAULT NULL,
  `IsPrinted` tinyint(1) DEFAULT NULL,
  `IsCancel` tinyint(1) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  `Narration` varchar(500) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `IsCredit` tinyint(1) DEFAULT NULL,
  `Referral_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Kot_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kot_master` */

/*Table structure for table `kot_master_temp` */

DROP TABLE IF EXISTS `kot_master_temp`;

CREATE TABLE `kot_master_temp` (
  `Kot_Master_Id` int(11) NOT NULL,
  `Table_ID` int(11) DEFAULT NULL,
  `Waiter_ID` int(11) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Discount` decimal(18,2) DEFAULT NULL,
  `Iscash` int(11) DEFAULT NULL,
  `IsKotPrinted` tinyint(1) DEFAULT NULL,
  `IsBillPrinted` tinyint(1) DEFAULT NULL,
  `IsPrinted` tinyint(1) DEFAULT NULL,
  `IsCancel` tinyint(1) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  `Narration` varchar(500) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `IsCredit` tinyint(1) DEFAULT NULL,
  `Referral_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Kot_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kot_master_temp` */

/*Table structure for table `kot_parcel_master` */

DROP TABLE IF EXISTS `kot_parcel_master`;

CREATE TABLE `kot_parcel_master` (
  `Kot_Parcel_Id` int(11) NOT NULL,
  `Waiter_ID` int(11) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Discount` decimal(18,2) DEFAULT NULL,
  `Iscash` int(11) DEFAULT NULL,
  `IsKotPrinted` tinyint(1) DEFAULT NULL,
  `IsBillPrinted` tinyint(1) DEFAULT NULL,
  `IsPrinted` tinyint(1) DEFAULT NULL,
  `IsCancel` tinyint(1) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  `Narration` varchar(500) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `IsCredit` tinyint(1) DEFAULT NULL,
  `Referral_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Kot_Parcel_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kot_parcel_master` */

/*Table structure for table `kot_parcel_master_temp` */

DROP TABLE IF EXISTS `kot_parcel_master_temp`;

CREATE TABLE `kot_parcel_master_temp` (
  `Kot_Parcel_Id` int(11) NOT NULL,
  `Waiter_ID` int(11) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Discount` decimal(18,2) DEFAULT NULL,
  `Iscash` int(11) DEFAULT NULL,
  `IsKotPrinted` tinyint(1) DEFAULT NULL,
  `IsBillPrinted` tinyint(1) DEFAULT NULL,
  `IsPrinted` tinyint(1) DEFAULT NULL,
  `IsCancel` tinyint(1) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  `Narration` varchar(500) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `IsCredit` tinyint(1) DEFAULT NULL,
  `Referral_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Kot_Parcel_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kot_parcel_master_temp` */

/*Table structure for table `ledger_detail` */

DROP TABLE IF EXISTS `ledger_detail`;

CREATE TABLE `ledger_detail` (
  `Ledger_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ledger_Master_Id` int(11) DEFAULT NULL,
  `Transaction_Date` date DEFAULT NULL,
  `Transaction_Time` time(6) DEFAULT NULL,
  `Transaction_No` int(11) DEFAULT NULL,
  `Particular` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Debit` decimal(18,6) DEFAULT NULL,
  `Credit` decimal(18,6) NOT NULL,
  `Purchase_Master_Id` int(11) DEFAULT NULL,
  `PurchaseReturn_Master_Id` int(11) DEFAULT NULL,
  `Sales_Master_Id` int(11) DEFAULT NULL,
  `SalesReturn_Master_Id` int(11) DEFAULT NULL,
  `Customer_Ledger_Detail_Id` int(11) DEFAULT NULL,
  `Supplier_Ledger_Detail_Id` int(11) DEFAULT NULL,
  `Employee_Ledger_Detail_Id` int(11) DEFAULT NULL,
  `Bank_Ledger_Detail_Id` int(11) DEFAULT NULL,
  `ExpenseEntry_Detail_Id` int(11) DEFAULT NULL,
  `Effect_As_Credit` tinyint(1) DEFAULT NULL,
  `Effect_On_CashBook` tinyint(1) DEFAULT NULL,
  `Ledger_Detail_Contra` int(11) DEFAULT NULL,
  `Payment_Mode` int(11) DEFAULT NULL,
  `Voucher_Type` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Ledger_Detail_Id`),
  KEY `FK_Ledger_Detail_Ledger_Master` (`Ledger_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `ledger_detail` */

/*Table structure for table `ledger_group` */

DROP TABLE IF EXISTS `ledger_group`;

CREATE TABLE `ledger_group` (
  `Ledger_Group_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ledger_Group_Name` varchar(50) DEFAULT NULL,
  `Ledger_Group_Description` varchar(50) DEFAULT NULL,
  `Nature` varchar(50) DEFAULT NULL,
  `IsEditable` tinyint(1) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_by` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Ledger_Group_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `ledger_group` */

/*Table structure for table `ledger_master` */

DROP TABLE IF EXISTS `ledger_master`;

CREATE TABLE `ledger_master` (
  `Ledger_Id` int(11) NOT NULL,
  `Ledger_Name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Ledger_Group_Id` int(11) DEFAULT NULL,
  `Ledger_SubGroup_Id` int(11) DEFAULT NULL,
  `Ob_Debit` decimal(18,4) DEFAULT NULL,
  `Ob_Credit` decimal(18,4) DEFAULT NULL,
  `Balance` decimal(18,4) DEFAULT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  `Supplier_Id` int(11) DEFAULT NULL,
  `Employee_Id` int(11) DEFAULT NULL,
  `Bank_Id` int(11) DEFAULT NULL,
  `IsShown` tinyint(1) DEFAULT NULL,
  `IsEditable` tinyint(1) DEFAULT NULL,
  `Tax_Id` int(11) DEFAULT NULL,
  `Remark` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Ledger_Id`),
  UNIQUE KEY `IX_Ledger_Master` (`Ledger_Name`),
  KEY `FK_Ledger_Master_Bank` (`Bank_Id`),
  KEY `FK_Ledger_Master_Customer` (`Customer_Id`),
  KEY `FK_Ledger_Master_EmployeeRegistration` (`Employee_Id`),
  KEY `FK_Ledger_Master_Ledger_Group` (`Ledger_Group_Id`),
  KEY `FK_Ledger_Master_Supplier` (`Supplier_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `ledger_master` */

/*Table structure for table `ledger_subgroup` */

DROP TABLE IF EXISTS `ledger_subgroup`;

CREATE TABLE `ledger_subgroup` (
  `Ledger_SubGroup_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ledger_SubGroup_Name` varchar(50) DEFAULT NULL,
  `Ledger_SubGroup_Description` varchar(50) DEFAULT NULL,
  `IsEditable` tinyint(1) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_by` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Ledger_SubGroup_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `ledger_subgroup` */

/*Table structure for table `measurement_detail` */

DROP TABLE IF EXISTS `measurement_detail`;

CREATE TABLE `measurement_detail` (
  `Measurement_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Quamees_Length` decimal(18,3) DEFAULT NULL,
  `Shoulder` decimal(18,3) DEFAULT NULL,
  `Sleeve_Lenght` decimal(18,3) DEFAULT NULL,
  `Collor_Size` decimal(18,3) DEFAULT NULL,
  `Collor_Model` int(11) DEFAULT NULL,
  `Chest_Right` decimal(18,3) DEFAULT NULL,
  `Chest_Left` decimal(18,3) DEFAULT NULL,
  `Waist` decimal(18,3) DEFAULT NULL,
  `BottomHem` decimal(18,3) DEFAULT NULL,
  `Color` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Leg_Opening` decimal(18,3) DEFAULT NULL,
  `Cuff_Lenght` decimal(18,3) DEFAULT NULL,
  `Strip_Lenght` decimal(18,3) DEFAULT NULL,
  `Ban_Strip` decimal(18,3) DEFAULT NULL,
  `Front_Pocket` tinyint(1) DEFAULT NULL,
  `Side_Pocket` tinyint(1) DEFAULT NULL,
  `Side_Pocket_Count` int(11) DEFAULT NULL,
  `Shalwar_Pocket` tinyint(1) DEFAULT NULL,
  `half_Strip` tinyint(1) DEFAULT NULL,
  `Round_Ban` tinyint(1) DEFAULT NULL,
  `Cuff_Double` tinyint(1) DEFAULT NULL,
  `Chalk_Strip_Button` tinyint(1) DEFAULT NULL,
  `Other_Detail` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Image64` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Measurement_Detail_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `measurement_detail` */

/*Table structure for table `measurement_master` */

DROP TABLE IF EXISTS `measurement_master`;

CREATE TABLE `measurement_master` (
  `Measurement_Master_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Invoice_No` int(11) DEFAULT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  `Customer_Name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Mobile` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Measurement_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `measurement_master` */

/*Table structure for table `mobileprintrequest` */

DROP TABLE IF EXISTS `mobileprintrequest`;

CREATE TABLE `mobileprintrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Kot_Master_Id` int(11) DEFAULT NULL,
  `Kot_Parcel_Id` int(11) DEFAULT NULL,
  `Print_Type` int(11) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mobileprintrequest` */

/*Table structure for table `model` */

DROP TABLE IF EXISTS `model`;

CREATE TABLE `model` (
  `Model_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Model_Code` varchar(50) DEFAULT NULL,
  `Model_Name` varchar(100) NOT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Model_ID`),
  UNIQUE KEY `IX_Model` (`Model_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `model` */

/*Table structure for table `nationality` */

DROP TABLE IF EXISTS `nationality`;

CREATE TABLE `nationality` (
  `Nationality_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nationality_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Currency` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Currency_Secondary` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Nationality_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `nationality` */

/*Table structure for table `notes` */

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `Notes_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Notes_Name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Notes_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `notes` */

/*Table structure for table `openingstock_list` */

DROP TABLE IF EXISTS `openingstock_list`;

CREATE TABLE `openingstock_list` (
  `Opening_Stock_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Id` int(11) DEFAULT NULL,
  `Prodcut_Detail_Id` int(11) DEFAULT NULL,
  `Opening_Stock` decimal(18,4) DEFAULT NULL,
  `Opening_Purchase_Rate` decimal(18,4) DEFAULT NULL,
  `Opening_Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `Opening_Wholesale_Rate` decimal(18,4) DEFAULT NULL,
  `Opening_Retail_Rate` decimal(18,4) DEFAULT NULL,
  `Opening_MRP` decimal(18,4) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Opening_Stock_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `openingstock_list` */

/*Table structure for table `package` */

DROP TABLE IF EXISTS `package`;

CREATE TABLE `package` (
  `Package_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Package_Code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Package_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Package_Rate` decimal(18,4) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Package_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `package` */

/*Table structure for table `package_detail` */

DROP TABLE IF EXISTS `package_detail`;

CREATE TABLE `package_detail` (
  `Package_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Package_Id` int(11) DEFAULT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Quantity` decimal(18,4) DEFAULT NULL,
  `Rate` decimal(18,4) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Conversion_Factor` decimal(18,2) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Package_Detail_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `package_detail` */

/*Table structure for table `payment_mode` */

DROP TABLE IF EXISTS `payment_mode`;

CREATE TABLE `payment_mode` (
  `Payment_Mode_Id` int(11) DEFAULT NULL,
  `Payment_Mode_Name` varchar(50) DEFAULT NULL,
  `Payment_Mode_Description` varchar(50) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `payment_mode` */

/*Table structure for table `previous_z_report` */

DROP TABLE IF EXISTS `previous_z_report`;

CREATE TABLE `previous_z_report` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Dine_IN_Amount` decimal(18,2) DEFAULT NULL,
  `Parcel_Amount` decimal(18,2) DEFAULT NULL,
  `Delivery_Amount` decimal(18,2) DEFAULT NULL,
  `Total_Discount` decimal(18,2) DEFAULT NULL,
  `Total_Tax` decimal(18,2) DEFAULT NULL,
  `last_Reported_Date` varchar(20) DEFAULT NULL,
  `Last_Report_Time` varchar(20) DEFAULT NULL,
  `BillNoFirst` int(11) DEFAULT NULL,
  `BillNoLast` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `previous_z_report` */

/*Table structure for table `product_brand` */

DROP TABLE IF EXISTS `product_brand`;

CREATE TABLE `product_brand` (
  `Brand_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Brand_Code` varchar(50) DEFAULT NULL,
  `Brand_Name` varchar(100) NOT NULL,
  `BrandImage` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Brand_ID`),
  UNIQUE KEY `IX_Product_Brand` (`Brand_Name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `product_brand` */

insert  into `product_brand`(`Brand_ID`,`Brand_Code`,`Brand_Name`,`BrandImage`,`Company_Id`,`Modified_By`,`Modified_Date`) values 
(1,'5999','jjjkkk',NULL,NULL,NULL,NULL);

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `Category_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category_Code` varchar(50) DEFAULT '',
  `Category_Name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `CategoryImage` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Regional_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Category_ID`),
  UNIQUE KEY `IX_Product_Category` (`Category_Name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `product_category` */

insert  into `product_category`(`Category_ID`,`Category_Code`,`Category_Name`,`CategoryImage`,`Regional_Name`,`Company_Id`,`Modified_By`,`Modified_Date`) values 
(1,'555','tttt',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `product_department` */

DROP TABLE IF EXISTS `product_department`;

CREATE TABLE `product_department` (
  `Product_Department_Id` int(11) DEFAULT NULL,
  `Product_Department_Name` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Is_Visible` tinyint(1) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `product_department` */

/*Table structure for table `product_detail` */

DROP TABLE IF EXISTS `product_detail`;

CREATE TABLE `product_detail` (
  `Product_Detail_Id` int(11) NOT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Code` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Product_Detail_Name` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Op_Stock` decimal(18,4) DEFAULT NULL,
  `Stock` decimal(18,4) DEFAULT NULL,
  `Purchase_Rate` decimal(18,4) DEFAULT NULL,
  `Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `Wholesale_Rate_Percentage` decimal(18,2) DEFAULT NULL,
  `Wholesale_Rate` decimal(18,4) DEFAULT NULL,
  `Retail_Rate_Percentage` decimal(18,2) DEFAULT NULL,
  `Retail_Rate` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Batch_No` int(11) DEFAULT NULL,
  `Manufactoring_Date` date DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL,
  `Created_Date` date DEFAULT NULL,
  `Color_Id` int(11) DEFAULT NULL,
  `Size_Id` int(11) DEFAULT NULL,
  `Model_Id` int(11) DEFAULT NULL,
  `PLU_No` int(11) DEFAULT NULL,
  `LotFrom` int(11) DEFAULT NULL,
  `Isdelete` tinyint(1) DEFAULT NULL,
  `Purchase_Detail_Id` int(11) DEFAULT NULL,
  `Godown_Id` int(11) DEFAULT NULL,
  `ProductDetail_Supplier_Id` int(11) DEFAULT NULL,
  `Selling_Unit_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  `Company_Id` int(11) NOT NULL,
  PRIMARY KEY (`Product_Detail_Id`,`Company_Id`),
  KEY `FK_Product_Detail_Product_Master` (`Product_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `product_detail` */

insert  into `product_detail`(`Product_Detail_Id`,`Product_Id`,`Product_Code`,`Product_Detail_Name`,`Barcode`,`Op_Stock`,`Stock`,`Purchase_Rate`,`Purchase_Cost`,`Wholesale_Rate_Percentage`,`Wholesale_Rate`,`Retail_Rate_Percentage`,`Retail_Rate`,`MRP`,`Batch_No`,`Manufactoring_Date`,`Expiry_Date`,`Created_Date`,`Color_Id`,`Size_Id`,`Model_Id`,`PLU_No`,`LotFrom`,`Isdelete`,`Purchase_Detail_Id`,`Godown_Id`,`ProductDetail_Supplier_Id`,`Selling_Unit_Id`,`Modified_By`,`Modified_Date`,`Company_Id`) values 
(1,1,'6221078763503','creamy honey (plain) 225 gm',11000,10.0000,11.0000,20.0000,30.0000,NULL,40.0000,NULL,50.0000,60.0000,NULL,'2019-10-30','2019-10-30','2020-07-18',2,NULL,NULL,NULL,1,0,NULL,NULL,7,NULL,1,'2020-07-18 11:12:33.000000',1),
(2,2,'6221078763466','creamy honey almond & cinnamon 225 gm ',11001,20.0000,-11.0000,30.0000,40.0000,NULL,50.0000,NULL,60.0000,0.0000,NULL,NULL,NULL,'2020-07-18',2,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:34.000000',1),
(3,3,'6221078763473','creamy honey Ginger 225 gm ',11002,30.0000,15.7500,73.5000,70.0000,NULL,70.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:35.000000',1),
(4,4,'6221078767419','creamy honey ( plain) - imtenan 250 gm',11003,40.0000,40.0000,20.0000,50.0000,NULL,60.0000,NULL,80.0000,80.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:35.000000',1),
(5,5,'6221078767402','creamy honey ( plain) - imtenan 450 gm',11004,50.0000,43.0000,0.0000,0.0000,NULL,0.0000,NULL,48.4000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:36.000000',1),
(6,6,'6221078763930','Hadramy mountain Honey - 1 kg gift box',11005,2.0000,-2.0000,0.0000,0.0000,NULL,0.0000,NULL,1017.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:37.000000',1),
(7,7,'6221078251291','Hadramy mountain Honey - 0.5 kg gift box',11006,50.0000,49.0000,15.0000,15.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:39.000000',1),
(8,8,'6221078251161','Hadramy mountain Honey 180 gm',11007,33.0000,28.0000,0.0000,10.0000,NULL,0.0000,NULL,203.5000,0.0000,NULL,NULL,NULL,'2020-07-18',2,1,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:40.000000',1),
(9,9,'6221078766207','Hadramy mountain Honey - 2.2 kg gift box',11008,0.0000,10.0000,20.0000,21.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:41.000000',1),
(10,10,'6221078766191','Kashmir mountain Honey - 2.2 kg gift box',11009,0.0000,-2.0000,0.0000,0.0000,NULL,0.0000,NULL,935.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:42.000000',1),
(11,11,'6221078763923','Kashmir mountain Honey - 1 kg gift box',11010,0.0000,986.0000,170.0000,178.5000,NULL,150.0000,NULL,150.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:43.000000',1),
(12,12,'6221078261290','Kashmir mountain Honey - 0.5 kg gift box',11011,0.0000,-8.0000,10.0000,10.5000,NULL,10.0000,NULL,10.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:44.000000',1),
(13,13,'6221078261160','Kashmir mountain Honey 180 gm',11012,0.0000,-4.5000,0.0000,0.0000,NULL,0.0000,NULL,114.4000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:45.000000',1),
(14,14,'6221078767501','Sidr honey - imtenan 450 gm',11013,0.0000,-6.0000,0.0000,0.0000,NULL,0.0000,NULL,286.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:46.000000',1),
(15,15,'6221078767518','Sidr honey - imtenan 250 gm',11014,0.0000,1.0000,100.0000,100.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:47.000000',1),
(16,16,'6221078766177','clover honey 2.2 kg',11015,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,189.7500,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:48.000000',1),
(17,17,'6221078763800','clover honey 1 kg',11016,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,95.1500,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:49.000000',1),
(18,18,'6221078011277','clover honey - imtenan 450 gm',11017,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,48.4000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:50.000000',1),
(19,19,'6221078011192','clover honey - imtenan 250 gm',11018,0.0000,-1.0000,0.0000,0.0000,NULL,0.0000,NULL,28.6000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:51.000000',1),
(20,20,'6221078766184','Orange honey 2.2 kg',11019,0.0000,-1.0000,0.0000,0.0000,NULL,0.0000,NULL,189.7500,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:52.000000',1),
(21,21,'6221078763824','Orange honey 1 kg',11020,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,95.1500,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:53.000000',1),
(22,22,'6221078241278','Orange honey - imtenan 450 gm',11021,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,48.4000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:54.000000',1),
(23,23,'6221078241193','Orange honey - imtenan 250 gm',11022,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,28.6000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:55.000000',1),
(24,24,'6221078091279','black seed honey 450 gm',11023,0.0000,-1.0000,0.0000,0.0000,NULL,0.0000,NULL,71.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:56.000000',1),
(25,25,'6221078767037','Spain honey 450 gm',11024,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,69.8500,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:57.000000',1),
(26,26,'6221078111274','spring honey - imtenan 450 gm',11025,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,48.4000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:58.000000',1),
(27,27,'6221078111199','spring honey - imtenan 250 gm',11026,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,28.6000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:59.000000',1),
(28,28,'6221078767280','Acacia honey - imtenan 450 gm',11027,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,69.8500,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:12:59.000000',1),
(29,29,'6221078767297','Acacia honey - imtenan 250 gm',11028,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,44.5500,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:00.000000',1),
(30,30,'6221078763831','Wild Blossom Honey - gift box 1 kg',11029,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,151.8000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:01.000000',1),
(31,31,'6221078766139','pure honey - imtenan 450 gm',11030,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,69.8500,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:02.000000',1),
(32,32,'6221078763275','Echinacea Honey (Infusion) 180 gm',11031,0.0000,-8.0000,0.0000,0.0000,NULL,0.0000,NULL,44.5500,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:03.000000',1),
(33,33,'9400501001109','Comvita Manuka Honey UMF®5+',11032,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,93.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:05.000000',1),
(34,34,'6400501003615','Comvita Manuka Honey UMF®10+',11033,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,181.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:06.000000',1),
(35,35,'8906008330151','zaafran honey 250 gm ',11034,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,137.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:07.000000',1),
(36,36,'8906008330199','Gold Honey 250 gm ',11035,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,467.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:08.000000',1),
(37,37,'33333333','Organic Hibiscus herbal tea - 16 filter bag',11036,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,16.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:09.000000',1),
(38,38,'6221078762575','Organic Anise herbal tea - 16 filter bag',11037,0.0000,-1.0000,0.0000,0.0000,NULL,0.0000,NULL,16.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:10.000000',1),
(39,39,'6221078762599','Green Tea (Chun mee)  tea - 16 filter ',11038,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,24.2000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:11.000000',1),
(40,40,'6221078762889','Green Tea (Gunpowder)  tea - 16 filter ',11039,0.0000,-1.0000,0.0000,0.0000,NULL,0.0000,NULL,24.2000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:12.000000',1),
(41,41,'6221078762568','Organic Peppermint herbal tea - 16 filter bag',11040,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,16.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:13.000000',1),
(42,42,'6221078765286','Organic Cinnamon herbal tea - 16 filter bag',11041,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,19.8000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:14.000000',1),
(43,43,'4444444','Ginseng Chai Tea  - 18 filter ',11042,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,38.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:15.000000',1),
(44,44,'6221078762018',' Parsley & Celery  Tea   - 18 filter ',11043,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,24.2000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:16.000000',1),
(45,45,'6221078762063','Lavender and chamomile tea  - 18 filter ',11044,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,24.2000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:17.000000',1),
(46,46,'6221078762100','Senna Tea   - 18 filter ',11045,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,24.2000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:18.000000',1),
(47,47,'6221078762155','Chicory & Artichoke Tea  - 18 filter ',11046,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,24.2000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:19.000000',1),
(48,48,'6221078763770','cinnamon and ginger tea  - 18 filter ',11047,2.0000,1.0000,0.0000,0.0000,NULL,0.0000,NULL,24.2000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:20.000000',1),
(49,49,'6221078762537','Dandelion tea 35 gm',11048,0.0000,-1.0000,0.0000,0.0000,NULL,0.0000,NULL,22.0000,0.0000,NULL,NULL,NULL,'2020-07-18',2,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:22.000000',1),
(50,50,'6221078767228','jasmine green tea pearl 50 gm ',11049,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,66.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:22.000000',1),
(51,51,'6221078762230','Organic Thyme 35 gm',11050,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,11.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:24.000000',1),
(52,52,'6221078762278','Organic Marjoram 15 gm',11051,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,11.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:25.000000',1),
(53,53,'6221078762209','Organic Flax Seed 100 gm',11052,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,11.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:26.000000',1),
(54,54,'6221078762261','Organic Peppermint 25 gm glass',11053,0.0000,-7.0000,0.0000,0.0000,NULL,0.0000,NULL,11.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:27.000000',1),
(55,55,'6221078762346','Organic Coriander Seeds',11054,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,11.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:28.000000',1),
(56,56,'6221078762223','Organic Cumin 80 gm',11055,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,16.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:29.000000',1),
(57,57,'6221078762193','Organic Black Seed 100 gm',11056,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,16.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:30.000000',1),
(58,58,'6221078762773','Turmeric 100 gm',11057,0.0000,-2.0000,0.0000,0.0000,NULL,0.0000,NULL,16.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:31.000000',1),
(59,59,'6221078762322','Onion Slices 75 gm',11058,0.0000,-1.0000,0.0000,0.0000,NULL,0.0000,NULL,16.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:32.000000',1),
(60,60,'6221078762247','Organic Ginger 70 gm',11059,50.0000,50.0000,0.0000,0.0000,NULL,0.0000,NULL,19.8000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:33.000000',1),
(61,61,'6221078766337','spices Kabsa 100 gm',11060,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,19.8000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:34.000000',1),
(62,62,'6221078762339','Organic Garlic Powder 100 gm',11061,0.0000,-1.0000,0.0000,0.0000,NULL,0.0000,NULL,19.8000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:35.000000',1),
(63,63,'6221078762254','Organic Cinnamon 85 gm',11062,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,19.8000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:36.000000',1),
(64,64,'6221078766320','spices biryani 100 gm',11063,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,22.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:37.000000',1),
(65,65,'6221078766351','beef spices 80 gm',11064,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,22.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:38.000000',1),
(66,66,'6221078766344','fish spices 100 gm',11065,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,22.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:39.000000',1),
(67,67,'6221078151164','royal extra 180 gm',11066,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,72.6000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:40.000000',1),
(68,68,'6221078301163','Bee immune 180 gm',11067,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,96.8000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:41.000000',1),
(69,69,'6221078842116','wheat grass powder 70 gm',11068,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,49.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:42.000000',1),
(70,70,'6221078202125','psyllium husk 75 gm',11069,0.0000,0.0000,0.0000,25.0000,NULL,0.0000,NULL,33.0000,0.0000,NULL,NULL,'2019-04-10','2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:44.000000',1),
(71,71,'6221078202149','psyllium husk 125 gm',11070,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,60.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:45.000000',1),
(72,72,'6221078722142','spirulina 140 gm',11071,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,66.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:46.000000',1),
(73,73,'6221078766078','Dates syrup 450 gm',11072,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,29.7000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:47.000000',1),
(74,74,'6221078767112','Coconut Oil - Virgin organic 500ml',11073,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,64.9000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:49.000000',1),
(75,75,'6221078761943','Eruca oil 25 ml',11074,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,15.4000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:50.000000',1),
(76,76,'6221078761875','Coconut Oil - Fractionated 50 ml',11075,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,18.7000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:51.000000',1),
(77,77,'6221078761882','sweet almond oil 50 ml',11076,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,44.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:52.000000',1),
(78,78,'6221078763428','wheat germ oil 50 ml',11077,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,55.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:53.000000',1),
(79,79,'6221078761905','Jojoba oil 50 ml',11078,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,44.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:54.000000',1),
(80,80,'6221078761868','olive oil 50 ml',11079,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,15.4000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:55.000000',1),
(81,81,'6221078763435','Coconut Oil - Fractionated 250 ml',11080,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,33.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:56.000000',1),
(82,82,'111111','Propolis Soap 100 gm',11081,0.0000,0.0000,0.0000,210.0000,NULL,220.0000,NULL,230.0000,240.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:57.000000',1),
(83,83,'6221078763046','Honey and Milk Soap 100 gm',11082,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,18.7000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:58.000000',1),
(84,84,'222222','Dead Sea Soap 100 gm',11083,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,18.7000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:13:59.000000',1),
(85,85,'6221078065126','protien bar coconut 70 gm',11084,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,16.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:00.000000',1),
(86,86,'6221078605124','protien bar cinnamon 70 gm',11085,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,16.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:01.000000',1),
(87,87,'6221078185121','protien bar peanuts 70 gm',11086,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,16.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:02.000000',1),
(88,88,'6221078107512','protien bar cocoa 70 gm',11087,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,16.5000,0.0000,NULL,NULL,NULL,'2020-07-18',3,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:03.000000',1),
(89,89,'123','weigh proteine 500mg',11088,20.0000,20.0000,100.0000,100.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,'2019-04-18','2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:04.000000',1),
(90,90,'','jhkhk',11089,0.0000,0.0000,10.0000,20.0000,NULL,21.0000,NULL,45.0000,10.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:06.000000',1),
(91,91,'15488748','sample',11090,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:08.000000',1),
(92,93,'1234567890','Homey Cake',11091,2.0000,2.0000,10.0000,20.0000,NULL,30.0000,NULL,40.0000,50.0000,NULL,'2019-04-18','2019-09-05','2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:09.000000',1),
(93,93,'1234567890','Homey Cake',11092,10.0000,10.0000,10.0000,20.0000,NULL,30.0000,NULL,40.0000,50.0000,NULL,NULL,'2020-03-12','2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:10.000000',1),
(107,95,'478947895','IPhone',11093,2.0000,2.0000,10.0000,20.0000,NULL,30.0000,NULL,40.0000,50.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:11.000000',1),
(108,97,'17852963852741','Lux',11094,2.0000,2.0000,20.0000,30.0000,NULL,40.0000,NULL,50.0000,60.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:12.000000',1),
(109,97,'17852963852741','Lux',11095,10.0000,9.0000,20.0000,30.0000,NULL,40.0000,NULL,50.0000,60.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:13.000000',1),
(110,99,'814269','Grapes',11096,0.0000,-3.0000,10.0000,0.0000,NULL,15.0000,NULL,15.0000,50.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:14.000000',1),
(111,101,'12345678','Computer',11097,2.0000,1.0000,0.0000,10.0000,NULL,20.0000,NULL,30.0000,40.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:16.000000',1),
(112,103,'7895484987987','Samsumg A30 black',11098,0.0000,-43.5000,10.0000,10.0000,NULL,11.0000,NULL,11.0000,40.0000,NULL,NULL,NULL,'2020-07-18',3,1,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:17.000000',1),
(117,1,'586895','creamy honey (plain) 225 gm',11099,10.0000,9.5000,20.0000,30.0000,NULL,40.0000,NULL,50.0000,60.0000,NULL,NULL,NULL,'2020-07-18',3,1,2,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:18.000000',1),
(118,1,'6221078763503','creamy honey (plain) 225 gm',11100,0.0000,-1.0000,20.0000,20.0000,NULL,35.0000,NULL,30.0000,0.0000,NULL,NULL,NULL,'2020-07-18',4,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:19.000000',1),
(119,105,'457879','sammmmmmm',11101,0.0000,-18.0000,10.0000,10.0000,NULL,10.0000,NULL,10.0000,50.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:20.000000',1),
(120,106,'617950410072','mixed fruite jam',11102,0.0000,-50.0000,0.0000,0.0000,NULL,0.0000,NULL,7.5000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:21.000000',1),
(121,108,'548979','Service 12',11103,0.0000,-1.0000,0.0000,0.0000,NULL,0.0000,NULL,100.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:22.000000',1),
(122,110,'786446','Sample',11104,0.0000,-1.0000,10.0000,10.5000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:24.000000',1),
(1121,1108,'44984979df','Item Test PurchaseCost',11105,50.0000,50.0000,50.0000,52.5000,NULL,50.0000,NULL,50.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:25.000000',1),
(1122,1110,'55875','MI A4',11106,0.0000,-10.0000,0.0000,10.0000,NULL,0.0000,NULL,20.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:28.000000',1),
(2123,1112,'ABB1112','Arabic Bread Big',11108,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,10.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:28.000000',1),
(2124,1113,'Tli1113','Test liva item',11109,2.0000,102.0000,0.0000,100.0000,NULL,0.0000,NULL,250.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:29.000000',1),
(2125,1114,'ST1114','Stock Test',11110,50.0000,69.0000,10.0000,10.5000,NULL,10.0000,NULL,10.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:30.000000',1),
(2126,1115,'UT1115','Unit Test',11111,10.0000,20.1000,0.0000,0.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',1,NULL,NULL,NULL,1,0,NULL,NULL,NULL,1007,1,'2020-07-18 11:14:31.000000',1),
(2127,1116,'KT1116','KG Test',11112,25.5000,36.6370,0.2500,0.2625,NULL,250.0000,NULL,250.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:32.000000',1),
(2128,1117,'mST1117','min Stock Test',11113,25.0000,50.0000,0.0000,0.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:33.000000',1),
(2129,1118,'6291108174012','mash dal split 400gm',11114,5.0000,3.0000,3.6600,3.6600,NULL,5.0000,NULL,5.0000,5.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:34.000000',1),
(2130,1119,'2010000377086','moong dal split 400gm',11115,4.0000,3.0000,0.0000,0.0000,NULL,5.0000,NULL,5.0000,5.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:35.000000',1),
(2131,1120,'6291108170724','black chick peas400gm',11116,5.0000,4.0000,0.0000,0.0000,NULL,4.2500,NULL,4.2500,4.2500,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:36.000000',1),
(2132,1121,'6291108176733','toot dal 400mg',11117,6.0000,6.0000,0.0000,0.0000,NULL,4.5000,NULL,4.5000,4.5000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:37.000000',1),
(2133,1122,'6291108174494','moong 400mg',11118,6.0000,6.0000,0.0000,0.0000,NULL,4.0000,NULL,4.0000,4.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:38.000000',1),
(2134,1123,'6291108175507','red kidney beans 400gm',11119,7.0000,7.0000,0.0000,0.0000,NULL,6.0000,NULL,6.0000,6.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:39.000000',1),
(2135,1124,'2010000376812','rice flake white',11120,4.0000,4.0000,0.0000,0.0000,NULL,3.0000,NULL,3.0000,3.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:40.000000',1),
(2136,1125,'6291108174616','moong whole 400mg',11121,2.0000,2.0000,0.0000,0.0000,NULL,4.5000,NULL,4.5000,4.5000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:42.000000',1),
(2137,1126,'2010000377079','moong whole800gm ',11122,3.0000,3.0000,0.0000,0.0000,NULL,7.5000,NULL,7.5000,7.5000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:43.000000',1),
(2138,1127,'554726174301','masoor dal 400gm',11123,6.0000,6.0000,0.0000,0.0000,NULL,2.5000,NULL,2.5000,2.5000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:44.000000',1),
(2139,1128,'6291108174524','moong dal 800gm',11124,7.0000,7.0000,0.0000,0.0000,NULL,8.0000,NULL,8.0000,8.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:45.000000',1),
(2140,1129,'6291108174180','masoor dal 800gm',11125,7.0000,6.0000,0.0000,0.0000,NULL,5.0000,NULL,5.0000,5.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:46.000000',1),
(2141,1130,'554726174305','chana dal',11126,6.0000,1.0000,0.0000,0.0000,NULL,3.0000,NULL,3.0000,3.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:47.000000',1),
(2142,1131,'554726174321','moong dal 400mg',11127,6.0000,6.0000,0.0000,0.0000,NULL,3.5000,NULL,3.5000,3.5000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:48.000000',1),
(2143,1132,'6291108174302','mattar dal',11128,5.0000,5.0000,0.0000,0.0000,NULL,4.0000,NULL,4.0000,4.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:49.000000',1),
(2144,1133,'6291108171707','chana dal 400g',11129,7.0000,7.0000,0.0000,0.0000,NULL,3.5000,NULL,3.5000,3.5000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:50.000000',1),
(2145,1134,'554726174336','green masoor 400gm',11130,6.0000,6.0000,0.0000,0.0000,NULL,4.0000,NULL,4.0000,4.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:51.000000',1),
(2146,1135,'554726174364','popcorn400gm',11131,6.0000,-60.0000,9.5238,10.5000,NULL,25.0000,NULL,10.5000,25.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:52.000000',1),
(2147,1136,'4800502128136','brown sugar ',11132,5.0000,3.0000,10.0000,10.5000,NULL,15.0000,NULL,15.0000,15.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:53.000000',1),
(2148,1137,'2010000376881','black eye beans ',11133,2.0000,0.0000,0.0000,0.0000,NULL,4.5000,NULL,4.5000,4.5000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:54.000000',1),
(2149,1138,'1978145','green peas 400gm',11134,3.0000,0.0000,0.0000,0.0000,NULL,4.0000,NULL,4.0000,4.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:55.000000',1),
(2150,1139,'554726174728','soya wadi200gm',11135,10.0000,10.0000,0.0000,0.0000,NULL,3.0000,NULL,3.0000,3.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:55.000000',1),
(2151,1140,'554726174734','soya wadi 100gm',11136,10.0000,9.0000,0.0000,0.0000,NULL,1.5000,NULL,1.5000,1.5000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:57.000000',1),
(2152,1141,'6291108177105','white beans 400gm',11137,1.0000,0.0000,0.0000,0.0000,NULL,5.0000,NULL,5.0000,5.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:58.000000',1),
(2153,1142,'554726174375','indian muthiran400gm',11138,6.0000,5.0000,0.0000,0.0000,NULL,4.0000,NULL,4.0000,4.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:14:59.000000',1),
(2154,1143,'6291104191112','semolina rava 500gm',11139,9.0000,8.0000,0.0000,0.0000,NULL,4.0000,NULL,4.0000,4.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:00.000000',1),
(2156,1145,'6291104191020','moong whole 500mg',11140,6.0000,0.0000,0.0000,0.0000,NULL,5.0000,NULL,5.0000,5.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:00.000000',1),
(2158,1146,'TF1146','Test Focus',11141,100.0000,99.0000,10.5000,10.5000,NULL,0.0000,NULL,10.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:01.000000',1),
(3158,2146,'p1147','ppp',11142,0.0000,-6.0000,0.0000,0.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:03.000000',1),
(3159,2147,'v2147','vvvvvvv',11143,0.0000,-1.0000,0.0000,0.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:04.000000',1),
(4158,3146,'ti12148','testing item 123',11144,0.0000,0.0000,100.0000,100.0000,NULL,0.0000,NULL,200.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:05.000000',1),
(4159,3147,'b3147','boxpc',11145,100.0000,96.0000,10.0000,10.0000,NULL,0.0000,NULL,20.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:05.000000',1),
(4160,103,'7895484987987','Samsumg A30',11146,0.0000,16.0000,10.0000,10.5000,NULL,0.0000,NULL,10.5000,0.0000,NULL,NULL,NULL,'2020-07-18',2,2,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:06.000000',1),
(4161,3148,'1235468','test TaxIncluded',11147,0.0000,-11.0000,10.0000,10.0000,NULL,15.0000,NULL,15.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:07.000000',1),
(4162,3149,'DI3149','Discount Item',11148,10.0000,6.0000,80.0000,80.0000,NULL,0.0000,NULL,100.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:08.000000',1),
(4163,3150,'OS3150','Opening Stock',11149,50.0000,50.0000,0.0000,0.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:09.000000',1),
(5163,4150,'TT3151','Task TEst',11150,100.0000,100.0000,20.0000,20.0000,NULL,0.0000,NULL,30.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:11.000000',1),
(5164,4151,'t4151','test2',11151,0.0000,0.0000,35.0000,35.0000,NULL,0.0000,NULL,45.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:12.000000',1),
(5165,4152,'t4152','test3',11152,0.0000,0.0000,50.0000,50.0000,NULL,0.0000,NULL,60.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:13.000000',1),
(5166,4153,'t4153','tt',11153,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:14.000000',1),
(5167,4154,'F4154','Fish',11154,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:15.000000',1),
(5168,1,'6221078763503','creamy honey (plain) 225 gm',11155,50.0000,50.0000,0.0000,0.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,7,NULL,1,'2020-07-18 11:15:16.000000',1),
(5169,1,'6221078763503','creamy honey (plain) 225 gm',11156,40.0000,38.0000,0.0000,0.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,8,NULL,1,'2020-07-18 11:15:17.000000',1),
(5170,4155,'tU4155','test Unit',11157,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,60.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,0,1,'2020-07-18 11:15:18.000000',1),
(5171,1115,'2560','Unit Test',11158,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,1008,1,'2020-07-18 11:15:19.000000',1),
(5174,4157,'C4156','Cheees ',11159,10.6000,8.5000,0.0000,0.0000,NULL,0.0000,NULL,16.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:20.000000',1),
(5175,4158,'M14158','Mobile 1',11160,20.0000,20.0000,0.0000,0.0000,NULL,1000.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:21.000000',1),
(5176,4159,'TP4159','Touch Pad',11161,10.0000,9.0000,0.0000,0.0000,NULL,10.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:22.000000',1),
(6175,5158,'D4160','DDDDDDDDD',11162,0.0000,-10.0000,0.0000,0.0000,NULL,0.0000,NULL,60.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:23.000000',1),
(7175,6158,'00010','popo',11163,0.0000,-3.2800,0.0000,0.0000,NULL,0.0000,NULL,2.0000,0.0000,NULL,NULL,NULL,'2020-07-18',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,1,'2020-07-18 11:15:24.000000',1);

/*Table structure for table `product_imei` */

DROP TABLE IF EXISTS `product_imei`;

CREATE TABLE `product_imei` (
  `IMEI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Detail_ID` int(11) DEFAULT NULL,
  `IMEI_Number` varchar(50) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `Purchase_Detail_ID` int(11) DEFAULT NULL,
  `Sales_Detail_ID` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`IMEI_ID`),
  UNIQUE KEY `AK_Product_IMEI_Column` (`IMEI_Number`),
  KEY `FK_Product_IMEI_Product_Detail` (`Product_Detail_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `product_imei` */

/*Table structure for table `product_master` */

DROP TABLE IF EXISTS `product_master`;

CREATE TABLE `product_master` (
  `Product_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_name` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Short_Name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Product_Code` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Part_No` varchar(20) DEFAULT NULL,
  `Category_ID` int(11) DEFAULT NULL,
  `Brand_ID` int(11) DEFAULT NULL,
  `Department_ID` int(11) DEFAULT NULL,
  `Opening_Stock` decimal(18,4) DEFAULT NULL,
  `Current_Stock` decimal(18,4) DEFAULT 0.0000,
  `Minimum_Stock` decimal(18,4) DEFAULT NULL,
  `Maximum_Stock` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(5,2) DEFAULT 0.00,
  `Cess_Percentage` decimal(5,2) DEFAULT 0.00,
  `Discount_Percentage` decimal(18,4) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT 0.0000,
  `Purchase_Rate` decimal(18,4) DEFAULT NULL,
  `Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `WholeSalePercentage` decimal(18,4) DEFAULT NULL,
  `RetailPercentage` decimal(18,4) DEFAULT NULL,
  `Wholesale_Rate` decimal(18,4) DEFAULT NULL,
  `Retail_Rate` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Quotation_Rate` decimal(18,4) DEFAULT NULL,
  `TaxInclusive` tinyint(1) DEFAULT NULL,
  `Tax_Inclusive_Rate` decimal(18,4) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Pack_Mode` varchar(10) DEFAULT NULL,
  `Image64` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `HSN_CODE` varchar(100) DEFAULT NULL,
  `Remarks` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `PLU_Number` int(11) DEFAULT NULL,
  `Regional_Name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Compensation_Cess` decimal(18,4) DEFAULT NULL,
  `Rack_Id` varchar(25) DEFAULT NULL,
  `Barcode` bigint(20) NOT NULL,
  `Manufacturing_Date` date DEFAULT NULL,
  `Expiry_Date` datetime(6) DEFAULT NULL,
  `Created_Date` datetime(6) DEFAULT NULL,
  `Product_Description` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) NOT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  `Deci` tinyint(1) DEFAULT NULL,
  `Product_Type` int(11) DEFAULT NULL,
  `Service_Percetage` decimal(18,2) DEFAULT NULL,
  `CodeTOPrint` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `Supplier_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Product_Id`,`Company_Id`),
  UNIQUE KEY `IX_Product_Master_Barcode` (`Barcode`),
  UNIQUE KEY `IX_Product_Master_Product_Code` (`Product_Code`),
  KEY `FK_Product_Master_Item_Brand` (`Brand_ID`),
  KEY `FK_Product_Master_Item_Category` (`Category_ID`),
  KEY `FK_Product_Master_Product_Unit` (`Base_Unit_Id`),
  KEY `FK_Product_Master_Supplier` (`Supplier_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6159 DEFAULT CHARSET=latin1;

/*Data for the table `product_master` */

insert  into `product_master`(`Product_Id`,`Product_name`,`Short_Name`,`Product_Code`,`Part_No`,`Category_ID`,`Brand_ID`,`Department_ID`,`Opening_Stock`,`Current_Stock`,`Minimum_Stock`,`Maximum_Stock`,`Tax_Percentage`,`Cess_Percentage`,`Discount_Percentage`,`Discount`,`Purchase_Rate`,`Purchase_Cost`,`WholeSalePercentage`,`RetailPercentage`,`Wholesale_Rate`,`Retail_Rate`,`MRP`,`Quotation_Rate`,`TaxInclusive`,`Tax_Inclusive_Rate`,`Base_Unit_Id`,`Pack_Mode`,`Image64`,`HSN_CODE`,`Remarks`,`PLU_Number`,`Regional_Name`,`Compensation_Cess`,`Rack_Id`,`Barcode`,`Manufacturing_Date`,`Expiry_Date`,`Created_Date`,`Product_Description`,`Company_Id`,`Is_Active`,`Modified_By`,`Modified_Date`,`Deci`,`Product_Type`,`Service_Percetage`,`CodeTOPrint`,`Supplier_Id`) values 
(1,'creamy honey (plain) 225 gm','','6221078763503','',1,1,NULL,10.0000,99.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,26.4000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763503,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:28.000000',1,1,20.00,'',6),
(2,'creamy honey almond & cinnamon 225 gm ','','6221078763466','',1,1,NULL,20.0000,-11.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,26.4000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763466,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:30.000000',1,1,20.00,'',NULL),
(3,'creamy honey Ginger 225 gm ','','6221078763473','',1,1,NULL,30.0000,15.7500,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,26.4000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763473,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:32.000000',1,0,0.00,NULL,NULL),
(4,'creamy honey ( plain) - imtenan 250 gm','','6221078767419','',1,1,NULL,40.0000,40.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,28.6000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078767419,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:34.000000',1,0,0.00,NULL,NULL),
(5,'creamy honey ( plain) - imtenan 450 gm','','6221078767402','',1,1,NULL,50.0000,43.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,48.4000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078767402,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:35.000000',1,0,0.00,NULL,NULL),
(6,'Hadramy mountain Honey - 1 kg gift box','','6221078763930','',1,1,NULL,2.0000,-2.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1017.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763930,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:36.000000',0,0,0.00,NULL,NULL),
(7,'Hadramy mountain Honey - 0.5 kg gift box','','6221078251291','',1,1,NULL,50.0000,49.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,15.0000,15.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078251291,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:38.000000',1,0,0.00,NULL,NULL),
(8,'Hadramy mountain Honey 180 gm','','6221078251161','',1,1,NULL,33.0000,28.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,203.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078251161,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:39.000000',1,0,0.00,NULL,NULL),
(9,'Hadramy mountain Honey - 2.2 kg gift box','','6221078766207','',1,1,NULL,0.0000,10.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1980.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078766207,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:41.000000',1,0,0.00,'',NULL),
(10,'Kashmir mountain Honey - 2.2 kg gift box','','6221078766191','',1,1,NULL,0.0000,-2.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,935.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078766191,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:42.000000',1,0,0.00,NULL,NULL),
(11,'Kashmir mountain Honey - 1 kg gift box','','6221078763923','',1,1,NULL,0.0000,986.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,150.0000,150.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763923,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:43.000000',1,0,0.00,NULL,NULL),
(12,'Kashmir mountain Honey - 0.5 kg gift box','','6221078261290','',1,1,NULL,0.0000,-8.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,10.0000,10.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078261290,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:44.000000',1,0,0.00,NULL,NULL),
(13,'Kashmir mountain Honey 180 gm','','6221078261160','',1,1,NULL,0.0000,-4.5000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,114.4000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078261160,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:46.000000',1,0,0.00,NULL,NULL),
(14,'Sidr honey - imtenan 450 gm','','6221078767501','',1,1,NULL,0.0000,-6.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,286.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078767501,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:48.000000',1,0,0.00,NULL,NULL),
(15,'Sidr honey - imtenan 250 gm','','6221078767518','',1,1,NULL,0.0000,1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,100.0000,100.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078767518,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:49.000000',1,0,0.00,NULL,NULL),
(16,'clover honey 2.2 kg','','6221078766177','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,189.7500,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078766177,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:51.000000',1,0,0.00,NULL,NULL),
(17,'clover honey 1 kg','','6221078763800','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,95.1500,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763800,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:52.000000',1,0,0.00,NULL,NULL),
(18,'clover honey - imtenan 450 gm','','6221078011277','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,48.4000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078011277,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:54.000000',1,0,0.00,NULL,NULL),
(19,'clover honey - imtenan 250 gm','','6221078011192','',1,1,NULL,0.0000,-1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,28.6000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078011192,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:55.000000',1,0,0.00,NULL,NULL),
(20,'Orange honey 2.2 kg','','6221078766184','',1,1,NULL,0.0000,-1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,189.7500,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078766184,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:57.000000',1,0,0.00,NULL,NULL),
(21,'Orange honey 1 kg','','6221078763824','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,95.1500,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763824,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:48:59.000000',1,0,0.00,NULL,NULL),
(22,'Orange honey - imtenan 450 gm','','6221078241278','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,48.4000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078241278,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:00.000000',1,0,0.00,NULL,NULL),
(23,'Orange honey - imtenan 250 gm','','6221078241193','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,28.6000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078241193,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:02.000000',1,0,0.00,NULL,NULL),
(24,'black seed honey 450 gm','','6221078091279','',1,1,NULL,0.0000,-1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,71.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078091279,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:04.000000',1,0,0.00,NULL,NULL),
(25,'Spain honey 450 gm','','6221078767037','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,69.8500,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078767037,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:06.000000',1,0,0.00,NULL,NULL),
(26,'spring honey - imtenan 450 gm','','6221078111274','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,48.4000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078111274,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:08.000000',1,0,0.00,NULL,NULL),
(27,'spring honey - imtenan 250 gm','','6221078111199','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,28.6000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078111199,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:09.000000',1,0,0.00,NULL,NULL),
(28,'Acacia honey - imtenan 450 gm','','6221078767280','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,69.8500,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078767280,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:11.000000',1,0,0.00,NULL,NULL),
(29,'Acacia honey - imtenan 250 gm','','6221078767297','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,44.5500,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078767297,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:13.000000',1,0,0.00,NULL,NULL),
(30,'Wild Blossom Honey - gift box 1 kg','','6221078763831','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,151.8000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763831,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:14.000000',1,0,0.00,NULL,NULL),
(31,'pure honey - imtenan 450 gm','','6221078766139','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,69.8500,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078766139,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:16.000000',1,0,0.00,NULL,NULL),
(32,'Echinacea Honey (Infusion) 180 gm','','6221078763275','',1,1,NULL,0.0000,-8.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,44.5500,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763275,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:18.000000',1,0,0.00,NULL,NULL),
(33,'Comvita Manuka Honey UMF®5+','','9400501001109','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,93.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',9400501001109,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:19.000000',1,0,0.00,NULL,NULL),
(34,'Comvita Manuka Honey UMF®10+','','6400501003615','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,181.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6400501003615,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:21.000000',1,0,0.00,NULL,NULL),
(35,'zaafran honey 250 gm ','','8906008330151','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,137.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',8906008330151,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:22.000000',1,0,0.00,NULL,NULL),
(36,'Gold Honey 250 gm ','','8906008330199','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,467.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',8906008330199,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:23.000000',1,0,0.00,NULL,NULL),
(37,'Organic Hibiscus herbal tea - 16 filter bag','','33333333','',2,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',33333333,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:24.000000',1,0,0.00,NULL,NULL),
(38,'Organic Anise herbal tea - 16 filter bag','','6221078762575','',2,1,NULL,0.0000,-1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762575,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:26.000000',1,0,0.00,NULL,NULL),
(39,'Green Tea (Chun mee)  tea - 16 filter ','','6221078762599','',2,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,24.2000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762599,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:28.000000',1,0,0.00,NULL,NULL),
(40,'Green Tea (Gunpowder)  tea - 16 filter ','','6221078762889','',2,1,NULL,0.0000,-1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,24.2000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762889,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:29.000000',1,0,0.00,NULL,NULL),
(41,'Organic Peppermint herbal tea - 16 filter bag','','6221078762568','',2,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762568,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:30.000000',1,0,0.00,NULL,NULL),
(42,'Organic Cinnamon herbal tea - 16 filter bag','','6221078765286','',2,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19.8000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078765286,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:32.000000',1,0,0.00,NULL,NULL),
(43,'Ginseng Chai Tea  - 18 filter ','','4444444','',2,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,38.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',4444444,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:33.000000',1,0,0.00,NULL,NULL),
(44,' Parsley & Celery  Tea   - 18 filter ','','6221078762018','',2,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,24.2000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762018,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:35.000000',1,0,0.00,NULL,NULL),
(45,'Lavender and chamomile tea  - 18 filter ','','6221078762063','',2,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,24.2000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762063,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:36.000000',1,0,0.00,NULL,NULL),
(46,'Senna Tea   - 18 filter ','','6221078762100','',2,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,24.2000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762100,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:37.000000',1,0,0.00,NULL,NULL),
(47,'Chicory & Artichoke Tea  - 18 filter ','','6221078762155','',2,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,24.2000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762155,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:39.000000',1,0,0.00,NULL,NULL),
(48,'cinnamon and ginger tea  - 18 filter ','','6221078763770','',2,1,NULL,2.0000,1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,24.2000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763770,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:41.000000',1,0,0.00,NULL,NULL),
(49,'Dandelion tea 35 gm','','6221078762537','',2,1,NULL,0.0000,-1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,22.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762537,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:43.000000',1,0,0.00,NULL,NULL),
(50,'jasmine green tea pearl 50 gm ','','6221078767228','',2,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,66.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078767228,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:44.000000',1,0,0.00,NULL,NULL),
(51,'Organic Thyme 35 gm','','6221078762230','',3,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,11.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762230,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:46.000000',1,0,0.00,NULL,NULL),
(52,'Organic Marjoram 15 gm','','6221078762278','',3,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,11.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762278,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:49.000000',1,0,0.00,NULL,NULL),
(53,'Organic Flax Seed 100 gm','','6221078762209','',3,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,11.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762209,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:50.000000',1,0,0.00,NULL,NULL),
(54,'Organic Peppermint 25 gm glass','','6221078762261','',3,1,NULL,0.0000,-7.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,11.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762261,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:52.000000',1,0,0.00,NULL,NULL),
(55,'Organic Coriander Seeds','','6221078762346','',3,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,11.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762346,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:53.000000',1,0,0.00,NULL,NULL),
(56,'Organic Cumin 80 gm','','6221078762223','',3,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762223,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:55.000000',1,0,0.00,NULL,NULL),
(57,'Organic Black Seed 100 gm','','6221078762193','',3,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762193,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:49:58.000000',1,0,0.00,NULL,NULL),
(58,'Turmeric 100 gm','','6221078762773','',3,1,NULL,0.0000,-2.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762773,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:00.000000',1,0,0.00,NULL,NULL),
(59,'Onion Slices 75 gm','','6221078762322','',3,1,NULL,0.0000,-1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762322,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:02.000000',1,0,0.00,NULL,NULL),
(60,'Organic Ginger 70 gm','','6221078762247','',3,1,NULL,50.0000,50.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19.8000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762247,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:03.000000',1,0,0.00,NULL,NULL),
(61,'spices Kabsa 100 gm','','6221078766337','',3,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19.8000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078766337,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:05.000000',1,0,0.00,NULL,NULL),
(62,'Organic Garlic Powder 100 gm','','6221078762339','',3,1,NULL,0.0000,-1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19.8000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762339,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:06.000000',1,0,0.00,NULL,NULL),
(63,'Organic Cinnamon 85 gm','','6221078762254','',3,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19.8000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078762254,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:08.000000',1,0,0.00,NULL,NULL),
(64,'spices biryani 100 gm','','6221078766320','',3,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,22.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078766320,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:09.000000',1,0,0.00,NULL,NULL),
(65,'beef spices 80 gm','','6221078766351','',3,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,22.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078766351,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:11.000000',1,0,0.00,NULL,NULL),
(66,'fish spices 100 gm','','6221078766344','',3,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,22.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078766344,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:12.000000',1,0,0.00,NULL,NULL),
(67,'royal extra 180 gm','','6221078151164','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,72.6000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078151164,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:13.000000',1,0,0.00,NULL,NULL),
(68,'Bee immune 180 gm','','6221078301163','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,96.8000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078301163,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:15.000000',1,0,0.00,NULL,NULL),
(69,'wheat grass powder 70 gm','','6221078842116','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,49.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078842116,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:17.000000',1,0,0.00,NULL,NULL),
(70,'psyllium husk 75 gm','','6221078202125','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,25.0000,0.0000,32.0000,0.0000,33.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,25,'',NULL,'1',6221078202125,NULL,'2019-04-10 00:00:00.000000',NULL,NULL,1,1,1,'2020-07-17 22:50:19.000000',1,0,0.00,NULL,NULL),
(71,'psyllium husk 125 gm','','6221078202149','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,60.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078202149,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:21.000000',1,0,0.00,NULL,NULL),
(72,'spirulina 140 gm','','6221078722142','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,66.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078722142,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:22.000000',1,0,0.00,NULL,NULL),
(73,'Dates syrup 450 gm','','6221078766078','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,29.7000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078766078,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:24.000000',1,0,0.00,NULL,NULL),
(74,'Coconut Oil - Virgin organic 500ml','','6221078767112','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,64.9000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078767112,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:26.000000',1,0,0.00,NULL,NULL),
(75,'Eruca oil 25 ml','','6221078761943','',5,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,15.4000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078761943,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:27.000000',1,0,0.00,NULL,NULL),
(76,'Coconut Oil - Fractionated 50 ml','','6221078761875','',5,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,18.7000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078761875,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:28.000000',1,0,0.00,NULL,NULL),
(77,'sweet almond oil 50 ml','','6221078761882','',5,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,44.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078761882,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:30.000000',1,0,0.00,NULL,NULL),
(78,'wheat germ oil 50 ml','','6221078763428','',5,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,55.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763428,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:32.000000',1,0,0.00,NULL,NULL),
(79,'Jojoba oil 50 ml','','6221078761905','',5,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,44.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078761905,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:33.000000',1,0,0.00,NULL,NULL),
(80,'olive oil 50 ml','','6221078761868','',5,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,15.4000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078761868,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:35.000000',1,0,0.00,NULL,NULL),
(81,'Coconut Oil - Fractionated 250 ml','','6221078763435','',5,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,33.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763435,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:36.000000',1,0,0.00,NULL,NULL),
(82,'Propolis Soap 100 gm','','111111','',6,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,18.7000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',111111,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:38.000000',1,0,0.00,NULL,NULL),
(83,'Honey and Milk Soap 100 gm','','6221078763046','',6,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,18.7000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078763046,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:40.000000',1,0,0.00,NULL,NULL),
(84,'Dead Sea Soap 100 gm','','222222','',6,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,18.7000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',222222,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:41.000000',1,0,0.00,NULL,NULL),
(85,'protien bar coconut 70 gm','','6221078065126','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078065126,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:42.000000',1,0,0.00,NULL,NULL),
(86,'protien bar cinnamon 70 gm','','6221078605124','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078605124,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:44.000000',1,0,0.00,NULL,NULL),
(87,'protien bar peanuts 70 gm','','6221078185121','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078185121,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:45.000000',1,0,0.00,'',NULL),
(88,'protien bar cocoa 70 gm','','6221078107512','',4,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',6221078107512,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:47.000000',1,0,0.00,NULL,NULL),
(89,'weigh proteine 500mg','','123','',2,1,NULL,20.0000,20.0000,10.0000,50.0000,5.00,0.00,0.0000,0.0000,100.0000,100.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',123,NULL,'2019-04-18 00:00:00.000000',NULL,NULL,1,1,1,'2020-07-17 22:50:48.000000',1,0,0.00,NULL,NULL),
(90,'jhkhk','','','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,10.0000,4.5000,10.0000,20.0000,5.0000,125.0000,21.0000,45.0000,10.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',0,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:50.000000',1,0,0.00,NULL,NULL),
(91,'sample','','15488748','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',7789457985,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:52.000000',1,0,0.00,NULL,NULL),
(93,'Homey Cake','','1234567890','',1,1,NULL,12.0000,12.0000,0.0000,0.0000,5.00,0.00,25.0000,10.0000,10.0000,20.0000,50.0000,100.0000,30.0000,40.0000,50.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',1111111111111111,'2019-04-18','2019-09-05 00:00:00.000000',NULL,NULL,1,1,1,'2020-07-17 22:50:54.000000',1,0,0.00,NULL,NULL),
(95,'IPhone','','478947895','',1,1,NULL,2.0000,2.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,10.0000,20.0000,50.0000,100.0000,30.0000,40.0000,50.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',111000,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:57.000000',1,0,0.00,NULL,NULL),
(97,'Lux','','17852963852741','',1,1,NULL,12.0000,11.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,20.0000,30.0000,33.3300,66.6700,40.0000,50.0000,60.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',111001,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:58.000000',1,0,0.00,NULL,NULL),
(99,'Grapes','','814269','',1,1,NULL,0.0000,-3.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,10.0000,10.0000,50.0000,100.0000,15.0000,15.0000,50.0000,0.0000,1,0.0000,3,NULL,'','',NULL,NULL,'',NULL,'1',111003,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:50:59.000000',1,0,0.00,NULL,NULL),
(101,'Computer','','12345678','',1,1,NULL,2.0000,1.0000,10.0000,50.0000,5.00,0.00,0.0000,0.0000,0.0000,30000.0000,10.0000,20.0000,33000.0000,36000.0000,450000.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11004,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:01.000000',1,0,0.00,'EAN',NULL),
(103,'Samsumg A30','','7895484987987','',1,1,NULL,0.0000,-27.5000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,10.0000,10.0000,10.0000,20.0000,11.0000,11.0000,40.0000,0.0000,1,22.8571,1,NULL,'','',NULL,NULL,'',NULL,'1',11005,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:02.000000',1,0,0.00,NULL,NULL),
(105,'sammmmmmm','','457879','',1,1,NULL,0.0000,-18.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11008,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:04.000000',0,0,0.00,NULL,NULL),
(106,'mixed fruite jam','','617950410072','',1,1,NULL,0.0000,-50.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,7.5000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11009,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:05.000000',1,0,0.00,NULL,NULL),
(108,'Service 12','','548979','',1,1,NULL,0.0000,-1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,100.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11010,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:06.000000',1,1,0.00,'50',NULL),
(110,'Sample','','786446','',1,1,NULL,0.0000,-1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11011,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:08.000000',0,0,0.00,'',NULL),
(1108,'Item Test PurchaseCost','','44984979df','',2,1,NULL,50.0000,50.0000,0.0000,0.0000,5.00,0.00,10.0000,8.0000,50.0000,50.0000,0.0000,60.0000,0.0000,80.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11012,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:09.000000',1,0,0.00,'',NULL),
(1110,'MI A4','','55875','',2,1,NULL,0.0000,-10.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,10.0000,0.0000,100.0000,0.0000,20.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11013,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:10.000000',1,0,0.00,'',1),
(1111,'bread qwe','','12334567','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11014,NULL,NULL,NULL,NULL,1,0,1,'2020-07-17 22:51:12.000000',1,0,0.00,'',NULL),
(1112,'Arabic Bread Big','','ABB1112','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11015,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:13.000000',1,0,0.00,'',NULL),
(1113,'Test liva item','','Tli1113','',1,1,NULL,2.0000,102.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,100.0000,0.0000,150.0000,0.0000,250.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11028,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:14.000000',1,0,0.00,'',NULL),
(1114,'Stock Test','','ST1114','',1,1,NULL,50.0000,69.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,1,0.0000,5,NULL,'','',NULL,NULL,'',NULL,'1',11029,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:16.000000',1,0,0.00,'',NULL),
(1115,'Unit Test','','UT1115','',1,1,NULL,10.0000,20.1000,10.0000,100.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,25.0000,0.0000,0.0000,1,0.0000,5,NULL,'','',NULL,NULL,'',NULL,'1',11030,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:18.000000',1,0,0.00,'',NULL),
(1116,'KG Test','','KT1116','',1,1,NULL,25.5000,36.6370,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,50.0000,0.0000,0.0000,1,0.0000,3,NULL,'','',NULL,NULL,'',NULL,'1',11031,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:20.000000',1,0,0.00,'',NULL),
(1117,'min Stock Test','','mST1117','',1,1,NULL,25.0000,50.0000,10.0000,50.0000,5.00,0.00,0.0000,0.0000,0.0000,4.0000,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11032,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:22.000000',1,0,0.00,'',NULL),
(1118,'mash dal split 400gm','','6291108174012','',3,2,NULL,5.0000,3.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,3.6600,3.6600,0.0000,0.0000,5.0000,5.0000,5.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11033,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:24.000000',1,0,0.00,'',NULL),
(1119,'moong dal split 400gm','','2010000377086','',3,2,NULL,4.0000,3.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,5.0000,5.0000,5.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11034,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:25.000000',1,0,0.00,'',NULL),
(1120,'black chick peas400gm','','6291108170724','',3,2,NULL,5.0000,4.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.2500,4.2500,4.2500,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11035,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:27.000000',1,0,0.00,'',NULL),
(1121,'toot dal 400mg','','6291108176733','',3,2,NULL,6.0000,6.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.5000,4.5000,4.5000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11036,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:29.000000',1,0,0.00,'',NULL),
(1122,'moong 400mg','','6291108174494','',3,2,NULL,6.0000,6.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.0000,4.0000,4.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11037,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:30.000000',1,0,0.00,'',NULL),
(1123,'red kidney beans 400gm','','6291108175507','',3,2,NULL,7.0000,7.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,6.0000,6.0000,6.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11038,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:31.000000',1,0,0.00,'',NULL),
(1124,'rice flake white','','2010000376812','',3,2,NULL,4.0000,4.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,3.0000,3.0000,3.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11039,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:33.000000',1,0,0.00,'',NULL),
(1125,'moong whole 400mg','','6291108174616','',3,2,NULL,2.0000,2.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.5000,4.5000,4.5000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11040,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:34.000000',1,0,0.00,'',NULL),
(1126,'moong whole800gm ','','2010000377079','',3,2,NULL,3.0000,3.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,7.5000,7.5000,7.5000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11041,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:36.000000',1,0,0.00,'',NULL),
(1127,'masoor dal 400gm','','554726174301','',3,3,NULL,6.0000,6.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,2.5000,2.5000,2.5000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11042,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:38.000000',1,0,0.00,'',NULL),
(1128,'moong dal 800gm','','6291108174524','',3,2,NULL,7.0000,7.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,8.0000,8.0000,8.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11043,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:40.000000',1,0,0.00,'',NULL),
(1129,'masoor dal 800gm','','6291108174180','',3,2,NULL,7.0000,6.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,5.0000,5.0000,5.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11044,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:41.000000',1,0,0.00,'',NULL),
(1130,'chana dal','','554726174305','',3,3,NULL,6.0000,1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,3.0000,3.0000,3.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11045,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:42.000000',1,0,0.00,'',NULL),
(1131,'moong dal 400mg','','554726174321','',3,3,NULL,6.0000,6.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,3.5000,3.5000,3.5000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11046,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:44.000000',1,0,0.00,'',NULL),
(1132,'mattar dal','','6291108174302','',3,2,NULL,5.0000,5.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.0000,4.0000,4.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11047,NULL,NULL,NULL,NULL,1,1,1,'2020-07-17 22:51:45.000000',1,0,0.00,'',NULL),
(1133,'chana dal 400g','','6291108171707','',3,2,NULL,7.0000,7.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,3.5000,3.5000,3.5000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11048,NULL,NULL,'2020-07-17 22:51:47.000000',NULL,1,1,1,'2020-07-17 22:51:47.000000',1,0,0.00,'',NULL),
(1134,'green masoor 400gm','','554726174336','',3,3,NULL,6.0000,6.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.0000,4.0000,4.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11049,NULL,NULL,'2020-07-17 22:51:49.000000',NULL,1,1,1,'2020-07-17 22:51:49.000000',1,0,0.00,'',NULL),
(1135,'popcorn400gm','','554726174364','',3,3,NULL,6.0000,6.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,3.5000,3.5000,3.5000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11050,NULL,NULL,'2020-07-17 22:51:50.000000',NULL,1,1,1,'2020-07-17 22:51:50.000000',1,0,0.00,'',NULL),
(1136,'brown sugar ','','4800502128136','',10,4,NULL,5.0000,5.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,5.0000,5.0000,5.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11051,NULL,NULL,'2020-07-17 22:51:51.000000',NULL,1,1,1,'2020-07-17 22:51:51.000000',1,0,0.00,'',NULL),
(1137,'black eye beans ','','2010000376881','',3,2,NULL,2.0000,2.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.5000,4.5000,4.5000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11052,NULL,NULL,'2020-07-17 22:51:53.000000',NULL,1,1,1,'2020-07-17 22:51:53.000000',1,0,0.00,'',NULL),
(1138,'green peas 400gm','','1978145','',3,5,NULL,3.0000,3.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.0000,4.0000,4.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11053,NULL,NULL,'2020-07-17 22:51:56.000000',NULL,1,1,1,'2020-07-17 22:51:56.000000',1,0,0.00,'',NULL),
(1139,'soya wadi200gm','','554726174728','',3,3,NULL,10.0000,10.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,3.0000,3.0000,3.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11054,NULL,NULL,'2020-07-17 22:51:57.000000',NULL,1,1,1,'2020-07-17 22:51:57.000000',1,0,0.00,'',NULL),
(1140,'soya wadi 100gm','','554726174734','',3,3,NULL,10.0000,10.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1.5000,1.5000,1.5000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11055,NULL,NULL,'2020-07-17 22:51:58.000000',NULL,1,1,1,'2020-07-17 22:51:58.000000',1,0,0.00,'',NULL),
(1141,'white beans 400gm','','6291108177105','',3,2,NULL,1.0000,1.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,5.0000,5.0000,5.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11056,NULL,NULL,'2020-07-17 22:52:00.000000',NULL,1,1,1,'2020-07-17 22:52:00.000000',1,0,0.00,'',NULL),
(1142,'indian muthiran400gm','','554726174375','',3,3,NULL,6.0000,6.0000,0.0000,0.0000,5.00,0.00,10.0000,0.4000,0.0000,0.0000,0.0000,0.0000,4.0000,4.0000,4.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11057,NULL,NULL,'2020-07-17 22:52:01.000000',NULL,1,1,1,'2020-07-17 22:52:01.000000',1,0,0.00,'',NULL),
(1143,'semolina rava 500gm','','6291104191112','',3,6,NULL,9.0000,9.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.0000,4.0000,4.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11058,NULL,NULL,'2020-07-17 22:52:03.000000',NULL,1,1,1,'2020-07-17 22:52:03.000000',1,0,0.00,'',NULL),
(1145,'moong whole 500mg','','6291104191020','',3,6,NULL,6.0000,6.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,5.0000,5.0000,5.0000,0.0000,1,0.0000,7,NULL,'','',NULL,NULL,'',NULL,'1',11060,NULL,NULL,'2020-07-17 22:52:04.000000',NULL,1,1,1,'2020-07-17 22:52:04.000000',1,0,0.00,'',NULL),
(1146,'Test Focus','','TF1146','',1,1,NULL,100.0000,100.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,10.5000,10.5000,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11061,NULL,NULL,'2020-07-17 22:52:20.000000',NULL,1,1,1,'2020-07-17 22:52:20.000000',1,0,0.00,'',NULL),
(2146,'ppp','','p1147','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11062,NULL,NULL,'2020-07-17 22:52:21.000000',NULL,1,1,1,'2020-07-17 22:52:21.000000',1,0,0.00,'',NULL),
(2147,'vvvvvvv','','v2147','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11063,NULL,NULL,'2020-07-17 22:52:23.000000',NULL,1,1,1,'2020-07-17 22:52:23.000000',1,0,0.00,'',NULL),
(3146,'testing item 123','','ti12148','',3,2,NULL,0.0000,0.0000,10.0000,100.0000,5.00,0.00,0.0000,0.0000,100.0000,100.0000,0.0000,100.0000,0.0000,200.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11064,NULL,NULL,'2020-07-17 22:52:24.000000',NULL,1,1,1,'2020-07-17 22:52:24.000000',1,0,0.00,'',NULL),
(3147,'boxpc','','b3147','',1,1,NULL,100.0000,100.0000,50.0000,150.0000,5.00,0.00,0.0000,0.0000,10.0000,10.0000,0.0000,100.0000,0.0000,20.0000,0.0000,0.0000,1,0.0000,5,NULL,'','',NULL,NULL,'',NULL,'1',11065,NULL,NULL,'2020-07-17 22:52:26.000000',NULL,1,1,1,'2020-07-17 22:52:26.000000',1,0,0.00,'',NULL),
(3148,'test TaxIncluded','','1235468','',9,5,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,10.0000,10.0000,50.0000,50.0000,15.0000,15.0000,0.0000,0.0000,1,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11067,NULL,NULL,'2020-07-17 22:52:29.000000',NULL,1,1,1,'2020-07-17 22:52:29.000000',1,0,0.00,'',NULL),
(3149,'Discount Item','','DI3149','',1,1,NULL,10.0000,10.0000,0.0000,0.0000,5.00,0.00,10.0000,10.0000,80.0000,80.0000,0.0000,25.0000,0.0000,100.0000,0.0000,0.0000,0,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11068,NULL,NULL,'2020-07-17 22:52:32.000000',NULL,1,1,1,'2020-07-17 22:52:32.000000',1,0,0.00,'',NULL),
(3150,'Opening Stock','','OS3150','',1,1,NULL,50.0000,50.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11069,NULL,NULL,'2020-07-17 22:52:33.000000',NULL,1,1,1,'2020-07-17 22:52:33.000000',1,0,0.00,'',NULL),
(4150,'Task TEst','','TT3151','',1,1,NULL,100.0000,100.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,20.0000,20.0000,0.0000,50.0000,0.0000,30.0000,0.0000,0.0000,0,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11070,NULL,NULL,'2020-07-17 22:52:34.000000',NULL,1,1,1,'2020-07-17 22:52:34.000000',1,0,0.00,'',NULL),
(4151,'test2','','t4151','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,35.0000,35.0000,0.0000,28.5700,0.0000,45.0000,0.0000,0.0000,0,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11071,NULL,NULL,'2020-07-17 22:52:35.000000',NULL,1,1,1,'2020-07-17 22:52:35.000000',1,0,0.00,'',NULL),
(4152,'test3','','t4152','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,50.0000,50.0000,0.0000,20.0000,0.0000,60.0000,0.0000,0.0000,0,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11072,NULL,NULL,'2020-07-17 22:52:37.000000',NULL,1,1,1,'2020-07-17 22:52:37.000000',1,0,0.00,'',NULL),
(4153,'tt','','t4153','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11073,NULL,NULL,'2020-07-17 22:52:38.000000',NULL,1,1,1,'2020-07-17 22:52:38.000000',1,0,0.00,'',NULL),
(4154,'Fish','','F4154','',4,6,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11074,NULL,NULL,'2020-07-17 22:52:40.000000',NULL,1,1,1,'2020-07-17 22:52:40.000000',1,0,0.00,'',NULL),
(4155,'test Unit','','tU4155','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,60.0000,0.0000,0.0000,0,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11077,NULL,NULL,'2020-07-17 22:52:41.000000',NULL,1,1,1,'2020-07-17 22:52:41.000000',1,0,0.00,'',NULL),
(4157,'Cheees ','','C4156','',1,1,NULL,10.6000,10.6000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,16.0000,0.0000,0.0000,0,0.0000,5,NULL,'','',NULL,NULL,'',NULL,'1',11079,NULL,NULL,'2020-07-17 22:52:43.000000',NULL,1,1,1,'2020-07-17 22:52:43.000000',1,0,0.00,'',NULL),
(4158,'Mobile 1','','M14158','',1,1,NULL,20.0000,20.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,1000.0000,0.0000,0.0000,0.0000,1000.0000,0.0000,0.0000,0.0000,0,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11080,NULL,NULL,'2020-07-17 22:52:44.000000',NULL,1,1,1,'2020-07-17 22:52:44.000000',1,0,0.00,'',NULL),
(4159,'Touch Pad','','TP4159','',1,1,NULL,10.0000,10.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000,0,0.0000,1,NULL,'','',NULL,NULL,'',NULL,'1',11081,NULL,NULL,'2020-07-17 22:52:45.000000',NULL,1,1,1,'2020-07-17 22:52:45.000000',1,0,0.00,'',NULL),
(5158,'DDDDDDDDD','','D4160','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,60.0000,0.0000,0.0000,0,0.0000,3,NULL,'','',NULL,NULL,'',NULL,'1',11082,NULL,NULL,'2020-07-17 22:52:47.000000',NULL,1,1,1,'2020-07-17 22:52:47.000000',1,0,0.00,'',NULL),
(6158,'popo','','00010','',1,1,NULL,0.0000,0.0000,0.0000,0.0000,5.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,2.0000,0.0000,0.0000,0,0.0000,3,NULL,'','',NULL,NULL,'',NULL,'1',11083,NULL,NULL,'2020-07-17 22:52:48.000000',NULL,1,1,1,'2020-07-17 22:52:48.000000',1,0,0.00,'',NULL);

/*Table structure for table `production_planning` */

DROP TABLE IF EXISTS `production_planning`;

CREATE TABLE `production_planning` (
  `Rawmaterial_Planning_Id` int(11) NOT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Rawmaterial_Product_Id` int(11) DEFAULT NULL,
  `Quantity` decimal(18,4) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Conversion_Factor` decimal(18,4) DEFAULT NULL,
  `Purchase_Rate` decimal(18,4) DEFAULT NULL,
  `Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Rawmaterial_Planning_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `production_planning` */

/*Table structure for table `purchase_detail` */

DROP TABLE IF EXISTS `purchase_detail`;

CREATE TABLE `purchase_detail` (
  `Purchase_Detail_Id` int(11) NOT NULL,
  `Purchase_Master_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Quantity` decimal(18,3) DEFAULT NULL,
  `Extra` decimal(18,3) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Convertion_Factor` decimal(18,3) DEFAULT NULL,
  `Purchase_Rate` decimal(18,4) DEFAULT NULL,
  `Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `Retail_Rate` decimal(18,4) DEFAULT NULL,
  `Wholesale_Rate` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(18,2) DEFAULT NULL,
  `Disc_Percentage` decimal(18,2) DEFAULT NULL,
  `Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT NULL,
  `Net_Amount` decimal(18,4) DEFAULT NULL,
  `Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Amount` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Inclusive` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Exclusive` decimal(18,4) DEFAULT NULL,
  `Manufacturing_Date` date DEFAULT NULL,
  `Expire_Date` date DEFAULT NULL,
  `Batch_No` varchar(20) DEFAULT NULL,
  `SGST_Percentage` decimal(18,2) DEFAULT NULL,
  `CGST_Percentage` decimal(18,2) DEFAULT NULL,
  `IGST_Percentage` decimal(18,2) DEFAULT NULL,
  `Item_Supplier_Id` int(11) DEFAULT NULL,
  `Commission_Percentage` decimal(18,4) DEFAULT NULL,
  `Company_Id` int(11) NOT NULL,
  PRIMARY KEY (`Purchase_Detail_Id`,`Company_Id`),
  KEY `FK_Purchase_Detail_Product_Detail` (`Product_Detail_Id`),
  KEY `FK_Purchase_Detail_Product_Master` (`Product_Id`),
  KEY `FK_Purchase_Detail_Purchase_Maste` (`Purchase_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `purchase_detail` */

insert  into `purchase_detail`(`Purchase_Detail_Id`,`Purchase_Master_Id`,`Product_Id`,`Product_Detail_Id`,`Barcode`,`Quantity`,`Extra`,`Base_Unit_Id`,`Unit_Detail_Id`,`Is_Primary_Unit`,`Convertion_Factor`,`Purchase_Rate`,`Purchase_Cost`,`Retail_Rate`,`Wholesale_Rate`,`MRP`,`Tax_Percentage`,`Disc_Percentage`,`Gross_Amount`,`Discount`,`Net_Amount`,`Tax_Amount`,`Amount`,`Unit_Price_Inclusive`,`Unit_Price_Exclusive`,`Manufacturing_Date`,`Expire_Date`,`Batch_No`,`SGST_Percentage`,`CGST_Percentage`,`IGST_Percentage`,`Item_Supplier_Id`,`Commission_Percentage`,`Company_Id`) values 
(22,16,11,11,11,15.000,0.000,1,0,NULL,1.000,150.0000,150.0000,NULL,NULL,0.0000,5.00,NULL,2250.0000,0.0000,2250.0000,112.5000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(23,16,103,112,11005,5.000,0.000,1,0,NULL,1.000,10.0000,10.0000,NULL,NULL,40.0000,5.00,NULL,50.0000,0.0000,50.0000,2.5000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(24,17,15,15,15,1.000,0.000,1,0,NULL,1.000,100.0000,100.0000,NULL,NULL,0.0000,5.00,NULL,100.0000,0.0000,100.0000,5.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(25,18,105,119,11008,1.000,0.000,1,0,NULL,1.000,10.0000,10.0000,NULL,NULL,50.0000,5.00,NULL,10.0000,0.0000,10.0000,0.5000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(26,19,2,2,2,1.000,0.000,1,0,NULL,1.000,70.0000,70.0000,NULL,NULL,110.0000,5.00,NULL,70.0000,0.0000,70.0000,3.5000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(27,20,110,122,11011,1.000,0.000,1,0,NULL,1.000,10.0000,10.5000,NULL,NULL,0.0000,5.00,NULL,10.0000,0.0000,10.0000,0.5000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(1027,1020,1108,1121,11012,1.000,0.000,1,0,NULL,1.000,50.0000,52.5000,NULL,NULL,0.0000,5.00,NULL,50.0000,0.0000,50.0000,2.5000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(1028,1021,12,12,12,1.000,0.000,1,0,NULL,1.000,10.0000,10.5000,NULL,NULL,0.0000,0.00,NULL,10.0000,0.0000,10.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,NULL,NULL,1),
(2028,2021,99,110,11003,1.000,0.000,3,1,NULL,1.000,10.0000,0.0000,NULL,NULL,50.0000,5.00,NULL,10.0000,0.0000,10.0000,0.5000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(2029,2022,1,1,1,10.000,0.000,1,4,NULL,10.000,24.0000,25.2000,NULL,NULL,60.0000,5.00,NULL,240.0000,0.0000,240.0000,12.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(2030,2023,11,11,11,1.000,0.000,1,0,NULL,1.000,150.0000,157.5000,NULL,NULL,0.0000,0.00,NULL,150.0000,0.0000,150.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,NULL,NULL,1),
(3029,3022,9,9,9,10.000,0.000,1,0,NULL,1.000,20.0000,21.0000,NULL,NULL,0.0000,5.00,NULL,200.0000,0.0000,200.0000,10.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4029,3023,11,11,11011,1000.000,10.000,1,0,NULL,1.000,170.0000,178.5000,NULL,NULL,0.0000,5.00,NULL,170000.0000,0.0000,170000.0000,8500.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4030,3023,3,3,11003,10.000,0.000,1,0,NULL,1.000,70.0000,73.5000,NULL,NULL,0.0000,0.00,NULL,700.0000,0.0000,700.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,NULL,NULL,1),
(4031,3024,1114,2125,11029,10.000,0.000,0,NULL,NULL,1.000,10.0000,10.5000,NULL,NULL,0.0000,5.00,NULL,100.0000,0.0000,100.0000,5.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4032,3025,1115,2126,11030,2.000,0.000,5,1007,NULL,1.000,10.0000,10.5000,NULL,NULL,0.0000,5.00,NULL,20.0000,0.0000,20.0000,1.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4033,3025,1115,2126,11030,5.000,0.000,5,1008,NULL,10.000,2.5000,2.6250,NULL,NULL,0.0000,5.00,NULL,12.5000,0.0000,12.5000,0.6250,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4034,3026,1116,2127,11031,20.000,0.000,3,1009,NULL,1.000,250.0000,262.5000,NULL,NULL,0.0000,5.00,NULL,5000.0000,0.0000,5000.0000,250.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4035,3026,1116,2127,11031,250.000,0.000,3,1010,NULL,1000.000,0.2500,0.2625,NULL,NULL,0.0000,5.00,NULL,62.5000,0.0000,62.5000,3.1250,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4036,3027,1117,2128,11032,25.000,0.000,1,0,NULL,1.000,0.0000,0.0000,NULL,NULL,0.0000,5.00,NULL,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4037,3028,1117,2128,11032,17.000,0.000,1,0,NULL,1.000,0.0000,0.0000,NULL,NULL,0.0000,5.00,NULL,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4041,3028,1117,2128,11032,1.000,0.000,1,0,NULL,1.000,0.0000,0.0000,NULL,NULL,0.0000,5.00,NULL,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4042,3029,1135,2146,11050,1.000,0.000,0,0,NULL,1.000,10.0000,10.5000,25.0000,25.0000,25.0000,5.00,NULL,10.0000,0.0000,10.0000,0.5000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4043,3030,1136,2147,11051,2.000,0.000,7,0,NULL,1.000,10.0000,10.5000,15.0000,15.0000,15.0000,5.00,NULL,20.0000,0.0000,20.0000,1.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4044,3031,1135,2146,11050,1.000,0.000,7,0,NULL,1.000,10.0000,10.5000,10.5000,25.0000,25.0000,5.00,NULL,10.0000,0.0000,10.0000,0.5000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4046,3033,2,2,11002,10.000,0.000,1,0,NULL,1.000,30.0000,40.0000,60.0000,50.0000,0.0000,5.00,NULL,300.0000,0.0000,300.0000,15.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4047,3033,2,2,11002,2.000,0.000,1,0,NULL,1.000,30.0000,40.0000,60.0000,50.0000,0.0000,5.00,NULL,60.0000,0.0000,60.0000,3.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4048,3034,103,4160,11066,10.000,0.000,1,0,NULL,1.000,0.0000,0.0000,0.0000,0.0000,0.0000,5.00,NULL,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4049,3035,103,4160,11066,1.000,0.000,1,0,NULL,1.000,0.0000,0.0000,0.0000,0.0000,0.0000,5.00,NULL,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4050,3036,103,4160,11066,10.000,0.000,1,0,NULL,1.000,10.0000,10.5000,10.5000,0.0000,0.0000,5.00,NULL,100.0000,0.0000,100.0000,5.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4052,3037,103,4160,11066,10.000,0.000,1,0,NULL,1.000,10.0000,10.5000,10.5000,0.0000,0.0000,5.00,NULL,100.0000,0.0000,100.0000,5.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4053,3038,1135,2146,11050,1.000,0.000,7,0,NULL,1.000,9.5238,10.5000,10.5000,25.0000,25.0000,5.00,NULL,9.5238,0.0000,9.5238,0.4762,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(4054,3039,4158,5175,11080,1.000,0.000,1,0,NULL,1.000,1000.0000,1050.0000,1500.0000,0.0000,0.0000,5.00,NULL,1000.0000,0.0000,1000.0000,50.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1),
(5054,4039,5158,6175,11082,1.000,0.000,3,0,NULL,1.000,0.0000,0.0000,60.0000,0.0000,0.0000,5.00,NULL,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,2.50,2.50,2.50,NULL,NULL,1);

/*Table structure for table `purchase_image` */

DROP TABLE IF EXISTS `purchase_image`;

CREATE TABLE `purchase_image` (
  `Purchase_Image_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Purchase_Master_Id` int(11) DEFAULT NULL,
  `Image64` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Purchase_Image_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `purchase_image` */

/*Table structure for table `purchase_master` */

DROP TABLE IF EXISTS `purchase_master`;

CREATE TABLE `purchase_master` (
  `Purchase_Master_Id` int(11) NOT NULL,
  `Purchase_Type` int(11) DEFAULT NULL,
  `Voucher_No` int(11) DEFAULT NULL,
  `Voucher_Date` date DEFAULT NULL,
  `Voucher_Time` time(6) DEFAULT NULL,
  `Invoice_No` varchar(50) DEFAULT NULL,
  `Invoice_Date` date DEFAULT NULL,
  `Supplier_Id` int(11) DEFAULT NULL,
  `Supplier_Name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Is_Cash` int(11) DEFAULT NULL,
  `Bank_Id` int(11) DEFAULT NULL,
  `Store_Id` int(11) DEFAULT NULL,
  `Branch_Id` int(11) DEFAULT NULL,
  `Godown_Id` int(11) DEFAULT NULL,
  `Counter_Id` int(11) DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `Delivery_No` varchar(50) DEFAULT NULL,
  `Delivery_Date` date DEFAULT NULL,
  `Total_Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Net_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Amount` decimal(18,4) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Freight_Charge` decimal(18,4) DEFAULT NULL,
  `Additional_Expence` bigint(20) DEFAULT NULL,
  `Round_Off` decimal(18,4) DEFAULT NULL,
  `Grand_Total` decimal(18,4) DEFAULT NULL,
  `Remarks` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) NOT NULL,
  `Is_Saved` tinyint(1) DEFAULT NULL,
  `Is_Cancelled` tinyint(1) DEFAULT NULL,
  `Purchase_Order_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Purchase_Master_Id`,`Company_Id`),
  UNIQUE KEY `IX_Purchase_Master` (`Voucher_No`,`Store_Id`),
  KEY `FK_Purchase_Master_Supplier` (`Supplier_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `purchase_master` */

insert  into `purchase_master`(`Purchase_Master_Id`,`Purchase_Type`,`Voucher_No`,`Voucher_Date`,`Voucher_Time`,`Invoice_No`,`Invoice_Date`,`Supplier_Id`,`Supplier_Name`,`Phone`,`Is_Cash`,`Bank_Id`,`Store_Id`,`Branch_Id`,`Godown_Id`,`Counter_Id`,`Salesman_Id`,`User_Id`,`Delivery_No`,`Delivery_Date`,`Total_Gross_Amount`,`Total_Discount_Amount`,`Total_Net_Amount`,`Total_Tax_Amount`,`Total_Amount`,`Paid_Amount`,`Discount_Amount`,`Freight_Charge`,`Additional_Expence`,`Round_Off`,`Grand_Total`,`Remarks`,`Company_Id`,`Is_Saved`,`Is_Cancelled`,`Purchase_Order_Id`,`Modified_By`,`Modified_Date`) values 
(17,1,2,'2019-07-06',NULL,'','2019-07-06',1,'Supplier1',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-07-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:11.000000'),
(18,1,3,'2019-07-06',NULL,'','2019-07-06',6,'Test Supplier',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-07-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:24.000000'),
(19,1,4,'2019-07-14',NULL,'','2019-07-14',7,'Salman',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-07-14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:26.000000'),
(20,1,5,'2019-08-05',NULL,'','2019-08-05',1,'Supplier1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-08-05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',2,0,0,NULL,1,'2020-07-16 18:32:28.000000'),
(1020,1,6,'2019-08-13',NULL,'','2019-08-13',2,'dddddddd',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-08-13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:29.000000'),
(1021,1,7,'2019-08-14',NULL,'','2019-08-14',1,'Supplier1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-08-14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:30.000000'),
(2021,1,8,'2019-08-18',NULL,'','2019-08-18',7,'Salman',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-08-18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:31.000000'),
(2022,1,9,'2019-09-23',NULL,'','2019-09-23',7,'Salman',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-09-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:32.000000'),
(2023,1,10,'2019-09-23',NULL,'','2019-09-23',2,'dddddddd',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-09-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:33.000000'),
(3022,1,11,'2019-11-16',NULL,'','2019-11-16',7,'Salman',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-11-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:34.000000'),
(3023,1,12,'2019-12-04',NULL,'','2019-12-04',8,'JALEEL TRADING',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-12-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:35.000000'),
(3024,1,13,'2019-12-07',NULL,'','2019-12-07',4,'fggggggggggg',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-12-07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:36.000000'),
(3025,1,14,'2019-12-08',NULL,'','2019-12-08',2,'dddddddd',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-12-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:37.000000'),
(3026,1,15,'2019-12-08',NULL,'','2019-12-08',3,'nou',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-12-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:38.000000'),
(3027,1,16,'2019-12-16',NULL,'','2019-12-16',1,'Supplier1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-12-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:39.000000'),
(3028,1,17,'2019-12-16',NULL,'','2019-12-16',1,'Supplier1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-12-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:40.000000'),
(3029,1,18,'2020-01-04',NULL,'','2020-01-04',1,'Supplier1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2020-01-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:41.000000'),
(3030,1,19,'2020-01-04',NULL,'','2020-01-04',1,'Supplier1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2020-01-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:42.000000'),
(3031,1,20,'2020-01-04',NULL,'','2020-01-04',2,'dddddddd',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2020-01-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:43.000000'),
(3033,1,21,'2020-01-07',NULL,'','2020-01-07',1,'Supplier1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2020-01-07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:45.000000'),
(3034,1,22,'2020-01-07',NULL,'','2020-01-07',1,'Supplier1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2020-01-07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:46.000000'),
(3035,1,23,'2020-01-07',NULL,'','2020-01-07',1,'Supplier1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2020-01-07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:47.000000'),
(3036,1,24,'2020-01-07',NULL,'','2020-01-07',1,'Supplier1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2020-01-07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:48.000000'),
(3037,1,25,'2020-01-08',NULL,'','2020-01-08',8,'JALEEL TRADING',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2020-01-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:49.000000'),
(3038,1,26,'2020-04-01',NULL,'','2020-04-01',1,'Supplier1',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2020-04-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:51.000000'),
(3039,1,27,'2020-05-02',NULL,'','2020-05-02',6,'Test Supplier',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2020-05-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:52.000000'),
(4039,1,28,'2020-06-12',NULL,'','2020-06-12',2,'dddddddd',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2020-06-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:32:53.000000'),
(16,1,1,'2019-06-23',NULL,'','2019-06-23',4,'fggggggggggg',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2019-06-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,0,NULL,1,'2020-07-16 18:41:19.000000');

/*Table structure for table `purchaseorder_detail` */

DROP TABLE IF EXISTS `purchaseorder_detail`;

CREATE TABLE `purchaseorder_detail` (
  `PurchaseOrder_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `PurchaseOrder_Master_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Quantity` decimal(18,3) DEFAULT NULL,
  `Extra` decimal(18,3) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Convertion_Factor` decimal(18,3) DEFAULT NULL,
  `Purchase_Rate` decimal(18,4) DEFAULT NULL,
  `Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `Retail_Rate` decimal(18,4) DEFAULT NULL,
  `Wholesale_Rate` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(18,2) DEFAULT NULL,
  `Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT NULL,
  `Net_Amount` decimal(18,4) DEFAULT NULL,
  `Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Amount` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Inclusive` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Exclusive` decimal(18,4) DEFAULT NULL,
  `Manufacturing_Date` date DEFAULT NULL,
  `Expire_Date` date DEFAULT NULL,
  `Batch_No` varchar(20) DEFAULT NULL,
  `Is_Posted` tinyint(1) DEFAULT NULL,
  `SGST_Percentage` decimal(18,2) DEFAULT NULL,
  `CGST_Percentage` decimal(18,2) DEFAULT NULL,
  `IGST_Percentage` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`PurchaseOrder_Detail_Id`),
  KEY `FK_PurchaseOrder_Detail_Product_Detail` (`Product_Detail_Id`),
  KEY `FK_PurchaseOrder_Detail_Product_Master` (`Product_Id`),
  KEY `FK_PurchaseOrder_Detail_PurchaseOrder_Master` (`PurchaseOrder_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `purchaseorder_detail` */

/*Table structure for table `purchaseorder_master` */

DROP TABLE IF EXISTS `purchaseorder_master`;

CREATE TABLE `purchaseorder_master` (
  `PurchaseOrder_Master_Id` int(11) NOT NULL AUTO_INCREMENT,
  `PurchaseOrder_Type` int(11) DEFAULT NULL,
  `Voucher_No` int(11) DEFAULT NULL,
  `Voucher_Date` date DEFAULT NULL,
  `Voucher_Time` time(6) DEFAULT NULL,
  `Invoice_No` varchar(50) DEFAULT NULL,
  `Invoice_Date` date DEFAULT NULL,
  `Supplier_Id` int(11) DEFAULT NULL,
  `Supplier_Name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Is_Cash` int(11) DEFAULT NULL,
  `Branch_Id` int(11) DEFAULT NULL,
  `Godown_Id` int(11) DEFAULT NULL,
  `Counter_Id` int(11) DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `Delivery_No` varchar(50) DEFAULT NULL,
  `Delivery_Date` date DEFAULT NULL,
  `Total_Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Net_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Amount` decimal(18,4) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Freight_Charge` decimal(18,4) DEFAULT NULL,
  `Additional_Expence` bigint(20) DEFAULT NULL,
  `Round_Off` decimal(18,4) DEFAULT NULL,
  `Grand_Total` decimal(18,4) DEFAULT NULL,
  `Remarks` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Is_Saved` tinyint(1) DEFAULT NULL,
  `Is_Cancelled` tinyint(1) DEFAULT NULL,
  `Is_Post` tinyint(1) DEFAULT NULL,
  `Purchase_Master_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`PurchaseOrder_Master_Id`),
  KEY `FK_PurchaseOrder_Master_Supplier` (`Supplier_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `purchaseorder_master` */

/*Table structure for table `purchasereturn_detail` */

DROP TABLE IF EXISTS `purchasereturn_detail`;

CREATE TABLE `purchasereturn_detail` (
  `PurchaseReturn_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `PurchaseReturn_Master_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Quantity` decimal(18,3) DEFAULT NULL,
  `Extra` decimal(18,3) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Convertion_Factor` decimal(18,3) DEFAULT NULL,
  `Purchase_Rate` decimal(18,4) DEFAULT NULL,
  `Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `Retail_Rate` decimal(18,4) DEFAULT NULL,
  `Wholesale_Rate` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(18,2) DEFAULT NULL,
  `Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT NULL,
  `Net_Amount` decimal(18,4) DEFAULT NULL,
  `Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Amount` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Inclusive` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Exclusive` decimal(18,4) DEFAULT NULL,
  `Manufacturing_Date` date DEFAULT NULL,
  `Expire_Date` date DEFAULT NULL,
  `Batch_No` varchar(20) DEFAULT NULL,
  `SGST_Percentage` decimal(18,2) DEFAULT NULL,
  `CGST_Percentage` decimal(18,2) DEFAULT NULL,
  `IGST_Percentage` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`PurchaseReturn_Detail_Id`),
  KEY `FK_PurchaseReturn_Detail_Product_Detail` (`Product_Detail_Id`),
  KEY `FK_PurchaseReturn_Detail_Product_Master` (`Product_Id`),
  KEY `FK_PurchaseReturn_Detail_PurchaseReturn_Detail` (`PurchaseReturn_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `purchasereturn_detail` */

/*Table structure for table `purchasereturn_master` */

DROP TABLE IF EXISTS `purchasereturn_master`;

CREATE TABLE `purchasereturn_master` (
  `PurchaseReturn_Master_Id` int(11) NOT NULL AUTO_INCREMENT,
  `PurchaseReturn_Type` int(11) DEFAULT NULL,
  `Voucher_No` int(11) DEFAULT NULL,
  `Voucher_Date` date DEFAULT NULL,
  `Voucher_Time` time(6) DEFAULT NULL,
  `Invoice_No` varchar(50) DEFAULT NULL,
  `Invoice_Date` date DEFAULT NULL,
  `Supplier_Id` int(11) DEFAULT NULL,
  `Supplier_Name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Is_Cash` int(11) DEFAULT NULL,
  `Bank_Id` int(11) DEFAULT NULL,
  `Branch_Id` int(11) DEFAULT NULL,
  `Godown_Id` int(11) DEFAULT NULL,
  `Counter_Id` int(11) DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `Delivery_No` varchar(50) DEFAULT NULL,
  `Delivery_Date` date DEFAULT NULL,
  `Total_Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Net_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Amount` decimal(18,4) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Freight_Charge` decimal(18,4) DEFAULT NULL,
  `Additional_Expence` bigint(20) DEFAULT NULL,
  `Round_Off` decimal(18,4) DEFAULT NULL,
  `Grand_Total` decimal(18,4) DEFAULT NULL,
  `Remarks` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Is_Saved` tinyint(1) DEFAULT NULL,
  `Is_Cancelled` tinyint(1) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`PurchaseReturn_Master_Id`),
  KEY `FK_PurchaseReturn_Master_Supplier` (`Supplier_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `purchasereturn_master` */

/*Table structure for table `quotation_detail` */

DROP TABLE IF EXISTS `quotation_detail`;

CREATE TABLE `quotation_detail` (
  `Quotation_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Quotation_Master_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Quantity` decimal(18,3) DEFAULT NULL,
  `Extra` decimal(18,3) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Convertion_Factor` decimal(18,3) DEFAULT NULL,
  `Quotation_Rate` decimal(18,4) DEFAULT NULL,
  `Purchase_Rate` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(18,2) DEFAULT NULL,
  `Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT NULL,
  `Net_Amount` decimal(18,4) DEFAULT NULL,
  `Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Amount` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Inclusive` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Exclusive` decimal(18,4) DEFAULT NULL,
  `SGST_Percentage` decimal(18,2) DEFAULT NULL,
  `CGST_Percentage` decimal(18,2) DEFAULT NULL,
  `IGST_Percentage` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`Quotation_Detail_Id`),
  KEY `FK_Quotation_Detail_Product_Detail` (`Product_Detail_Id`),
  KEY `FK_Quotation_Detail_Product_Master` (`Product_Id`),
  KEY `FK_Quotation_Detail_Quotation_Master` (`Quotation_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `quotation_detail` */

/*Table structure for table `quotation_master` */

DROP TABLE IF EXISTS `quotation_master`;

CREATE TABLE `quotation_master` (
  `Quotation_Master_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Quotation_Type` int(11) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Invoice_Date` date DEFAULT NULL,
  `Invoice_Time` time(6) DEFAULT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  `Customer_Name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Is_Cash` int(11) DEFAULT NULL,
  `Branch_Id` int(11) DEFAULT NULL,
  `Counter_Id` int(11) DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `Delivery_No` varchar(50) DEFAULT NULL,
  `Delivery_Date` date DEFAULT NULL,
  `Total_Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Net_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Amount` decimal(18,4) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Freight_Charge` decimal(18,4) DEFAULT NULL,
  `Additional_Expence` decimal(18,4) DEFAULT NULL,
  `Round_Off` decimal(18,4) DEFAULT NULL,
  `Grand_Total` decimal(18,4) DEFAULT NULL,
  `Remarks` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Is_Saved` tinyint(1) DEFAULT NULL,
  `Is_Cancelled` tinyint(1) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Quotation_Master_Id`),
  KEY `FK_Quotation_Master_Customer` (`Customer_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `quotation_master` */

/*Table structure for table `rawmaterial_item_master` */

DROP TABLE IF EXISTS `rawmaterial_item_master`;

CREATE TABLE `rawmaterial_item_master` (
  `Item_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Item_Code` varchar(50) DEFAULT NULL,
  `Item_Name` varchar(100) NOT NULL,
  `Stock` decimal(18,2) DEFAULT NULL,
  `Category_ID` int(11) DEFAULT NULL,
  `Tax_Id` int(11) DEFAULT NULL,
  `Rate` decimal(18,2) DEFAULT NULL,
  `Parcel` decimal(18,2) DEFAULT NULL,
  `Delivery` decimal(18,2) DEFAULT NULL,
  `Image` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  `Regional_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Item_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `rawmaterial_item_master` */

/*Table structure for table `rawmaterialproduct_master` */

DROP TABLE IF EXISTS `rawmaterialproduct_master`;

CREATE TABLE `rawmaterialproduct_master` (
  `RawMaterialProduct_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RawMaterialProduct_name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Short_Name` varchar(250) DEFAULT NULL,
  `RawMaterialProduct_Code` varchar(250) DEFAULT NULL,
  `Part_No` varchar(20) DEFAULT NULL,
  `Category_ID` int(11) DEFAULT NULL,
  `Brand_ID` int(11) DEFAULT NULL,
  `Opening_Stock` decimal(18,4) DEFAULT NULL,
  `Current_Stock` decimal(18,4) DEFAULT 0.0000,
  `Minimum_Stock` decimal(18,4) DEFAULT NULL,
  `Maximum_Stock` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Cess_Percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `Purchase_Rate` decimal(18,4) NOT NULL,
  `Purchase_Cost` decimal(18,4) NOT NULL,
  `WholeSalePercentage` decimal(5,2) NOT NULL,
  `RetailPercentage` decimal(5,2) DEFAULT NULL,
  `Wholesale_Rate` decimal(18,4) DEFAULT NULL,
  `Retail_Rate` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Quotation_Rate` decimal(18,4) DEFAULT NULL,
  `TaxInclusive` tinyint(1) DEFAULT NULL,
  `Tax_Inclusive_Rate` decimal(18,4) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Pack_Mode` varchar(10) DEFAULT NULL,
  `Image64` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `HSN_CODE` varchar(100) DEFAULT NULL,
  `Remarks` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `PLU_Number` int(11) DEFAULT NULL,
  `Regional_Name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Compensation_Cess` decimal(18,4) DEFAULT NULL,
  `Rack_Id` varchar(25) DEFAULT NULL,
  `Barcode` bigint(20) NOT NULL,
  `Expiry_Date` datetime(6) DEFAULT NULL,
  `Created_Date` datetime(6) DEFAULT NULL,
  `Color_ID` int(11) DEFAULT NULL,
  `Size_ID` int(11) DEFAULT NULL,
  `Model_Id` int(11) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Is_Active` tinyint(1) NOT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`RawMaterialProduct_ID`),
  UNIQUE KEY `IX_RowMeterialProduct_Master_Unique_RowMeterialProduct_name` (`RawMaterialProduct_name`),
  KEY `FK_RowMeterialProduct_Master_Item_Brand` (`Brand_ID`),
  KEY `FK_RowMeterialProduct_Master_Item_Category` (`Category_ID`),
  KEY `FK_RowMeterialProduct_Master_RowMeterialProduct_Unit` (`Base_Unit_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `rawmaterialproduct_master` */

/*Table structure for table `referral` */

DROP TABLE IF EXISTS `referral`;

CREATE TABLE `referral` (
  `Referral_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Referral_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Referral_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `referral` */

/*Table structure for table `sales_detail` */

DROP TABLE IF EXISTS `sales_detail`;

CREATE TABLE `sales_detail` (
  `Sales_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sales_Master_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Quantity` decimal(18,4) DEFAULT NULL,
  `Extra` decimal(18,4) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Convertion_Factor` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(18,4) DEFAULT NULL,
  `TaxInclusive` tinyint(1) DEFAULT NULL,
  `Disc_Percentage` decimal(18,2) DEFAULT NULL,
  `Sales_Rate` decimal(18,4) DEFAULT NULL,
  `Sales_Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Rate_Type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT NULL,
  `Net_Amount` decimal(18,4) DEFAULT NULL,
  `Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Amount` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Inclusive` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Exclusive` decimal(18,4) DEFAULT NULL,
  `SGST_Percentage` decimal(18,4) DEFAULT NULL,
  `CGST_Percentage` decimal(18,4) DEFAULT NULL,
  `IGST_Percentage` decimal(18,4) DEFAULT NULL,
  `Package_Id` int(11) DEFAULT NULL,
  `Supplier_Id` int(11) DEFAULT NULL,
  `Commission_Percentage` decimal(18,4) DEFAULT NULL,
  `Service_Percentage` decimal(18,2) DEFAULT NULL,
  `Company_Id` int(11) NOT NULL,
  PRIMARY KEY (`Sales_Detail_Id`,`Company_Id`),
  KEY `FK_Sales_Detail_Product_Detail` (`Product_Detail_Id`),
  KEY `FK_Sales_Detail_Product_Master` (`Product_Id`),
  KEY `FK_Sales_Detail_Sales_Master` (`Sales_Master_Id`),
  KEY `FK_Sales_Detail_Unit` (`Base_Unit_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=21393 DEFAULT CHARSET=latin1;

/*Data for the table `sales_detail` */

insert  into `sales_detail`(`Sales_Detail_Id`,`Sales_Master_Id`,`Product_Id`,`Product_Detail_Id`,`Barcode`,`Quantity`,`Extra`,`Base_Unit_Id`,`Unit_Detail_Id`,`Is_Primary_Unit`,`Convertion_Factor`,`Tax_Percentage`,`TaxInclusive`,`Disc_Percentage`,`Sales_Rate`,`Sales_Purchase_Cost`,`MRP`,`Rate_Type`,`Gross_Amount`,`Discount`,`Net_Amount`,`Tax_Amount`,`Amount`,`Unit_Price_Inclusive`,`Unit_Price_Exclusive`,`SGST_Percentage`,`CGST_Percentage`,`IGST_Percentage`,`Package_Id`,`Supplier_Id`,`Commission_Percentage`,`Service_Percentage`,`Company_Id`) values 
(1142,1097,11,11,11,12.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,599.5000,NULL,0.0000,'Retail',7194.0000,0.0000,7194.0000,359.7000,7553.7000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1148,1100,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1149,1101,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1150,1102,103,112,11005,2.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,19.0476,NULL,40.0000,'Retail',38.0952,0.0000,38.0952,1.9048,40.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1151,1103,13,13,13,2.5000,0.0000,1,0,1,1.0000,5.0000,0,0.00,114.4000,NULL,0.0000,'Retail',286.0000,0.0000,286.0000,14.3000,300.3000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1152,1103,105,119,11008,8.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,40.0000,NULL,50.0000,'Retail',320.0000,0.0000,320.0000,16.0000,336.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1153,1103,105,119,11008,10.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,40.0000,NULL,50.0000,'Retail',400.0000,0.0000,400.0000,20.0000,420.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1154,1103,103,112,11005,1.0000,0.0000,1,0,1,1.0000,10.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1155,1104,103,112,11005,2.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',20.9524,0.0000,20.9524,1.0476,22.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1156,1105,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1158,1108,10,10,10,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,935.0000,NULL,0.0000,'Retail',935.0000,0.0000,935.0000,46.7500,981.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1159,1109,103,112,11005,10.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',104.7620,0.0000,104.7620,5.2381,110.0001,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1160,1110,103,112,11005,8.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,8.5714,NULL,40.0000,'Retail',68.5712,0.0000,68.5712,3.4286,71.9998,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1162,1110,105,119,11008,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,40.0000,NULL,50.0000,'Retail',40.0000,0.0000,40.0000,2.0000,42.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1163,1111,13,13,13,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,114.4000,NULL,0.0000,'Retail',114.4000,0.0000,114.4000,5.7200,120.1200,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1164,1112,103,112,11005,2.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',20.9524,0.0000,20.9524,1.0476,22.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1165,1113,2,2,2,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,100.0000,NULL,110.0000,'Retail',100.0000,0.0000,100.0000,5.0000,105.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1166,1114,106,120,11009,50.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,50.0000,NULL,0.0000,'Retail',2500.0000,0.0000,2500.0000,125.0000,2625.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1167,1115,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,0,0.00,15.0000,NULL,50.0000,'Retail',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1168,1118,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,0,0.00,15.0000,NULL,50.0000,'Retail',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1169,1119,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,0,0.00,15.0000,NULL,50.0000,'Retail',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1171,1121,108,121,11010,1.0000,0.0000,1,0,1,1.0000,0.0000,0,0.00,100.0000,NULL,0.0000,'Retail',100.0000,0.0000,100.0000,0.0000,100.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1173,1123,1,1,1,1.0000,0.0000,1,0,1,1.0000,0.0000,1,0.00,375.0000,NULL,60.0000,'Retail',375.0000,0.0000,375.0000,0.0000,375.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(1174,1124,110,122,11011,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,20.0000,NULL,0.0000,'Retail',20.0000,0.0000,20.0000,1.0000,21.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(2170,2120,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(2171,2121,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(2172,2122,110,122,11011,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,10.0000,NULL,0.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(2176,2125,1108,1121,11012,1.0000,0.0000,1,0,1,1.0000,5.0000,0,10.00,80.0000,NULL,0.0000,'Retail',80.0000,8.0000,72.0000,3.6000,75.6000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(2178,2129,13,13,13,1.0000,0.0000,1,0,1,1.0000,0.0000,0,0.00,114.4000,NULL,0.0000,'Retail',114.4000,0.0000,114.4000,0.0000,114.4000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(2179,2130,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,0,0.00,15.0000,NULL,50.0000,'Retail',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(3176,3125,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,0,0.00,15.0000,NULL,50.0000,'Retail',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(3177,3126,101,111,11004,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,30.0000,NULL,40.0000,'Retail',30.0000,0.0000,30.0000,1.5000,31.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(4176,4125,11,11,11,1.0000,0.0000,1,0,1,1.0000,0.0000,0,0.00,1500.0000,NULL,0.0000,'Retail',1500.0000,0.0000,1500.0000,0.0000,1500.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(4177,4126,1,118,11007,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,28.5714,NULL,0.0000,'Retail',28.5714,0.0000,28.5714,1.4286,30.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(4178,4127,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,0,0.00,50.0000,NULL,50.0000,'Retail',50.0000,0.0000,50.0000,2.5000,52.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(5177,5126,1110,1122,11013,10.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,20.0000,NULL,0.0000,'Retail',200.0000,0.0000,200.0000,10.0000,210.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(5178,5127,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,0,0.00,15.0000,NULL,50.0000,'Retail',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(5179,5128,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,0,0.00,15.0000,NULL,50.0000,'Retail',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(5180,5128,103,112,11005,8.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',83.8096,0.0000,83.8096,4.1905,88.0001,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(6178,6127,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,0,0.00,5.0000,NULL,50.0000,'Retail',5.0000,0.0000,5.0000,0.2500,5.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(6179,6127,103,112,11005,1.5000,0.0000,1,0,1,1.0000,5.0000,1,0.00,8.5714,NULL,40.0000,'Retail',12.8571,0.0000,12.8571,0.6429,13.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(7178,7127,49,49,49,1.0000,0.0000,1,0,1,1.0000,0.0000,0,0.00,22.0000,NULL,0.0000,'Retail',22.0000,0.0000,22.0000,0.0000,22.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(7179,7127,103,112,11005,5.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',52.3810,0.0000,52.3810,2.6190,55.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(7180,7128,2,2,2,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,70.0000,NULL,110.0000,'Retail',70.0000,0.0000,70.0000,3.5000,73.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(8180,8127,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,0,0.00,15.0000,NULL,50.0000,'Retail',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(8181,8128,1,1,1,1.0000,0.0000,1,3,1,1.0000,5.0000,1,0.00,228.5714,NULL,60.0000,'Retail',228.5714,0.0000,228.5714,11.4286,240.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(9180,9127,1,1,1,5.0000,0.0000,1,3,1,1.0000,5.0000,1,0.00,23.8095,NULL,60.0000,'Retail',119.0475,0.0000,119.0475,5.9524,124.9999,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(9181,9128,3,3,3,10.0000,0.0000,1,0,1,1.0000,0.0000,0,0.00,10.0000,NULL,0.0000,'Retail',100.0000,0.0000,100.0000,0.0000,100.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(9182,9129,1,1,1,1.0000,0.0000,1,3,1,1.0000,5.0000,1,0.00,228.5714,NULL,60.0000,'Retail',228.5714,0.0000,228.5714,11.4286,240.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(9183,9130,1,1,1,10.0000,0.0000,1,3,1,1.0000,5.0000,1,0.00,228.5714,NULL,60.0000,'Retail',2285.7143,0.0000,2285.7143,114.2857,2400.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(9184,9130,2,2,2,40.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,70.0000,NULL,110.0000,'Retail',2800.0000,0.0000,2800.0000,140.0000,2940.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(9185,9130,3,3,3,15.0000,0.0000,1,0,1,1.0000,0.0000,0,0.00,10.0000,NULL,0.0000,'Retail',150.0000,0.0000,150.0000,0.0000,150.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(9186,9131,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,0,0.00,15.0000,NULL,50.0000,'Retail',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(9187,9132,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(9188,9133,5,5,5,2.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,48.4000,NULL,0.0000,'Retail',96.8000,0.0000,96.8000,4.8400,101.6400,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(9189,9134,11,11,11,1.0000,0.0000,1,0,1,1.0000,0.0000,0,0.00,150.0000,NULL,0.0000,'Retail',150.0000,0.0000,150.0000,0.0000,150.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(10180,10127,103,112,11005,1.5000,0.0000,1,0,1,1.0000,5.0000,1,0.00,42.8571,NULL,40.0000,'Retail',64.2857,0.0000,64.2857,3.2143,67.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(10181,10127,103,112,11005,1.5000,0.0000,1,0,1,1.0000,5.0000,1,0.00,9.5238,NULL,40.0000,'Retail',14.2857,0.0000,14.2857,0.7143,15.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(10182,10127,1,117,11006,0.5000,0.0000,1,3,1,1.0000,5.0000,1,0.00,29.0476,NULL,60.0000,'Retail',14.5238,0.0000,14.5238,0.7262,15.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11180,11127,2,2,2,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,50.0000,NULL,60.0000,'Retail',50.0000,0.0000,50.0000,2.5000,52.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11181,11128,12,12,11012,10.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,100.0000,NULL,0.0000,'Retail',1000.0000,0.0000,1000.0000,50.0000,1050.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11182,11129,5,5,11005,5.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,48.4000,NULL,0.0000,'Retail',242.0000,0.0000,242.0000,12.1000,254.1000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11183,11130,6,6,11006,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,1017.5000,NULL,0.0000,'Retail',1017.5000,0.0000,1017.5000,50.8750,1068.3750,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11184,11131,54,54,54,5.0000,0.0000,1,0,1,1.0000,1.0000,0,0.00,11.0000,NULL,0.0000,'Retail',55.0000,0.0000,55.0000,0.5500,55.5500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11185,11131,54,54,54,1.0000,0.0000,1,0,1,1.0000,1.0000,0,0.00,11.0000,NULL,0.0000,'Retail',11.0000,0.0000,11.0000,0.1100,11.1100,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11186,11131,58,58,58,1.0000,0.0000,1,0,1,1.0000,1.0000,0,0.00,16.5000,NULL,0.0000,'Retail',16.5000,0.0000,16.5000,0.1650,16.6650,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11187,11131,54,54,54,1.0000,0.0000,1,0,1,1.0000,1.0000,0,0.00,11.0000,NULL,0.0000,'Retail',11.0000,0.0000,11.0000,0.1100,11.1100,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11197,11138,1114,2125,11029,1.0000,0.0000,5,1003,1,1.0000,5.0000,0,0.00,10.0000,NULL,0.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11198,11139,1115,2126,11030,1.0000,0.0000,5,1007,1,1.0000,5.0000,0,0.00,25.0000,NULL,0.0000,'Retail',25.0000,0.0000,25.0000,1.2500,26.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11199,11139,1115,2126,11030,10.0000,0.0000,5,1008,1,10.0000,5.0000,0,0.00,2.5000,NULL,0.0000,'Retail',25.0000,0.0000,25.0000,1.2500,26.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11200,11139,1115,2126,11030,5.0000,0.0000,5,1008,1,10.0000,5.0000,0,0.00,2.5000,NULL,0.0000,'Retail',12.5000,0.0000,12.5000,0.6250,13.1250,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11201,11140,1116,2127,11031,5.0000,0.0000,3,1009,1,1.0000,5.0000,0,0.00,50.0000,NULL,0.0000,'Retail',250.0000,0.0000,250.0000,12.5000,262.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11202,11140,1116,2127,11031,8.0000,0.0000,3,1010,1,1000.0000,5.0000,0,0.00,0.0500,NULL,0.0000,'Retail',0.4000,0.0000,0.4000,0.0200,0.4200,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11203,11140,1116,2127,11031,0.5000,0.0000,3,1009,1,1.0000,5.0000,0,0.00,50.0000,NULL,0.0000,'Retail',25.0000,0.0000,25.0000,1.2500,26.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11204,11140,1116,2127,11031,100.0000,0.0000,3,1010,1,1000.0000,5.0000,0,0.00,0.0500,NULL,0.0000,'Retail',5.0000,0.0000,5.0000,0.2500,5.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11205,11140,1116,2127,11031,5.0000,0.0000,3,1010,1,1000.0000,5.0000,0,0.00,0.0500,NULL,0.0000,'Retail',0.2500,0.0000,0.2500,0.0125,0.2625,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11206,11141,1116,2127,11031,2.0000,0.0000,3,1009,1,1.0000,5.0000,0,0.00,250.0000,NULL,0.0000,'Retail',500.0000,0.0000,500.0000,25.0000,525.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11207,11142,5,5,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,48.4000,NULL,0.0000,'Retail',48.4000,0.0000,48.4000,2.4200,50.8200,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11211,11144,20,20,11020,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,189.7500,NULL,0.0000,'Retail',189.7500,0.0000,189.7500,9.4875,199.2375,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11212,11145,1117,2128,11032,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,10.0000,NULL,0.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11218,11149,1117,2128,11032,12.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,10.0000,NULL,0.0000,'Retail',120.0000,0.0000,120.0000,6.0000,126.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11219,11149,1117,2128,11032,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,10.0000,NULL,0.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11220,11149,1117,2128,11032,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,10.0000,NULL,0.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(11221,11150,1117,2128,11032,2.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,10.0000,NULL,0.0000,'Retail',20.0000,0.0000,20.0000,1.0000,21.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12223,12152,1114,2125,11029,1.0000,0.0000,5,1005,1,1.0000,5.0000,0,0.00,10.0000,NULL,0.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12224,12153,48,48,48,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,24.2000,NULL,0.0000,'Retail',24.2000,0.0000,24.2000,1.2100,25.4100,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12225,12154,14,14,11014,1.0000,0.0000,1,0,1,1.0000,0.0000,0,0.00,286.0000,NULL,0.0000,'Retail',286.0000,0.0000,286.0000,0.0000,286.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12226,12155,38,38,38,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,16.5000,NULL,0.0000,'Retail',16.5000,0.0000,16.5000,0.8250,17.3250,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12227,12156,1115,2126,11030,1.0000,0.0000,5,1007,1,1.0000,5.0000,0,0.00,0.0000,NULL,0.0000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12228,12157,1115,2126,11030,1.0000,0.0000,5,1007,1,1.0000,5.0000,0,0.00,0.0000,NULL,0.0000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12230,12159,1143,2154,11058,1.0000,0.0000,7,0,1,1.0000,5.0000,0,0.00,4.0000,NULL,4.0000,'Retail',4.0000,0.0000,4.0000,0.2000,4.2000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12232,12161,1142,2153,11057,1.0000,0.0000,7,0,1,1.0000,5.0000,0,10.00,4.0000,NULL,4.0000,'Retail',4.0000,0.4000,3.6000,0.1800,3.7800,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12233,12162,1116,2127,11031,1.0000,0.0000,3,1009,1,1.0000,5.0000,0,0.00,250.0000,NULL,0.0000,'Retail',250.0000,0.0000,250.0000,12.5000,262.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12234,12163,40,40,40,1.0000,0.0000,1,0,1,1.0000,0.0000,0,0.00,24.2000,NULL,0.0000,'Retail',24.2000,0.0000,24.2000,0.0000,24.2000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12235,12164,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12236,12165,1120,2131,11035,1.0000,0.0000,7,0,1,1.0000,5.0000,0,0.00,4.2500,NULL,4.2500,'Retail',4.2500,0.0000,4.2500,0.2125,4.4625,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12237,12166,1117,2128,11032,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,0.0000,NULL,0.0000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12238,12167,1118,2129,11033,1.0000,0.0000,7,0,1,1.0000,5.0000,0,0.00,5.0000,NULL,5.0000,'Retail',5.0000,0.0000,5.0000,0.2500,5.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12239,12168,97,109,11002,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,50.0000,NULL,60.0000,'Retail',50.0000,0.0000,50.0000,2.5000,52.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12240,12169,1118,2129,11033,1.0000,0.0000,7,0,1,1.0000,5.0000,0,0.00,5.0000,NULL,5.0000,'Retail',5.0000,0.0000,5.0000,0.2500,5.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(12241,12169,1119,2130,11034,1.0000,0.0000,7,0,1,1.0000,5.0000,0,0.00,5.0000,NULL,5.0000,'Retail',5.0000,0.0000,5.0000,0.2500,5.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(13234,12172,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,0,0.00,3.5000,NULL,3.5000,'Retail',3.5000,0.0000,3.5000,0.1750,3.6750,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(13235,12173,1130,2141,11045,1.0000,0.0000,7,0,1,1.0000,5.0000,0,0.00,3.0000,NULL,3.0000,'Retail',3.0000,0.0000,3.0000,0.1500,3.1500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(13236,12174,1136,2147,11051,1.0000,0.0000,7,0,1,1.0000,5.0000,0,0.00,5.0000,NULL,5.0000,'Retail',5.0000,0.0000,5.0000,0.2500,5.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(13237,12175,1129,2140,11044,1.0000,0.0000,7,0,1,1.0000,5.0000,0,0.00,100.0000,NULL,5.0000,'Retail',100.0000,0.0000,100.0000,5.0000,105.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14230,13170,1145,2156,11060,1.0000,0.0000,7,0,1,1.0000,5.0000,0,0.00,5.0000,NULL,5.0000,'Retail',5.0000,0.0000,5.0000,0.2500,5.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14231,13171,1146,2158,11061,1.0000,0.0000,1,0,1,1.0000,5.0000,0,10.00,10.0000,NULL,0.0000,'Retail',10.0000,1.0000,9.0000,0.4500,9.4500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14232,13172,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,0,0.00,10.5000,NULL,25.0000,'Retail',10.5000,0.0000,10.5000,0.5250,11.0250,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14233,13173,99,110,11003,1.0000,0.0000,3,0,1,1.0000,5.0000,0,0.00,15.0000,NULL,50.0000,'Retail',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14234,13174,99,110,11003,1.0000,0.0000,3,0,1,1.0000,5.0000,0,0.00,15.0000,NULL,50.0000,'Retail',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14236,13176,1115,2126,11030,1.0000,0.0000,5,1007,1,1.0000,5.0000,0,0.00,0.0000,NULL,0.0000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14237,13177,3147,4159,11065,1.0000,0.0000,1,2015,1,1.0000,5.0000,0,0.00,20.0000,NULL,0.0000,'Retail',20.0000,0.0000,20.0000,1.0000,21.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14238,13177,3147,4159,11065,1.0000,0.0000,1,2015,1,1.0000,5.0000,0,0.00,20.0000,NULL,0.0000,'Retail',20.0000,0.0000,20.0000,1.0000,21.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14242,13178,1115,2126,11030,1.0000,0.0000,5,1007,1,1.0000,5.0000,0,0.00,200.0000,NULL,0.0000,'Retail',200.0000,0.0000,200.0000,10.0000,210.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14243,13179,1115,2126,11030,1.0000,0.0000,5,1007,1,1.0000,5.0000,0,0.00,0.0000,NULL,0.0000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14244,13180,1116,2127,11031,0.5000,0.0000,3,0,1,1.0000,5.0000,0,0.00,250.0000,NULL,0.0000,'Retail',125.0000,0.0000,125.0000,6.2500,131.2500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14245,13181,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14246,13181,103,4160,11066,10.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,0.0000,'Retail',100.0000,0.0000,100.0000,5.0000,105.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14247,13182,8,8,11008,2.0000,0.0000,1,0,1,1.0000,0.0000,1,0.00,203.5000,NULL,0.0000,'Retail',407.0000,0.0000,407.0000,0.0000,407.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14248,13183,1115,2126,11030,1.0000,0.0000,5,1007,1,1.0000,5.0000,1,0.00,0.0000,NULL,0.0000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14249,13183,1135,2146,11050,4.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',40.0000,0.0000,40.0000,2.0000,42.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14250,13184,1135,2146,11050,3.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',30.0000,0.0000,30.0000,1.5000,31.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14251,13185,7,7,11007,1.0000,0.0000,1,0,1,1.0000,0.0000,1,0.00,250.0000,NULL,0.0000,'Retail',250.0000,0.0000,250.0000,0.0000,250.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14252,13186,3148,4161,11067,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,14.2857,NULL,0.0000,'Retail',14.2857,0.0000,14.2857,0.7143,15.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14253,13187,3148,4161,11067,5.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,14.2857,NULL,0.0000,'Retail',71.4285,0.0000,71.4285,3.5714,74.9999,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14254,13188,3148,4161,11067,5.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,14.2857,NULL,0.0000,'Retail',71.4285,0.0000,71.4285,3.5714,74.9999,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14256,13190,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14257,13191,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14258,13192,1138,2149,11053,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,3.8095,NULL,4.0000,'Retail',3.8095,0.0000,3.8095,0.1905,4.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14259,13192,1145,2156,11060,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,4.7619,NULL,5.0000,'Retail',4.7619,0.0000,4.7619,0.2381,5.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14260,13192,2147,3159,11063,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,0.0000,NULL,0.0000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14261,13193,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14262,13193,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14263,13193,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14268,13196,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14269,13197,1135,2146,11050,6.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',60.0000,0.0000,60.0000,3.0000,63.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14270,13197,6,6,11006,1.0000,0.0000,1,0,1,1.0000,0.0000,1,0.00,1017.5000,NULL,0.0000,'Retail',1017.5000,0.0000,1017.5000,0.0000,1017.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14271,13197,103,112,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,10.4762,NULL,40.0000,'Retail',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14272,13198,1138,2149,11053,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,3.8095,NULL,4.0000,'Retail',3.8095,0.0000,3.8095,0.1905,4.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14273,13199,3149,4162,11068,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,100.0000,NULL,0.0000,'Retail',100.0000,0.0000,100.0000,5.0000,105.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14274,13199,1137,2148,11052,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,4.2857,NULL,4.5000,'Retail',4.2857,0.0000,4.2857,0.2143,4.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14276,13201,3149,4162,11068,1.0000,0.0000,1,0,1,1.0000,5.0000,0,10.00,100.0000,NULL,0.0000,'Retail',100.0000,10.0000,90.0000,4.5000,94.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14277,13202,3149,4162,11068,1.0000,0.0000,1,0,1,1.0000,5.0000,0,10.00,100.0000,NULL,0.0000,'Retail',100.0000,10.0000,90.0000,4.5000,94.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14281,13203,58,58,58,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,15.7143,NULL,0.0000,'Retail',15.7143,0.0000,15.7143,0.7857,16.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14282,13203,59,59,59,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,15.7143,NULL,0.0000,'Retail',15.7143,0.0000,15.7143,0.7857,16.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14283,13203,62,62,62,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,18.8571,NULL,0.0000,'Retail',18.8571,0.0000,18.8571,0.9429,19.8000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14284,13203,3147,4159,11065,1.0000,0.0000,5,2015,1,1.0000,5.0000,1,0.00,19.0476,NULL,0.0000,'Retail',19.0476,0.0000,19.0476,0.9524,20.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14286,13204,3149,4162,11068,1.0000,0.0000,1,0,1,1.0000,5.0000,0,10.00,100.0000,NULL,0.0000,'Retail',100.0000,10.0000,90.0000,4.5000,94.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14287,13205,1140,2151,11055,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,1.4286,NULL,1.5000,'Retail',1.4286,0.0000,1.4286,0.0714,1.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14288,13206,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14290,13208,1145,2156,11060,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,4.7619,NULL,5.0000,'Retail',4.7619,0.0000,4.7619,0.2381,5.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14291,13209,2146,3158,11062,6.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,7.6190,NULL,0.0000,'Retail',45.7140,0.0000,45.7140,2.2857,47.9997,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(14292,13210,1136,2147,11051,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,14.2857,NULL,15.0000,'Retail',14.2857,0.0000,14.2857,0.7143,15.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(15294,14211,1141,2152,11056,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,4.7619,NULL,5.0000,'Retail',4.7619,0.0000,4.7619,0.2381,5.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(15295,14212,1,5169,11076,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,57.1429,NULL,0.0000,'Retail',57.1429,0.0000,57.1429,2.8571,60.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(15297,14212,1,1,11001,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,47.6190,NULL,60.0000,'Retail',47.6190,0.0000,47.6190,2.3810,50.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(15300,14214,1130,2141,11045,4.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,2.8571,NULL,3.0000,'Retail',11.4284,0.0000,11.4284,0.5714,11.9998,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(15301,14215,3147,4159,11065,1.0000,0.0000,5,2015,1,1.0000,5.0000,1,0.00,19.0476,NULL,0.0000,'Retail',19.0476,0.0000,19.0476,0.9524,20.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(16295,15212,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(16296,15213,1136,2147,11051,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,14.2857,NULL,15.0000,'Retail',14.2857,0.0000,14.2857,0.7143,15.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17295,16212,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17296,16212,1145,2156,11060,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,85.7143,NULL,5.0000,'Retail',85.7143,0.0000,85.7143,4.2857,90.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17297,16213,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17298,16213,1145,2156,11060,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,4.7619,NULL,5.0000,'Retail',4.7619,0.0000,4.7619,0.2381,5.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17299,16213,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17300,16214,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17301,16215,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17302,16215,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17303,16216,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17304,16217,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17305,16217,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17306,16218,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17307,16218,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17312,16219,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17313,16219,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17314,16219,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17315,16219,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17346,16226,1135,2146,11050,2.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,76.1905,NULL,25.0000,'Retail',152.3810,0.0000,152.3810,7.6191,160.0001,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17347,16226,1136,2147,11051,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,14.2857,NULL,15.0000,'Retail',14.2857,0.0000,14.2857,0.7143,15.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17350,16228,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17351,16228,1,5169,11076,1.0000,0.0000,1,3,1,1.0000,5.0000,1,0.00,0.0000,NULL,0.0000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17355,16229,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17356,16230,1135,2146,11050,10.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',100.0000,1.0000,99.0000,4.9500,103.9500,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17358,16230,8,8,11008,5.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,193.8095,NULL,0.0000,'Retail',969.0475,181.8127,787.2348,39.3617,826.5965,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17357,16231,24,24,11024,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,47.6190,NULL,0.0000,'Retail',47.6190,4.7619,42.8571,2.1429,45.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(17386,16235,1135,2146,11050,3.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',30.0000,0.0000,30.0000,1.5000,31.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18365,17236,1115,2126,11030,1.0000,0.0000,5,1007,1,1.0000,5.0000,1,0.00,9.5238,NULL,0.0000,'Retail',9.5238,0.0000,9.5238,0.4762,10.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18366,17236,1115,2126,11030,10.0000,0.0000,5,1008,1,10.0000,5.0000,1,0.00,9.5238,NULL,0.0000,'Retail',95.2381,0.0000,95.2381,4.7619,100.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18367,17237,1115,2126,11030,1.0000,0.0000,5,1007,1,1.0000,5.0000,1,0.00,19.0476,NULL,0.0000,'Retail',19.0476,0.0000,19.0476,0.9524,20.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18368,17238,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18369,17238,1145,2156,11060,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,4.7619,NULL,5.0000,'Retail',4.7619,0.0000,4.7619,0.2381,5.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18378,17245,4157,5174,11079,1.0000,0.0000,5,2019,1,1.0000,5.0000,0,0.00,16.0000,NULL,0.0000,'Retail',16.0000,0.0000,16.0000,0.8000,16.8000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18392,17251,1135,2146,11050,4.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',40.0000,0.0000,40.0000,2.0000,42.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18393,17252,1135,2146,11050,7.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',70.0000,0.0000,70.0000,3.5000,73.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18394,17253,1135,2146,11050,2.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',20.0000,0.0000,20.0000,1.0000,21.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18395,17254,14,14,11014,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,272.3810,NULL,0.0000,'Retail',272.3810,0.0000,272.3810,13.6190,286.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18400,17255,14,14,11014,3.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,272.3810,NULL,0.0000,'Retail',817.1430,0.0000,817.1430,40.8572,858.0002,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18406,17260,4158,5175,11080,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,0.0000,NULL,0.0000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18407,17260,4159,5176,11081,1.0000,0.0000,1,0,1,1.0000,5.0000,0,0.00,0.0000,NULL,0.0000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(19389,18250,5158,6175,11082,10.0000,0.0000,3,0,1,1.0000,5.0000,0,0.00,600.0000,NULL,0.0000,'Retail',6000.0000,0.0000,6000.0000,300.0000,6300.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(19390,18250,5158,6175,11082,1.0000,0.0000,3,0,1,1.0000,5.0000,0,0.00,60.0000,NULL,0.0000,'Retail',60.0000,0.0000,60.0000,3.0000,63.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(20388,19249,6158,7175,11083,0.8200,0.0000,3,0,1,1.0000,5.0000,0,0.00,1.6400,NULL,0.0000,'Retail',1.3448,0.0000,1.3448,0.0672,1.4120,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(20389,19249,6158,7175,11083,0.8200,0.0000,3,0,1,1.0000,5.0000,0,0.00,1.6400,NULL,0.0000,'Retail',1.3448,0.0000,1.3448,0.0672,1.4120,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(20390,19249,6158,7175,11083,0.8200,0.0000,3,0,1,1.0000,5.0000,0,0.00,1.6400,NULL,0.0000,'Retail',1.3448,0.0000,1.3448,0.0672,1.4120,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(20391,19249,6158,7175,11083,0.8200,0.0000,3,0,1,1.0000,5.0000,0,0.00,2.0000,NULL,0.0000,'Retail',1.6400,0.0000,1.6400,0.0820,1.7220,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(20392,19250,1137,2148,11052,0.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,4.2857,NULL,4.5000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(20393,19250,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(20394,19251,1137,2148,11052,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,4.2857,NULL,4.5000,'Retail',4.2857,0.0000,4.2857,0.2143,4.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(21388,20249,5,5,11005,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,46.0952,NULL,0.0000,'Retail',46.0952,0.0000,46.0952,2.3048,48.4000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(21389,20250,1135,2146,11050,1.0000,0.0000,7,0,1,1.0000,5.0000,1,0.00,10.0000,NULL,25.0000,'Retail',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(21390,20251,1,1,11000,1.0000,0.0000,1,3,1,1.0000,5.0000,1,0.00,47.6190,NULL,60.0000,'Retail',47.6190,0.0000,47.6190,2.3810,50.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(21391,20251,2,2,11001,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,57.1429,NULL,0.0000,'Retail',57.1429,0.0000,57.1429,2.8571,60.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(21392,20251,3,3,11002,0.2500,0.0000,1,0,1,1.0000,5.0000,1,0.00,0.0000,NULL,0.0000,'Retail',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18381,17245,99,110,11003,1.0000,0.0000,3,1,1,1.0000,5.0000,1,0.00,12.3356,NULL,50.0000,'Retail',12.3356,0.0000,12.3356,0.6168,12.9524,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18383,17247,4157,5174,11079,1.0000,0.0000,5,2020,1,10.0000,5.0000,0,0.00,1.6000,NULL,0.0000,'Retail',1.6000,0.0000,1.6000,0.0800,1.6800,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18384,17247,4157,5174,11079,1.0000,0.0000,5,2019,1,1.0000,5.0000,0,0.00,16.0000,NULL,0.0000,'Retail',16.0000,0.0000,16.0000,0.8000,16.8000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18389,17250,32,32,32,8.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,42.4286,NULL,0.0000,'Retail',339.4288,0.0000,339.4288,16.9714,356.4002,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18390,17250,19,19,11019,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,27.2381,NULL,0.0000,'Retail',27.2381,0.0000,27.2381,1.3619,28.6000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(18391,17250,10,10,11010,1.0000,0.0000,1,0,1,1.0000,5.0000,1,0.00,890.4762,NULL,0.0000,'Retail',890.4762,0.0000,890.4762,44.5238,935.0000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0);

/*Table structure for table `sales_detail_temp` */

DROP TABLE IF EXISTS `sales_detail_temp`;

CREATE TABLE `sales_detail_temp` (
  `Sales_DetailTemp_Id` int(11) NOT NULL,
  `Sales_MasterTemp_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Quantity` decimal(18,4) DEFAULT NULL,
  `Extra` decimal(18,4) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Convertion_Factor` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(18,4) DEFAULT NULL,
  `TaxInclusive` tinyint(1) DEFAULT NULL,
  `Disc_Percentage` decimal(18,2) DEFAULT NULL,
  `Sales_Rate` decimal(18,4) DEFAULT NULL,
  `Sales_Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Rate_Type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT NULL,
  `Net_Amount` decimal(18,4) DEFAULT NULL,
  `Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Amount` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Inclusive` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Exclusive` decimal(18,4) DEFAULT NULL,
  `SGST_Percentage` decimal(18,4) DEFAULT NULL,
  `CGST_Percentage` decimal(18,4) DEFAULT NULL,
  `IGST_Percentage` decimal(18,4) DEFAULT NULL,
  `Package_Id` int(11) DEFAULT NULL,
  `Supplier_Id` int(11) DEFAULT NULL,
  `Commission_Percentage` decimal(18,4) DEFAULT NULL,
  `Service_Percentage` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`Sales_DetailTemp_Id`),
  KEY `FK_Sales_DetailTemp_Product_Detail` (`Product_Detail_Id`),
  KEY `FK_Sales_DetailTemp_Product_Master` (`Product_Id`),
  KEY `FK_Sales_DetailTemp_Sales_Master` (`Sales_MasterTemp_Id`),
  KEY `FK_Sales_DetailTemp_Unit` (`Base_Unit_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `sales_detail_temp` */

/*Table structure for table `sales_master` */

DROP TABLE IF EXISTS `sales_master`;

CREATE TABLE `sales_master` (
  `Sales_Master_Id` int(11) NOT NULL,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Delivery_Date` datetime(6) DEFAULT NULL,
  `Invoice_Time` time(6) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Serial_No` int(11) DEFAULT NULL,
  `Branch_Id` int(11) DEFAULT NULL,
  `Counter_Id` int(11) DEFAULT NULL,
  `Counter_Name` varchar(50) DEFAULT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  `Customer_Name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `IsCash` int(11) DEFAULT NULL,
  `Bank_Id` int(11) DEFAULT NULL,
  `Card_Id` int(11) DEFAULT NULL,
  `Card_No` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Vehicle_Id` int(11) DEFAULT NULL,
  `Destination` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  `Quotation_Id` int(11) DEFAULT NULL,
  `Sales_Order_Id` int(11) DEFAULT NULL,
  `Remark` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TermsAndConditions` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Total_Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Net_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Amount` decimal(18,4) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Freight_Charge` decimal(18,4) DEFAULT NULL,
  `Round_Off` decimal(18,4) DEFAULT NULL,
  `Grand_Total` decimal(18,4) DEFAULT NULL,
  `MultiCash` decimal(18,4) DEFAULT NULL,
  `MultiCard` decimal(18,4) DEFAULT NULL,
  `Is_Saved` tinyint(1) DEFAULT NULL,
  `Is_Cancelled` tinyint(1) DEFAULT NULL,
  `Is_Sync` tinyint(1) DEFAULT NULL,
  `Is_Hold` tinyint(1) DEFAULT NULL,
  `Company_Id` int(11) NOT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Sales_Master_Id`,`Company_Id`),
  KEY `FK_Sales_Master_Bank` (`Bank_Id`),
  KEY `FK_Sales_Master_Counter` (`Counter_Id`),
  KEY `FK_Sales_Master_Customer` (`Customer_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `sales_master` */

insert  into `sales_master`(`Sales_Master_Id`,`Invoice_Date`,`Delivery_Date`,`Invoice_Time`,`Invoice_No`,`Serial_No`,`Branch_Id`,`Counter_Id`,`Counter_Name`,`Customer_Id`,`Customer_Name`,`Phone`,`Address`,`Salesman_Id`,`User_Id`,`IsCash`,`Bank_Id`,`Card_Id`,`Card_No`,`Vehicle_Id`,`Destination`,`Return_Date`,`Quotation_Id`,`Sales_Order_Id`,`Remark`,`TermsAndConditions`,`Total_Gross_Amount`,`Total_Discount_Amount`,`Total_Net_Amount`,`Total_Tax_Amount`,`Total_Amount`,`Paid_Amount`,`Discount_Amount`,`Freight_Charge`,`Round_Off`,`Grand_Total`,`MultiCash`,`MultiCard`,`Is_Saved`,`Is_Cancelled`,`Is_Sync`,`Is_Hold`,`Company_Id`,`Modified_By`,`Modified_Date`) values 
(1097,'2019-06-23 00:00:00.000000','2019-06-23 00:00:00.000000','16:55:23.548310',1,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',7194.0000,0.0000,7194.0000,359.7000,7553.7000,0.0000,0.0000,0.0000,0.0000,7553.7000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:07:09.000000'),
(1100,'2019-06-23 00:00:00.000000','2019-06-23 00:00:00.000000','18:32:50.172566',2,0,1,3,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,11.0000,NULL,NULL,0,0,0,NULL,2,2,'2020-07-11 22:26:57.000000'),
(1101,'2019-06-23 00:00:00.000000','2019-06-23 00:00:00.000000','18:56:46.736813',3,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,11.0000,NULL,NULL,0,0,0,NULL,3,1,'2020-07-11 22:26:59.000000'),
(1102,'2019-06-23 00:00:00.000000','2019-06-23 00:00:00.000000','18:57:07.580153',4,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',38.1000,0.0000,38.1000,1.9000,40.0000,36.0000,4.0000,0.0000,0.0000,36.0000,NULL,NULL,1,0,0,NULL,4,2,'2020-07-11 22:27:00.000000'),
(1103,'2019-07-03 00:00:00.000000','2019-07-03 00:00:00.000000','15:00:23.402884',5,NULL,1,3,'A',NULL,'916 Cutomer','','',4,1,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',1016.4800,0.0000,1016.4800,50.8200,1067.3000,0.0000,0.0000,0.0000,0.0000,1067.3000,NULL,NULL,0,1,0,NULL,2,1,'2020-07-11 22:27:01.000000'),
(1104,'2019-07-03 00:00:00.000000','2019-07-03 00:00:00.000000','21:07:33.051789',6,NULL,1,3,'A',NULL,'916 Cutomer','','',4,1,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',20.9500,0.0000,20.9500,1.0500,22.0000,0.0000,0.0000,0.0000,0.0000,22.0000,NULL,NULL,0,1,0,NULL,3,1,'2020-07-11 22:27:03.000000'),
(1105,'2019-07-04 00:00:00.000000','2019-07-04 00:00:00.000000','11:31:35.191796',7,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',10.4800,0.0000,10.4800,0.5200,11.0000,0.0000,0.0000,0.0000,0.0000,11.0000,NULL,NULL,0,1,0,NULL,4,1,'2020-07-11 22:27:07.000000'),
(1108,'2019-07-04 00:00:00.000000','2019-07-04 00:00:00.000000','17:56:20.894688',8,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',935.0000,0.0000,935.0000,46.7500,981.7500,NULL,NULL,NULL,NULL,981.7500,NULL,NULL,0,0,0,NULL,3,1,'2020-07-11 22:27:12.000000'),
(1109,'2019-07-04 00:00:00.000000','2019-07-04 00:00:00.000000','18:09:32.553051',9,0,1,3,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,11.0000,NULL,NULL,0,0,0,NULL,4,2,'2020-07-11 22:27:13.000000'),
(1110,'2019-07-04 00:00:00.000000','2019-07-04 00:00:00.000000','18:13:10.511901',10,0,1,3,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',108.5712,0.0000,108.5712,5.4286,113.9998,NULL,NULL,NULL,NULL,113.9998,NULL,NULL,0,0,0,NULL,4,2,'2020-07-11 22:27:14.000000'),
(1111,'2019-07-05 00:00:00.000000','2019-07-05 00:00:00.000000','16:42:45.914570',11,NULL,1,3,'A',NULL,'','','',4,1,1,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',114.4000,0.0000,114.4000,5.7200,120.1200,0.0000,20.1200,0.0000,0.0000,100.0000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:07:43.000000'),
(1112,'2019-07-05 00:00:00.000000','2019-07-05 00:00:00.000000','21:42:13.441171',12,NULL,1,3,'A',1015,'Test Customer','','',4,1,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',20.9500,0.0000,20.9500,1.0500,22.0000,0.0000,10.0000,0.0000,0.0000,12.0000,NULL,NULL,1,0,0,NULL,2,1,'2020-07-11 22:27:17.000000'),
(1113,'2019-07-14 00:00:00.000000','2019-07-14 00:00:00.000000','13:31:10.406140',13,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',100.0000,0.0000,100.0000,5.0000,105.0000,0.0000,0.0000,0.0000,0.0000,105.0000,NULL,NULL,1,0,0,NULL,2,1,'2020-07-11 22:27:18.000000'),
(1114,'2019-07-16 00:00:00.000000','2019-07-16 00:00:00.000000','14:04:33.777441',14,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',2500.0000,0.0000,2500.0000,125.0000,2625.0000,0.0000,0.0000,0.0000,0.0000,2625.0000,NULL,NULL,1,0,0,NULL,3,2,'2020-07-11 22:27:19.000000'),
(1115,'2019-08-02 00:00:00.000000','2019-08-02 00:00:00.000000','17:35:46.306728',15,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,0.0000,0.0000,0.0000,0.0000,15.7500,NULL,NULL,1,0,0,NULL,3,1,'2020-07-11 22:27:20.000000'),
(1118,'2019-08-02 00:00:00.000000','2019-08-02 00:00:00.000000','18:14:49.030481',16,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,0.0000,0.0000,0.0000,0.0000,15.7500,NULL,NULL,1,0,0,NULL,3,2,'2020-07-11 22:27:23.000000'),
(1119,'2019-08-02 00:00:00.000000','2019-08-02 00:00:00.000000','18:17:06.373089',17,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,0.0000,0.0000,0.0000,0.0000,15.7500,NULL,NULL,1,0,0,NULL,4,2,'2020-07-11 22:27:24.000000'),
(1121,'2019-08-05 00:00:00.000000','2019-08-05 00:00:00.000000','13:37:41.652164',18,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',100.0000,0.0000,100.0000,0.0000,100.0000,NULL,NULL,NULL,NULL,100.0000,NULL,NULL,0,0,0,NULL,4,1,'2020-07-11 22:27:25.000000'),
(1123,'2019-08-05 00:00:00.000000','2019-08-05 00:00:00.000000','14:29:38.223781',19,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',375.0000,0.0000,375.0000,0.0000,375.0000,0.0000,0.0000,0.0000,0.0000,375.0000,NULL,NULL,1,0,0,NULL,4,1,'2020-07-11 22:27:26.000000'),
(1124,'2019-08-05 00:00:00.000000','2019-08-05 00:00:00.000000','14:49:33.519909',20,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','fgdtgfhfgh',20.0000,0.0000,20.0000,1.0000,21.0000,0.0000,0.0000,0.0000,0.0000,21.0000,NULL,NULL,0,1,0,NULL,4,1,'2020-07-11 22:27:27.000000'),
(2120,'2019-08-07 00:00:00.000000','2019-08-07 00:00:00.000000','15:11:01.215064',21,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',10.4800,0.0000,10.4800,0.5200,11.0000,0.0000,0.0000,0.0000,0.0000,11.0000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:07:58.000000'),
(2121,'2019-08-07 00:00:00.000000','2019-08-07 00:00:00.000000','15:12:17.595370',22,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',10.4800,0.0000,10.4800,0.5200,11.0000,0.0000,0.0000,0.0000,0.0000,11.0000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:08:00.000000'),
(2122,'2019-08-08 00:00:00.000000','2019-08-08 00:00:00.000000','14:33:49.750231',23,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:01.000000'),
(2125,'2019-08-13 00:00:00.000000','2019-08-13 00:00:00.000000','21:55:04.511103',24,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',80.0000,8.0000,72.0000,3.6000,75.6000,NULL,NULL,NULL,NULL,75.6000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:02.000000'),
(2129,'2019-08-14 00:00:00.000000','2019-08-14 00:00:00.000000','14:40:07.412317',25,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','2 Year Of Warranty from The Date  of Purchase                                                              ',114.4000,0.0000,114.4000,0.0000,114.4000,0.0000,0.0000,0.0000,0.0000,114.4000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:08:04.000000'),
(2130,'2019-08-14 00:00:00.000000','2019-08-14 00:00:00.000000','14:49:33.736067',26,0,1,3,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,15.7500,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:08:05.000000'),
(3125,'2019-08-16 00:00:00.000000','2019-08-16 00:00:00.000000','20:38:29.284824',27,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,0.0000,0.0000,0.0000,0.0000,15.7500,NULL,NULL,1,0,0,NULL,2,2,'2020-07-11 22:27:41.000000'),
(3126,'2019-08-16 00:00:00.000000','2019-08-16 00:00:00.000000','20:39:05.199910',28,0,1,3,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',30.0000,0.0000,30.0000,1.5000,31.5000,NULL,NULL,NULL,NULL,31.5000,NULL,NULL,0,0,0,NULL,2,2,'2020-07-11 22:27:43.000000'),
(4125,'2019-08-18 00:00:00.000000','2019-08-18 00:00:00.000000','12:34:30.831693',29,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',1500.0000,0.0000,1500.0000,0.0000,1500.0000,NULL,NULL,NULL,NULL,1500.0000,NULL,NULL,0,0,0,NULL,3,1,'2020-07-11 22:27:44.000000'),
(4126,'2019-09-06 00:00:00.000000','2019-09-06 00:00:00.000000','16:18:57.628745',30,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',28.5700,0.0000,28.5700,1.4300,30.0000,0.0000,0.0000,0.0000,0.0000,30.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:08:11.000000'),
(4127,'2019-09-07 00:00:00.000000','2019-09-07 00:00:00.000000','18:55:27.680356',31,NULL,1,3,'A',NULL,'','','',0,2,1,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',50.0000,0.0000,50.0000,2.5000,52.5000,0.0000,0.0000,0.0000,0.0000,52.5000,NULL,NULL,1,0,0,NULL,3,2,'2020-07-11 22:27:46.000000'),
(5126,'2019-09-16 00:00:00.000000','2019-09-16 00:00:00.000000','23:57:43.322128',32,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',200.0000,0.0000,200.0000,10.0000,210.0000,NULL,NULL,NULL,NULL,210.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:14.000000'),
(5127,'2019-09-23 00:00:00.000000','2019-09-23 00:00:00.000000','19:59:28.425097',33,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,15.7500,NULL,NULL,0,0,0,NULL,3,1,'2020-07-11 22:27:48.000000'),
(5128,'2019-09-23 00:00:00.000000','2019-09-23 00:00:00.000000','20:38:32.349018',34,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',98.8100,0.0000,98.8100,4.9400,103.7500,0.0000,0.0000,0.0000,0.0000,103.7500,NULL,NULL,0,1,0,0,1,2,'2020-07-18 14:08:17.000000'),
(6127,'2019-10-03 00:00:00.000000','2019-10-03 00:00:00.000000','11:51:10.177949',35,0,1,3,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',25.4762,0.0000,25.4762,1.2738,26.7500,NULL,NULL,NULL,NULL,26.7500,NULL,NULL,0,0,0,NULL,4,2,'2020-07-11 22:27:50.000000'),
(7127,'2019-10-15 00:00:00.000000','2019-10-15 00:00:00.000000','16:35:44.938225',36,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',74.3800,0.0000,74.3800,2.6200,77.0000,0.0000,0.0000,0.0000,0.0000,77.0000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:08:20.000000'),
(7128,'2019-10-21 00:00:00.000000','2019-10-21 00:00:00.000000','18:26:52.217265',37,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',70.0000,0.0000,70.0000,3.5000,73.5000,0.0000,0.0000,0.0000,0.0000,73.5000,NULL,NULL,1,0,0,NULL,4,1,'2020-07-11 22:27:52.000000'),
(8127,'2019-10-24 00:00:00.000000','2019-10-24 00:00:00.000000','17:17:14.325028',38,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,0.0000,0.0000,0.0000,0.0000,15.7500,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:08:23.000000'),
(8128,'2019-10-25 00:00:00.000000','2019-10-25 00:00:00.000000','18:26:52.885669',39,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',228.5714,0.0000,228.5714,11.4286,240.0000,NULL,NULL,NULL,NULL,240.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:24.000000'),
(9127,'2019-11-05 00:00:00.000000','2019-11-05 00:00:00.000000','16:28:56.230162',40,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',119.0500,0.0000,119.0500,5.9500,125.0000,200.0000,0.0000,0.0000,0.0000,125.0000,NULL,NULL,1,0,0,NULL,4,2,'2020-07-11 22:28:06.000000'),
(9128,'2019-11-07 00:00:00.000000','2019-11-07 00:00:00.000000','13:36:30.801412',41,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',100.0000,0.0000,100.0000,0.0000,100.0000,0.0000,0.0000,0.0000,0.0000,100.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:08:27.000000'),
(9129,'2019-11-07 00:00:00.000000','2019-11-07 00:00:00.000000','13:37:19.045056',42,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',228.5700,0.0000,228.5700,11.4300,240.0000,216.0000,0.0000,0.0000,0.0000,240.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:08:29.000000'),
(9130,'2019-11-07 00:00:00.000000','2019-11-07 00:00:00.000000','13:55:02.917532',43,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','2 Year Of Warranty from The Date  of Purchase                                                              ',5235.7100,0.0000,5235.7100,254.2900,5490.0000,0.0000,0.0000,0.0000,0.0000,5490.0000,NULL,NULL,1,0,0,NULL,4,1,'2020-07-11 22:28:09.000000'),
(9131,'2019-11-07 00:00:00.000000','2019-11-07 00:00:00.000000','15:57:28.557904',44,0,1,3,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,15.7500,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:08:33.000000'),
(9132,'2019-11-07 00:00:00.000000','2019-11-07 00:00:00.000000','19:38:51.581283',45,0,1,3,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,11.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:08:34.000000'),
(9133,'2019-11-11 00:00:00.000000','2019-11-11 00:00:00.000000','15:38:35.857075',46,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',96.8000,0.0000,96.8000,4.8400,101.6400,NULL,NULL,NULL,NULL,101.6400,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:36.000000'),
(9134,'2019-11-11 00:00:00.000000','2019-11-11 00:00:00.000000','15:46:51.922853',47,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',150.0000,0.0000,150.0000,0.0000,150.0000,NULL,NULL,NULL,NULL,150.0000,NULL,NULL,0,0,0,NULL,2,1,'2020-07-11 22:28:13.000000'),
(10127,'2019-11-16 00:00:00.000000','2019-11-16 00:00:00.000000','17:22:43.178165',48,0,1,3,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',93.0952,0.0000,93.0952,4.6548,97.7500,NULL,NULL,NULL,NULL,97.7500,NULL,NULL,0,0,0,NULL,2,2,'2020-07-11 22:28:14.000000'),
(11127,'2019-11-30 00:00:00.000000','2019-11-30 00:00:00.000000','01:48:40.800168',49,NULL,1,3,'A',1016,'Niya','','',4,1,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',50.0000,0.0000,50.0000,2.5000,52.5000,0.0000,0.0000,0.0000,0.0000,52.5000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:08:41.000000'),
(11128,'2019-12-04 00:00:00.000000','2019-12-04 00:00:00.000000','22:58:52.553945',50,NULL,1,3,'A',1016,'Niya','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','vILLA 205, LIWA AUDITORIOUM',1000.0000,0.0000,1000.0000,50.0000,1050.0000,0.0000,0.0000,0.0000,0.0000,1050.0000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:08:42.000000'),
(11129,'2019-12-05 00:00:00.000000','2019-12-05 00:00:00.000000','00:18:25.775606',51,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',242.0000,0.0000,242.0000,12.1000,254.1000,500.0000,0.0000,0.0000,0.0000,254.1000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:08:44.000000'),
(11130,'2019-12-05 00:00:00.000000','2019-12-05 00:00:00.000000','00:28:15.892383',52,0,1,3,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',1017.5000,0.0000,1017.5000,50.8750,1068.3750,NULL,NULL,NULL,NULL,1068.3750,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:08:45.000000'),
(11131,'2019-12-07 00:00:00.000000','2019-12-07 00:00:00.000000','15:56:43.022485',53,0,1,3,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',49.5000,0.0000,49.5000,0.4950,49.9950,NULL,NULL,NULL,NULL,49.9950,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:08:47.000000'),
(11138,'2019-12-07 00:00:00.000000','2019-12-07 00:00:00.000000','23:26:09.672426',54,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:48.000000'),
(11139,'2019-12-08 00:00:00.000000','2019-12-08 00:00:00.000000','12:59:32.389463',55,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',62.5000,0.0000,62.5000,3.1250,65.6250,NULL,NULL,NULL,NULL,65.6250,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:50.000000'),
(11140,'2019-12-08 00:00:00.000000','2019-12-08 00:00:00.000000','13:24:45.210211',56,0,1,NULL,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',325.0000,0.0000,325.0000,16.2500,341.2500,NULL,NULL,NULL,NULL,341.2500,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:51.000000'),
(11141,'2019-12-08 00:00:00.000000','2019-12-08 00:00:00.000000','16:36:49.300202',57,0,1,NULL,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',500.0000,0.0000,500.0000,25.0000,525.0000,NULL,NULL,NULL,NULL,525.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:53.000000'),
(11142,'2019-12-09 00:00:00.000000','2019-12-09 00:00:00.000000','19:30:34.834692',58,0,1,NULL,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',48.4000,0.0000,48.4000,2.4200,50.8200,NULL,NULL,NULL,NULL,50.8200,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:08:54.000000'),
(11144,'2019-12-14 00:00:00.000000','2019-12-14 00:00:00.000000','19:28:06.305561',59,0,1,NULL,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',189.7500,0.0000,189.7500,9.4875,199.2375,NULL,NULL,NULL,NULL,199.2375,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:56.000000'),
(11145,'2019-12-14 00:00:00.000000','2019-12-14 00:00:00.000000','19:34:38.390556',60,0,1,NULL,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:57.000000'),
(11149,'2019-12-14 00:00:00.000000','2019-12-14 00:00:00.000000','20:19:44.114410',61,0,1,NULL,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',140.0000,0.0000,140.0000,7.0000,147.0000,NULL,NULL,NULL,NULL,147.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:59.000000'),
(11150,'2019-12-15 00:00:00.000000','2019-12-15 00:00:00.000000','12:05:44.510740',62,0,1,NULL,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',20.0000,0.0000,20.0000,1.0000,21.0000,NULL,NULL,NULL,NULL,21.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:00.000000'),
(12152,'2019-12-22 00:00:00.000000','2019-12-22 00:00:00.000000','21:02:03.912792',63,0,1,NULL,'',NULL,'','','',6,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:02.000000'),
(12153,'2019-12-22 00:00:00.000000','2019-12-22 00:00:00.000000','21:10:33.446213',64,0,1,2,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',24.2000,0.0000,24.2000,1.2100,25.4100,NULL,NULL,NULL,NULL,25.4100,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:03.000000'),
(12154,'2019-12-22 00:00:00.000000','2019-12-22 00:00:00.000000','23:02:40.605912',65,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',286.0000,0.0000,286.0000,0.0000,286.0000,0.0000,0.0000,0.0000,0.0000,286.0000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:09:05.000000'),
(12155,'2019-12-22 00:00:00.000000','2019-12-22 00:00:00.000000','23:29:40.940243',66,0,1,3,'B',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',16.5000,0.0000,16.5000,0.8250,17.3250,NULL,NULL,NULL,NULL,17.3250,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:06.000000'),
(12156,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','00:32:25.112696',67,NULL,1,3,'B',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:09:08.000000'),
(12157,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','12:36:16.537180',68,0,1,3,'B',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:09:10.000000'),
(12159,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','13:24:34.987692',69,0,1,3,'B',1,'Customer 15454','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',4.0000,0.0000,4.0000,0.2000,4.2000,NULL,NULL,NULL,NULL,4.2000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:11.000000'),
(12161,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','14:09:06.089994',71,0,1,3,'B',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',4.0000,0.4000,3.6000,0.1800,3.7800,NULL,NULL,NULL,NULL,3.7800,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:13.000000'),
(12162,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','17:32:04.548021',72,0,1,3,'B',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',250.0000,0.0000,250.0000,12.5000,262.5000,NULL,NULL,NULL,NULL,262.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:09:14.000000'),
(12163,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','17:34:01.407756',73,NULL,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',24.2000,0.0000,24.2000,0.0000,24.2000,0.0000,0.0000,0.0000,0.0000,24.2000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:09:15.000000'),
(12164,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','19:44:39.759893',74,NULL,1,3,'B',2,'Cust343','0554307535','',0,2,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',10.4800,0.0000,10.4800,0.5200,11.0000,0.0000,0.0000,0.0000,0.0000,11.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:09:17.000000'),
(12165,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','19:45:53.533425',75,NULL,1,3,'B',NULL,'','','',0,2,1,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',4.2500,0.0000,4.2500,0.2100,4.4600,0.0000,0.0000,0.0000,0.0000,4.4600,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:09:19.000000'),
(12166,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','20:13:55.183038',76,0,1,3,'B',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:09:20.000000'),
(12167,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','20:22:18.806842',77,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',5.0000,0.0000,5.0000,0.2500,5.2500,NULL,NULL,NULL,NULL,5.2500,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:09:21.000000'),
(12168,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','20:37:50.895438',78,0,1,2,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',50.0000,0.0000,50.0000,2.5000,52.5000,NULL,NULL,NULL,NULL,52.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:09:23.000000'),
(12169,'2019-12-23 00:00:00.000000','2019-12-23 00:00:00.000000','21:03:26.665775',79,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:24.000000'),
(12172,'2020-01-01 00:00:00.000000','2020-01-01 00:00:00.000000','18:11:49.189063',80,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',3.5000,0.0000,3.5000,0.1750,3.6750,NULL,NULL,NULL,NULL,3.6750,NULL,NULL,0,0,0,NULL,4,1,'2020-07-11 22:29:24.000000'),
(12173,'2020-01-01 00:00:00.000000','2020-01-01 00:00:00.000000','18:17:35.253515',81,NULL,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',3.0000,0.0000,3.0000,0.1500,3.1500,0.0000,0.0000,0.0000,0.0000,3.1500,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:09:27.000000'),
(12174,'2020-01-02 00:00:00.000000','2020-01-02 00:00:00.000000','18:34:53.807089',82,NULL,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',5.0000,0.0000,5.0000,0.2500,5.2500,0.0000,0.0000,0.0000,0.0000,5.2500,NULL,NULL,1,0,0,NULL,4,1,'2020-07-11 22:29:33.000000'),
(12175,'2020-01-03 00:00:00.000000','2020-01-03 00:00:00.000000','18:50:53.170198',83,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',100.0000,0.0000,100.0000,5.0000,105.0000,NULL,NULL,NULL,NULL,105.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:30.000000'),
(13170,'2020-01-05 00:00:00.000000','2020-01-05 00:00:00.000000','13:28:20.343755',84,NULL,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',5.0000,0.0000,5.0000,0.2500,5.2500,0.0000,0.0000,0.0000,0.0000,5.2500,NULL,NULL,1,0,0,NULL,4,1,'2020-07-11 22:29:42.000000'),
(13171,'2020-01-13 00:00:00.000000','2020-01-13 00:00:00.000000','17:50:00.833127',85,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,1.0000,9.0000,0.4500,9.4500,NULL,NULL,NULL,NULL,9.4500,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:32.000000'),
(13172,'2020-01-05 00:00:00.000000','2020-01-05 00:00:00.000000','00:21:27.507430',86,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.5000,0.0000,10.5000,0.5250,11.0250,NULL,NULL,NULL,NULL,11.0250,NULL,NULL,0,0,0,NULL,4,2,'2020-07-11 22:29:49.000000'),
(13173,'2020-01-05 00:00:00.000000','2020-01-05 00:00:00.000000','00:26:33.698061',87,0,1,2,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,15.7500,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:09:35.000000'),
(13174,'2020-01-05 00:00:00.000000','2020-01-05 00:00:00.000000','00:27:23.048236',88,0,1,2,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,15.7500,NULL,NULL,0,0,0,NULL,3,2,'2020-07-11 22:29:51.000000'),
(13176,'2020-01-05 00:00:00.000000','2020-01-05 00:00:00.000000','00:41:05.249183',89,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:09:38.000000'),
(13177,'2020-01-05 00:00:00.000000','2020-01-05 00:00:00.000000','00:45:05.716141',90,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',40.0000,0.0000,40.0000,2.0000,42.0000,NULL,NULL,NULL,NULL,42.0000,NULL,NULL,0,0,0,NULL,3,1,'2020-07-11 22:29:53.000000'),
(13178,'2020-01-04 00:00:00.000000','2020-01-04 00:00:00.000000','12:52:11.236169',91,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',200.0000,0.0000,200.0000,10.0000,210.0000,NULL,NULL,NULL,NULL,210.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:41.000000'),
(13179,'2020-01-06 00:00:00.000000','2020-01-06 00:00:00.000000','13:04:35.086897',92,NULL,1,2,'A',2,'Cust343','0554307535','',0,2,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,1,0,0,NULL,3,2,'2020-07-11 22:29:55.000000'),
(13180,'2020-01-06 00:00:00.000000','2020-01-06 00:00:00.000000','13:06:37.254595',93,NULL,1,2,'A',1,'Customer 15454','','',0,2,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',125.0000,0.0000,125.0000,6.2500,131.2500,50.0000,0.0000,0.0000,0.0000,131.2500,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:09:44.000000'),
(13181,'2020-01-07 00:00:00.000000','2020-01-07 00:00:00.000000','20:47:18.742942',94,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',110.4762,0.0000,110.4762,5.5238,116.0000,NULL,NULL,NULL,NULL,116.0000,NULL,NULL,0,0,0,NULL,2,1,'2020-07-11 22:29:57.000000'),
(13182,'2020-01-15 00:00:00.000000','2020-01-15 00:00:00.000000','13:17:29.462176',95,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',407.0000,0.0000,407.0000,0.0000,407.0000,NULL,NULL,NULL,NULL,407.0000,NULL,NULL,0,0,0,NULL,2,1,'2020-07-11 22:29:58.000000'),
(13183,'2020-01-14 00:00:00.000000','2020-01-14 00:00:00.000000','12:43:49.472385',96,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',40.0000,0.0000,40.0000,2.0000,42.0000,0.0000,0.0000,0.0000,0.0000,42.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:09:51.000000'),
(1101,'2019-06-23 00:00:00.000000','2019-06-23 00:00:00.000000','18:56:46.736813',3,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,11.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:07:13.000000'),
(1102,'2019-06-23 00:00:00.000000','2019-06-23 00:00:00.000000','18:57:07.580153',4,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',38.1000,0.0000,38.1000,1.9000,40.0000,36.0000,4.0000,0.0000,0.0000,36.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:07:27.000000'),
(1103,'2019-07-03 00:00:00.000000','2019-07-03 00:00:00.000000','15:00:23.402884',5,NULL,1,3,'A',NULL,'916 Cutomer','','',4,1,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',1016.4800,0.0000,1016.4800,50.8200,1067.3000,0.0000,0.0000,0.0000,0.0000,1067.3000,NULL,NULL,0,1,0,0,1,1,'2020-07-18 14:07:33.000000'),
(1104,'2019-07-03 00:00:00.000000','2019-07-03 00:00:00.000000','21:07:33.051789',6,NULL,1,3,'A',NULL,'916 Cutomer','','',4,1,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',20.9500,0.0000,20.9500,1.0500,22.0000,0.0000,0.0000,0.0000,0.0000,22.0000,NULL,NULL,0,1,0,0,1,1,'2020-07-18 14:07:34.000000'),
(1105,'2019-07-04 00:00:00.000000','2019-07-04 00:00:00.000000','11:31:35.191796',7,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',10.4800,0.0000,10.4800,0.5200,11.0000,0.0000,0.0000,0.0000,0.0000,11.0000,NULL,NULL,0,1,0,0,1,1,'2020-07-18 14:07:36.000000'),
(1108,'2019-07-04 00:00:00.000000','2019-07-04 00:00:00.000000','17:56:20.894688',8,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',935.0000,0.0000,935.0000,46.7500,981.7500,NULL,NULL,NULL,NULL,981.7500,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:07:37.000000'),
(1109,'2019-07-04 00:00:00.000000','2019-07-04 00:00:00.000000','18:09:32.553051',9,0,1,3,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,11.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:07:40.000000'),
(1110,'2019-07-04 00:00:00.000000','2019-07-04 00:00:00.000000','18:13:10.511901',10,0,1,3,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',108.5712,0.0000,108.5712,5.4286,113.9998,NULL,NULL,NULL,NULL,113.9998,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:07:41.000000'),
(1112,'2019-07-05 00:00:00.000000','2019-07-05 00:00:00.000000','21:42:13.441171',12,NULL,1,3,'A',1015,'Test Customer','','',4,1,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',20.9500,0.0000,20.9500,1.0500,22.0000,0.0000,10.0000,0.0000,0.0000,12.0000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:07:45.000000'),
(1113,'2019-07-14 00:00:00.000000','2019-07-14 00:00:00.000000','13:31:10.406140',13,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',100.0000,0.0000,100.0000,5.0000,105.0000,0.0000,0.0000,0.0000,0.0000,105.0000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:07:46.000000'),
(1114,'2019-07-16 00:00:00.000000','2019-07-16 00:00:00.000000','14:04:33.777441',14,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',2500.0000,0.0000,2500.0000,125.0000,2625.0000,0.0000,0.0000,0.0000,0.0000,2625.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:07:48.000000'),
(1115,'2019-08-02 00:00:00.000000','2019-08-02 00:00:00.000000','17:35:46.306728',15,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,0.0000,0.0000,0.0000,0.0000,15.7500,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:07:49.000000'),
(1118,'2019-08-02 00:00:00.000000','2019-08-02 00:00:00.000000','18:14:49.030481',16,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,0.0000,0.0000,0.0000,0.0000,15.7500,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:07:51.000000'),
(1119,'2019-08-02 00:00:00.000000','2019-08-02 00:00:00.000000','18:17:06.373089',17,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,0.0000,0.0000,0.0000,0.0000,15.7500,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:07:52.000000'),
(1121,'2019-08-05 00:00:00.000000','2019-08-05 00:00:00.000000','13:37:41.652164',18,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',100.0000,0.0000,100.0000,0.0000,100.0000,NULL,NULL,NULL,NULL,100.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:07:54.000000'),
(1123,'2019-08-05 00:00:00.000000','2019-08-05 00:00:00.000000','14:29:38.223781',19,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',375.0000,0.0000,375.0000,0.0000,375.0000,0.0000,0.0000,0.0000,0.0000,375.0000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:07:55.000000'),
(1124,'2019-08-05 00:00:00.000000','2019-08-05 00:00:00.000000','14:49:33.519909',20,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','fgdtgfhfgh',20.0000,0.0000,20.0000,1.0000,21.0000,0.0000,0.0000,0.0000,0.0000,21.0000,NULL,NULL,0,1,0,0,1,1,'2020-07-18 14:07:57.000000'),
(3125,'2019-08-16 00:00:00.000000','2019-08-16 00:00:00.000000','20:38:29.284824',27,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,0.0000,0.0000,0.0000,0.0000,15.7500,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:08:07.000000'),
(3126,'2019-08-16 00:00:00.000000','2019-08-16 00:00:00.000000','20:39:05.199910',28,0,1,3,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',30.0000,0.0000,30.0000,1.5000,31.5000,NULL,NULL,NULL,NULL,31.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:08:09.000000'),
(4125,'2019-08-18 00:00:00.000000','2019-08-18 00:00:00.000000','12:34:30.831693',29,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',1500.0000,0.0000,1500.0000,0.0000,1500.0000,NULL,NULL,NULL,NULL,1500.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:10.000000'),
(4127,'2019-09-07 00:00:00.000000','2019-09-07 00:00:00.000000','18:55:27.680356',31,NULL,1,3,'A',NULL,'','','',0,2,1,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',50.0000,0.0000,50.0000,2.5000,52.5000,0.0000,0.0000,0.0000,0.0000,52.5000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:08:13.000000'),
(5127,'2019-09-23 00:00:00.000000','2019-09-23 00:00:00.000000','19:59:28.425097',33,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,15.7500,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:15.000000'),
(6127,'2019-10-03 00:00:00.000000','2019-10-03 00:00:00.000000','11:51:10.177949',35,0,1,3,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',25.4762,0.0000,25.4762,1.2738,26.7500,NULL,NULL,NULL,NULL,26.7500,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:08:18.000000'),
(7128,'2019-10-21 00:00:00.000000','2019-10-21 00:00:00.000000','18:26:52.217265',37,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',70.0000,0.0000,70.0000,3.5000,73.5000,0.0000,0.0000,0.0000,0.0000,73.5000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:08:21.000000'),
(9127,'2019-11-05 00:00:00.000000','2019-11-05 00:00:00.000000','16:28:56.230162',40,NULL,1,3,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',119.0500,0.0000,119.0500,5.9500,125.0000,200.0000,0.0000,0.0000,0.0000,125.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:08:26.000000'),
(9130,'2019-11-07 00:00:00.000000','2019-11-07 00:00:00.000000','13:55:02.917532',43,NULL,1,3,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','2 Year Of Warranty from The Date  of Purchase                                                              ',5235.7100,0.0000,5235.7100,254.2900,5490.0000,0.0000,0.0000,0.0000,0.0000,5490.0000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:08:30.000000'),
(9134,'2019-11-11 00:00:00.000000','2019-11-11 00:00:00.000000','15:46:51.922853',47,0,1,3,'',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',150.0000,0.0000,150.0000,0.0000,150.0000,NULL,NULL,NULL,NULL,150.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:08:37.000000'),
(10127,'2019-11-16 00:00:00.000000','2019-11-16 00:00:00.000000','17:22:43.178165',48,0,1,3,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',93.0952,0.0000,93.0952,4.6548,97.7500,NULL,NULL,NULL,NULL,97.7500,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:08:38.000000'),
(12172,'2020-01-01 00:00:00.000000','2020-01-01 00:00:00.000000','18:11:49.189063',80,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',3.5000,0.0000,3.5000,0.1750,3.6750,NULL,NULL,NULL,NULL,3.6750,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:25.000000'),
(12174,'2020-01-02 00:00:00.000000','2020-01-02 00:00:00.000000','18:34:53.807089',82,NULL,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',5.0000,0.0000,5.0000,0.2500,5.2500,0.0000,0.0000,0.0000,0.0000,5.2500,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:09:28.000000'),
(13170,'2020-01-05 00:00:00.000000','2020-01-05 00:00:00.000000','13:28:20.343755',84,NULL,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',5.0000,0.0000,5.0000,0.2500,5.2500,0.0000,0.0000,0.0000,0.0000,5.2500,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:09:31.000000'),
(13172,'2020-01-05 00:00:00.000000','2020-01-05 00:00:00.000000','00:21:27.507430',86,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.5000,0.0000,10.5000,0.5250,11.0250,NULL,NULL,NULL,NULL,11.0250,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:09:34.000000'),
(13174,'2020-01-05 00:00:00.000000','2020-01-05 00:00:00.000000','00:27:23.048236',88,0,1,2,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',15.0000,0.0000,15.0000,0.7500,15.7500,NULL,NULL,NULL,NULL,15.7500,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:09:37.000000'),
(13177,'2020-01-05 00:00:00.000000','2020-01-05 00:00:00.000000','00:45:05.716141',90,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',40.0000,0.0000,40.0000,2.0000,42.0000,NULL,NULL,NULL,NULL,42.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:39.000000'),
(13179,'2020-01-06 00:00:00.000000','2020-01-06 00:00:00.000000','13:04:35.086897',92,NULL,1,2,'A',2,'Cust343','0554307535','',0,2,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:09:43.000000'),
(13181,'2020-01-07 00:00:00.000000','2020-01-07 00:00:00.000000','20:47:18.742942',94,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',110.4762,0.0000,110.4762,5.5238,116.0000,NULL,NULL,NULL,NULL,116.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:47.000000'),
(13182,'2020-01-15 00:00:00.000000','2020-01-15 00:00:00.000000','13:17:29.462176',95,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',407.0000,0.0000,407.0000,0.0000,407.0000,NULL,NULL,NULL,NULL,407.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:09:49.000000'),
(13184,'2020-01-14 00:00:00.000000','2020-01-14 00:00:00.000000','12:47:58.194287',97,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',30.0000,0.0000,30.0000,1.5000,31.5000,0.0000,0.0000,0.0000,0.0000,31.5000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:09:52.000000'),
(13185,'2020-01-29 00:00:00.000000','2020-01-29 00:00:00.000000','19:44:33.729314',98,NULL,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',250.0000,0.0000,250.0000,0.0000,250.0000,0.0000,0.0000,0.0000,0.0000,250.0000,NULL,NULL,1,0,0,0,1,1,'2020-07-18 14:09:54.000000'),
(13186,'2020-01-16 00:00:00.000000','2020-01-16 00:00:00.000000','19:32:31.822351',99,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',14.2900,0.0000,14.2900,0.7100,15.0000,0.0000,0.0000,0.0000,0.0000,15.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:09:55.000000'),
(13187,'2020-01-16 00:00:00.000000','2020-01-16 00:00:00.000000','20:32:30.002660',100,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',71.4300,0.0000,71.4300,3.5700,75.0000,0.0000,0.0000,0.0000,0.0000,75.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:09:57.000000'),
(13188,'2020-01-16 00:00:00.000000','2020-01-16 00:00:00.000000','20:37:22.951546',101,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',71.4300,0.0000,71.4300,3.5700,75.0000,0.0000,0.0000,0.0000,0.0000,75.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:09:59.000000'),
(13190,'2020-01-26 00:00:00.000000','2020-01-26 00:00:00.000000','16:24:58.734050',102,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:10:01.000000'),
(13191,'2020-01-26 00:00:00.000000','2020-01-26 00:00:00.000000','17:39:22.112328',103,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:10:02.000000'),
(13192,'2020-01-26 00:00:00.000000','2020-01-26 00:00:00.000000','17:52:09.773636',104,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',8.5700,0.0000,8.5700,0.4300,9.0000,7.6500,1.3500,0.0000,0.0000,7.6500,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:10:04.000000'),
(13193,'2020-01-27 00:00:00.000000','2020-01-27 00:00:00.000000','15:45:57.270385',105,0,1,2,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',30.9524,0.0000,30.9524,1.5476,32.5000,NULL,NULL,NULL,NULL,32.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:10:05.000000'),
(13196,'2020-01-27 00:00:00.000000','2020-01-27 00:00:00.000000','16:31:51.605495',106,0,1,2,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,11.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:10:06.000000'),
(13197,'2020-01-27 00:00:00.000000','2020-01-27 00:00:00.000000','16:34:33.109409',107,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',1037.9762,0.0000,1037.9762,1.0238,1039.0000,NULL,NULL,NULL,NULL,1039.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:10:08.000000'),
(13198,'2020-01-28 00:00:00.000000','2020-01-28 00:00:00.000000','11:49:30.853623',108,NULL,1,2,'A',NULL,'','','',0,2,1,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',3.8100,0.0000,3.8100,0.1900,4.0000,0.0000,0.0000,0.0000,0.0000,4.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:10:09.000000'),
(13199,'2020-01-28 00:00:00.000000','2020-01-28 00:00:00.000000','13:58:34.041615',109,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',104.2900,0.0000,104.2900,5.2100,109.5000,0.0000,10.0000,0.0000,0.0000,99.5000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:10:12.000000'),
(13201,'2020-01-28 00:00:00.000000','2020-01-28 00:00:00.000000','14:14:32.516809',110,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',100.0000,10.0000,90.0000,4.5000,94.5000,NULL,NULL,NULL,NULL,94.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:10:14.000000'),
(13202,'2020-01-28 00:00:00.000000','2020-01-28 00:00:00.000000','16:55:40.228138',111,NULL,1,2,'A',NULL,'','','',0,3,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',100.0000,10.0000,90.0000,4.5000,94.5000,0.0000,4.5000,0.0000,0.0000,90.0000,NULL,NULL,1,0,0,0,1,3,'2020-07-18 14:10:16.000000'),
(13203,'2020-01-28 00:00:00.000000','2020-01-28 00:00:00.000000','17:45:50.019214',112,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',69.3333,0.0000,69.3333,3.4667,72.8000,NULL,NULL,NULL,NULL,72.8000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:10:18.000000'),
(13204,'2020-01-28 00:00:00.000000','2020-01-28 00:00:00.000000','18:00:02.910835',113,NULL,1,2,'A',1017,'Out Customer','','',0,2,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',100.0000,10.0000,90.0000,4.5000,94.5000,0.0000,0.0000,0.0000,0.0000,94.5000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:10:24.000000'),
(13205,'2020-01-28 00:00:00.000000','2020-01-28 00:00:00.000000','18:56:03.987952',114,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',1.4286,0.0000,1.4286,0.0714,1.5000,NULL,NULL,NULL,NULL,1.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:10:28.000000'),
(13206,'2020-01-29 00:00:00.000000','2020-01-29 00:00:00.000000','13:20:26.612402',115,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:10:36.000000'),
(13208,'2020-01-30 00:00:00.000000','2020-01-30 00:00:00.000000','12:56:17.077035',117,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',4.7600,0.0000,4.7600,0.2400,5.0000,0.0000,0.0000,0.0000,0.0000,5.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:10:39.000000'),
(13209,'2020-01-30 00:00:00.000000','2020-01-30 00:00:00.000000','12:58:30.141671',118,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',45.7100,0.0000,45.7100,2.2900,48.0000,0.0000,0.0000,0.0000,0.0000,48.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:10:48.000000'),
(13210,'2020-01-30 00:00:00.000000','2020-01-30 00:00:00.000000','13:08:49.412593',119,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',14.2857,0.0000,14.2857,0.7143,15.0000,NULL,NULL,NULL,NULL,15.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:10:51.000000'),
(14211,'2020-01-31 00:00:00.000000','2020-01-31 00:00:00.000000','18:00:34.110543',120,NULL,1,2,'A',1,'Customer 15454','','',0,2,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',4.7600,0.0000,4.7600,0.2400,5.0000,0.0000,0.0000,0.0000,0.0000,5.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:10:56.000000'),
(14212,'2020-02-01 00:00:00.000000','2020-02-01 00:00:00.000000','00:37:02.334841',121,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',104.7600,0.0000,104.7600,5.2400,110.0000,0.0000,0.0000,0.0000,0.0000,110.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:11:00.000000'),
(14214,'2020-02-01 00:00:00.000000','2020-02-01 00:00:00.000000','19:20:26.435750',122,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',11.4300,0.0000,11.4300,0.5700,12.0000,0.0000,0.0000,0.0000,0.0000,12.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:11:02.000000'),
(14215,'2020-02-02 00:00:00.000000','2020-02-02 00:00:00.000000','13:02:55.337552',123,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',19.0476,0.0000,19.0476,0.9524,20.0000,NULL,NULL,NULL,NULL,20.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:11:12.000000'),
(15212,'2020-02-03 00:00:00.000000','2020-02-03 00:00:00.000000','22:38:55.216911',124,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,0.0000,0.0000,0.0000,0.0000,10.5000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:11:50.000000'),
(15213,'2020-02-03 00:00:00.000000','2020-02-03 00:00:00.000000','22:52:01.491604',125,NULL,1,2,'A',1016,'Niya','987465265','',0,2,2,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',14.2900,0.0000,14.2900,0.7100,15.0000,0.0000,0.0000,0.0000,0.0000,15.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:11:53.000000'),
(16212,'2020-02-05 00:00:00.000000','2020-02-05 00:00:00.000000','00:09:27.700988',126,0,1,2,'A',1015,'Test Customer','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',95.7143,0.0000,95.7143,4.7857,100.5000,NULL,NULL,NULL,NULL,100.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:11:56.000000'),
(16213,'2020-02-05 00:00:00.000000','2020-02-05 00:00:00.000000','00:25:25.404169',127,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',24.7619,0.0000,24.7619,1.2381,26.0000,NULL,NULL,NULL,NULL,26.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:12:02.000000'),
(16214,'2020-02-05 00:00:00.000000','2020-02-05 00:00:00.000000','00:39:36.183147',128,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:12:13.000000'),
(16215,'2020-02-05 00:00:00.000000','2020-02-05 00:00:00.000000','10:21:45.394348',129,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',20.0000,0.0000,20.0000,1.0000,21.0000,NULL,NULL,NULL,NULL,21.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:12:21.000000'),
(16216,'2020-02-05 00:00:00.000000','2020-02-05 00:00:00.000000','10:25:58.330332',130,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:12:32.000000'),
(16217,'2020-02-05 00:00:00.000000','2020-02-05 00:00:00.000000','10:27:34.914064',131,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',20.0000,0.0000,20.0000,1.0000,21.0000,NULL,NULL,NULL,NULL,21.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:12:38.000000'),
(16218,'2020-02-05 00:00:00.000000','2020-02-05 00:00:00.000000','10:29:45.121624',132,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',20.0000,0.0000,20.0000,1.0000,21.0000,NULL,NULL,NULL,NULL,21.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:12:41.000000'),
(16219,'2020-02-05 00:00:00.000000','2020-02-05 00:00:00.000000','11:00:32.512237',133,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',40.0000,0.0000,40.0000,2.0000,42.0000,NULL,NULL,NULL,NULL,42.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:12:44.000000'),
(16226,'2020-02-05 00:00:00.000000','2020-02-05 00:00:00.000000','14:06:21.466334',134,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',166.6667,0.0000,166.6667,8.3334,175.0001,NULL,NULL,NULL,NULL,175.0001,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:12:49.000000'),
(16228,'2020-02-08 00:00:00.000000','2020-02-08 00:00:00.000000','23:45:11.554802',135,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:12:56.000000'),
(16229,'2020-02-12 00:00:00.000000','2020-02-12 00:00:00.000000','15:36:06.387129',136,NULL,1,2,'A',NULL,'','','',0,2,0,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,0.0000,0.0000,0.0000,0.0000,10.5000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:13:01.000000'),
(16230,'2020-02-12 00:00:00.000000','2020-02-12 00:00:00.000000','18:03:43.692267',137,NULL,1,2,'A',NULL,'','','',0,2,1,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',1069.0500,182.8100,886.2400,44.3100,930.5500,1000.0000,0.0000,0.0000,0.0000,930.5500,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:13:03.000000'),
(16231,'2020-02-13 00:00:00.000000','2020-02-13 00:00:00.000000','16:44:17.739982',138,NULL,1,2,'A',NULL,'','','',0,2,3,NULL,NULL,'',0,'',NULL,NULL,NULL,'','',47.6200,4.7600,42.8600,2.1400,45.0000,35.0000,10.0000,0.0000,0.0000,35.0000,NULL,NULL,1,0,0,0,1,2,'2020-07-18 14:13:07.000000'),
(16235,'2020-02-17 00:00:00.000000','2020-02-17 00:00:00.000000','14:46:28.557308',139,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',30.0000,0.0000,30.0000,1.5000,31.5000,NULL,NULL,NULL,NULL,31.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:13:09.000000'),
(17236,'2020-04-09 00:00:00.000000','2020-04-09 00:00:00.000000','11:09:06.997364',140,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',104.7619,0.0000,104.7619,5.2381,110.0000,NULL,NULL,NULL,NULL,110.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:13:17.000000'),
(17237,'2020-04-09 00:00:00.000000','2020-04-09 00:00:00.000000','11:10:44.467177',141,0,1,2,'A',NULL,'','','',4,1,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',19.0476,0.0000,19.0476,0.9524,20.0000,NULL,NULL,NULL,NULL,20.0000,NULL,NULL,0,0,0,0,1,1,'2020-07-18 14:13:25.000000'),
(17238,'2020-04-09 00:00:00.000000','2020-04-09 00:00:00.000000','15:04:11.438271',142,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',14.7619,0.0000,14.7619,0.7381,15.5000,NULL,NULL,NULL,NULL,15.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:13:31.000000'),
(17245,'2020-04-13 00:00:00.000000','2020-04-13 00:00:00.000000','14:49:41.583358',143,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',28.3356,0.0000,28.3356,1.4168,29.7524,NULL,NULL,NULL,NULL,29.7524,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:13:32.000000'),
(17247,'2020-04-15 00:00:00.000000','2020-04-15 00:00:00.000000','11:38:48.738992',144,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',17.6000,0.0000,17.6000,0.8800,18.4800,NULL,NULL,NULL,NULL,18.4800,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:13:34.000000'),
(17250,'2020-05-01 00:00:00.000000','2020-05-01 00:00:00.000000','14:09:13.828421',145,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',1257.1431,0.0000,1257.1431,62.8571,1320.0002,NULL,NULL,NULL,NULL,1320.0002,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:13:38.000000'),
(17251,'2020-05-01 00:00:00.000000','2020-05-01 00:00:00.000000','14:21:37.591680',146,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',40.0000,0.0000,40.0000,2.0000,42.0000,NULL,NULL,NULL,NULL,42.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:13:43.000000'),
(17252,'2020-05-01 00:00:00.000000','2020-05-01 00:00:00.000000','14:22:17.731828',147,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',70.0000,0.0000,70.0000,3.5000,73.5000,NULL,NULL,NULL,NULL,73.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:13:54.000000'),
(17253,'2020-05-01 00:00:00.000000','2020-05-01 00:00:00.000000','14:23:40.301578',148,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',20.0000,0.0000,20.0000,1.0000,21.0000,NULL,NULL,NULL,NULL,21.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:13:58.000000'),
(17254,'2020-05-01 00:00:00.000000','2020-05-01 00:00:00.000000','15:11:43.719376',149,0,1,2,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',272.3810,0.0000,272.3810,13.6190,286.0000,NULL,NULL,NULL,NULL,286.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:14:00.000000'),
(17255,'2020-05-01 00:00:00.000000','2020-05-01 00:00:00.000000','22:24:03.841028',150,0,1,2,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',817.1430,0.0000,817.1430,40.8572,858.0002,NULL,NULL,NULL,NULL,858.0002,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:14:06.000000'),
(17260,'2020-05-02 00:00:00.000000','2020-05-02 00:00:00.000000','12:44:17.313060',151,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:14:17.000000'),
(18250,'2020-06-12 00:00:00.000000','2020-06-12 00:00:00.000000','23:35:24.370971',152,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',6060.0000,0.0000,6060.0000,303.0000,6363.0000,NULL,NULL,NULL,NULL,6363.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:14:18.000000'),
(19249,'2020-06-13 00:00:00.000000','2020-06-13 00:00:00.000000','19:14:56.534519',153,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',5.6744,0.0000,5.6744,0.2836,5.9580,NULL,NULL,NULL,NULL,5.9580,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:14:24.000000'),
(19250,'2020-06-13 00:00:00.000000','2020-06-13 00:00:00.000000','20:52:17.659561',154,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:14:29.000000'),
(19251,'2020-06-13 00:00:00.000000','2020-06-13 00:00:00.000000','21:20:16.980441',155,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',4.2857,0.0000,4.2857,0.2143,4.5000,NULL,NULL,NULL,NULL,4.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:14:36.000000'),
(20249,'2020-06-21 00:00:00.000000','2020-06-21 00:00:00.000000','16:28:00.718359',156,0,1,2,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',46.0952,0.0000,46.0952,2.3048,48.4000,NULL,NULL,NULL,NULL,48.4000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:14:44.000000'),
(20250,'2020-06-21 00:00:00.000000','2020-06-21 00:00:00.000000','16:33:27.726445',157,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.0000,0.0000,10.0000,0.5000,10.5000,NULL,NULL,NULL,NULL,10.5000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:14:53.000000'),
(20251,'2020-06-25 00:00:00.000000','2020-06-25 00:00:00.000000','14:16:22.941871',158,0,1,2,'A',NULL,'','','',2,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',104.7619,0.0000,104.7619,5.2381,110.0000,NULL,NULL,NULL,NULL,110.0000,NULL,NULL,0,0,0,0,1,2,'2020-07-18 14:14:56.000000'),
(1100,'2019-06-23 00:00:00.000000','2019-06-23 00:00:00.000000','18:32:50.172566',2,0,1,3,'A',NULL,'','','',1,2,0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,'','',10.4762,0.0000,10.4762,0.5238,11.0000,NULL,NULL,NULL,NULL,11.0000,NULL,NULL,0,0,0,NULL,1,2,'2020-07-18 14:07:11.000000');

/*Table structure for table `sales_master_temp` */

DROP TABLE IF EXISTS `sales_master_temp`;

CREATE TABLE `sales_master_temp` (
  `Sales_MasterTemp_Id` int(11) NOT NULL,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Delivery_Date` datetime(6) DEFAULT NULL,
  `Invoice_Time` time(6) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Serial_No` int(11) DEFAULT NULL,
  `Branch_Id` int(11) DEFAULT NULL,
  `Counter_Id` int(11) DEFAULT NULL,
  `Counter_Name` varchar(50) DEFAULT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  `Customer_Name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `IsCash` int(11) DEFAULT NULL,
  `Bank_Id` int(11) DEFAULT NULL,
  `Card_Id` int(11) DEFAULT NULL,
  `Card_No` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Vehicle_Id` int(11) DEFAULT NULL,
  `Destination` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  `Quotation_Id` int(11) DEFAULT NULL,
  `Sales_Order_Id` int(11) DEFAULT NULL,
  `Remark` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TermsAndConditions` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Total_Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Net_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Amount` decimal(18,4) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Freight_Charge` decimal(18,4) DEFAULT NULL,
  `Round_Off` decimal(18,4) DEFAULT NULL,
  `Grand_Total` decimal(18,4) DEFAULT NULL,
  `MultiCash` decimal(18,4) DEFAULT NULL,
  `MultiCard` decimal(18,4) DEFAULT NULL,
  `Is_Saved` tinyint(1) NOT NULL,
  `Is_Cancelled` tinyint(1) DEFAULT NULL,
  `Is_Sync` tinyint(1) DEFAULT NULL,
  `Is_Hold` tinyint(1) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Sales_MasterTemp_Id`),
  KEY `FK_Sales_MasterTemp_Bank` (`Bank_Id`),
  KEY `FK_Sales_MasterTemp_Counter` (`Counter_Id`),
  KEY `FK_Sales_MasterTemp_Customer` (`Customer_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `sales_master_temp` */

/*Table structure for table `salesorder_detail` */

DROP TABLE IF EXISTS `salesorder_detail`;

CREATE TABLE `salesorder_detail` (
  `SalesOrder_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `SalesOrder_Master_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Quantity` decimal(18,4) DEFAULT NULL,
  `Extra` decimal(18,4) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Convertion_Factor` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(18,4) DEFAULT NULL,
  `SalesOrder_Rate` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Rate_Type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT NULL,
  `Net_Amount` decimal(18,4) DEFAULT NULL,
  `Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Amount` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Inclusive` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Exclusive` decimal(18,4) DEFAULT NULL,
  `SGST_Percentage` decimal(18,4) DEFAULT NULL,
  `CGST_Percentage` decimal(18,4) DEFAULT NULL,
  `IGST_Percentage` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`SalesOrder_Detail_Id`),
  KEY `FK_SalesOrder_Detail_Product_Detail` (`Product_Detail_Id`),
  KEY `FK_SalesOrder_Detail_Product_Master` (`Product_Id`),
  KEY `FK_SalesOrder_Detail_SalesOrder_Master` (`SalesOrder_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `salesorder_detail` */

/*Table structure for table `salesorder_master` */

DROP TABLE IF EXISTS `salesorder_master`;

CREATE TABLE `salesorder_master` (
  `SalesOrder_Master_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Delivery_Date` datetime(6) DEFAULT NULL,
  `Invoice_Time` time(6) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Serial_No` int(11) DEFAULT NULL,
  `Branch_Id` int(11) DEFAULT NULL,
  `Counter_Id` int(11) DEFAULT NULL,
  `Counter_Name` varchar(50) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Customer_Name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `IsCash` int(11) DEFAULT NULL,
  `Card_Id` int(11) DEFAULT NULL,
  `Card_No` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  `Quotation_Id` int(11) DEFAULT NULL,
  `Sales_Master_Id` int(11) DEFAULT NULL,
  `Remark` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TermsAndConditions` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Total_Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Net_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Amount` decimal(18,4) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Freight_Charge` decimal(18,4) DEFAULT NULL,
  `Round_Off` decimal(18,4) DEFAULT NULL,
  `Grand_Total` decimal(18,4) DEFAULT NULL,
  `Is_Saved` tinyint(1) DEFAULT NULL,
  `Is_Cancelled` tinyint(1) DEFAULT NULL,
  `Is_Sync` tinyint(1) DEFAULT NULL,
  `Is_Hold` tinyint(1) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`SalesOrder_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `salesorder_master` */

/*Table structure for table `salesreturn_detail` */

DROP TABLE IF EXISTS `salesreturn_detail`;

CREATE TABLE `salesreturn_detail` (
  `SalesReturn_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `SalesReturn_Master_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Quantity` decimal(18,4) DEFAULT NULL,
  `Extra` decimal(18,4) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Convertion_Factor` decimal(18,4) DEFAULT NULL,
  `Tax_Percentage` decimal(18,4) DEFAULT NULL,
  `TaxInclusive` tinyint(1) DEFAULT NULL,
  `SalesReturn_Rate` decimal(18,4) DEFAULT NULL,
  `MRP` decimal(18,4) DEFAULT NULL,
  `Rate_Type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Discount` decimal(18,4) DEFAULT NULL,
  `Net_Amount` decimal(18,4) DEFAULT NULL,
  `Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Amount` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Inclusive` decimal(18,4) DEFAULT NULL,
  `Unit_Price_Exclusive` decimal(18,4) DEFAULT NULL,
  `SGST_Percentage` decimal(18,4) DEFAULT NULL,
  `CGST_Percentage` decimal(18,4) DEFAULT NULL,
  `IGST_Percentage` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`SalesReturn_Detail_Id`),
  KEY `FK_SalesReturn_Detail_Product_Detail` (`Product_Detail_Id`),
  KEY `FK_SalesReturn_Detail_Product_Master` (`Product_Id`),
  KEY `FK_SalesReturn_Detail_SalesReturn_Master` (`SalesReturn_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `salesreturn_detail` */

/*Table structure for table `salesreturn_master` */

DROP TABLE IF EXISTS `salesreturn_master`;

CREATE TABLE `salesreturn_master` (
  `SalesReturn_Master_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Invoice_Date` datetime(6) DEFAULT NULL,
  `Delivery_Date` datetime(6) DEFAULT NULL,
  `Invoice_Time` time(6) DEFAULT NULL,
  `Invoice_No` int(11) DEFAULT NULL,
  `Serial_No` int(11) DEFAULT NULL,
  `Branch_Id` int(11) DEFAULT NULL,
  `Counter_Id` int(11) DEFAULT NULL,
  `Counter_Name` varchar(50) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Customer_Name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `IsCash` int(11) DEFAULT NULL,
  `Card_Id` int(11) DEFAULT NULL,
  `Card_No` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Vehicle_Id` int(11) DEFAULT NULL,
  `Destination` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  `Sales_Master_Id` int(11) DEFAULT NULL,
  `Remark` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TermsAndConditions` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Total_Gross_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Net_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Tax_Amount` decimal(18,4) DEFAULT NULL,
  `Total_Amount` decimal(18,4) DEFAULT NULL,
  `Paid_Amount` decimal(18,4) DEFAULT NULL,
  `Discount_Amount` decimal(18,4) DEFAULT NULL,
  `Freight_Charge` decimal(18,4) DEFAULT NULL,
  `Round_Off` decimal(18,4) DEFAULT NULL,
  `Grand_Total` decimal(18,4) DEFAULT NULL,
  `Is_Saved` tinyint(1) DEFAULT NULL,
  `Is_Cancelled` tinyint(1) DEFAULT NULL,
  `Is_Sync` tinyint(1) DEFAULT NULL,
  `Is_Hold` tinyint(1) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`SalesReturn_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `salesreturn_master` */

/*Table structure for table `shortcut` */

DROP TABLE IF EXISTS `shortcut`;

CREATE TABLE `shortcut` (
  `Shortcut_Id` int(11) NOT NULL,
  `Window_Id` int(11) DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Modifier_Key` char(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Shortcut_Key` char(10) NOT NULL,
  PRIMARY KEY (`Shortcut_Id`),
  UNIQUE KEY `IX_Shortcut` (`Window_Id`,`Shortcut_Key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `shortcut` */

/*Table structure for table `size` */

DROP TABLE IF EXISTS `size`;

CREATE TABLE `size` (
  `Size_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Size_Code` varchar(50) DEFAULT NULL,
  `Size_Name` varchar(100) NOT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Size_ID`),
  UNIQUE KEY `IX_Size` (`Size_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `size` */

/*Table structure for table `stock_adj_detail` */

DROP TABLE IF EXISTS `stock_adj_detail`;

CREATE TABLE `stock_adj_detail` (
  `Stock_Adjustment_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Stock_Adjustment_Master_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Product_Detail_Id` int(11) DEFAULT NULL,
  `Adjust_Quantity_Add` decimal(18,3) DEFAULT NULL,
  `Adjust_Quantity_Minus` decimal(18,3) DEFAULT NULL,
  `Base_Unit_Id` int(11) DEFAULT NULL,
  `Unit_Detail_Id` int(11) DEFAULT NULL,
  `Is_Primary_Unit` tinyint(1) DEFAULT NULL,
  `Convertion_Factor` decimal(18,3) DEFAULT NULL,
  `Purchase_Rate` decimal(18,4) DEFAULT NULL,
  `Purchase_Cost` decimal(18,4) DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL,
  `Narration` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Stock_Adjustment_Detail_Id`),
  KEY `FK_Stock_Adj_Detail_Product_Detail` (`Product_Detail_Id`),
  KEY `FK_Stock_Adj_Detail_Product_Master` (`Product_Id`),
  KEY `FK_Stock_Adj_Detail_Stock_Adj_Master` (`Stock_Adjustment_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `stock_adj_detail` */

/*Table structure for table `stock_adj_master` */

DROP TABLE IF EXISTS `stock_adj_master`;

CREATE TABLE `stock_adj_master` (
  `Stock_Adjustment_Master_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Voucher_No` int(11) DEFAULT NULL,
  `Transaction_Date` date DEFAULT NULL,
  `Transaction_Time` time(6) DEFAULT NULL,
  `Salesman_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `IsSaved` tinyint(1) DEFAULT NULL,
  `Iscancelled` tinyint(1) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Stock_Adjustment_Master_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `stock_adj_master` */

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `Store_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Store_Name` varchar(50) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` date DEFAULT NULL,
  PRIMARY KEY (`Store_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `store` */

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `Supplier_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Supplier_Group_ID` int(11) NOT NULL,
  `Supplier_Code` varchar(20) DEFAULT NULL,
  `Supplier_Name` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Registration_No` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Mobile` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Gender` int(11) DEFAULT NULL,
  `Manager_Name` varchar(50) DEFAULT NULL,
  `Manager_Phone` varchar(50) DEFAULT NULL,
  `WebSite` varchar(50) DEFAULT NULL,
  `Bank_Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Account_No` varchar(50) DEFAULT '0',
  `IFSC_Code` varchar(50) DEFAULT NULL,
  `Branch` varchar(100) DEFAULT NULL,
  `Swift` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `AdharCard_No` varchar(50) DEFAULT NULL,
  `TRN_No` varchar(50) DEFAULT NULL,
  `Location` int(11) DEFAULT NULL,
  `Allow_Credit` tinyint(1) DEFAULT NULL,
  `Credit_Limit` decimal(18,4) DEFAULT 0.0000,
  `Credit_Duration` bigint(20) DEFAULT 0,
  `Email` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `OB_Debit` decimal(18,4) DEFAULT NULL,
  `OB_Credit` decimal(18,4) DEFAULT NULL,
  `Image64` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Nationality` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Category_Id` int(11) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  `Supplier_Type` int(11) DEFAULT NULL,
  `Commission_Percentage` decimal(18,2) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Supplier_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `supplier` */

/*Table structure for table `supplierledger_detail` */

DROP TABLE IF EXISTS `supplierledger_detail`;

CREATE TABLE `supplierledger_detail` (
  `SupplierLedger_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Transaction_Date` date DEFAULT NULL,
  `Transaction_Time` time(6) DEFAULT NULL,
  `Auto_Receipt_No` int(11) DEFAULT NULL,
  `Receipt_No` int(11) DEFAULT NULL,
  `Particular` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Supplier_Id` int(11) NOT NULL,
  `Debit` decimal(18,4) DEFAULT NULL,
  `Credit` decimal(18,4) DEFAULT NULL,
  `Kot_Master_ID` int(11) DEFAULT NULL,
  `Kot_Parcel_ID` int(11) DEFAULT NULL,
  `Kot_Delivery_ID` int(11) DEFAULT NULL,
  `Purchase_Master_Id` int(11) DEFAULT NULL,
  `PurchaseReturn_Master_Id` int(11) DEFAULT NULL,
  `BankLedger_Detail_Id` int(11) DEFAULT NULL,
  `Is_CreditNote` tinyint(1) DEFAULT NULL,
  `Is_DebitNote` tinyint(1) DEFAULT NULL,
  `Payment_Mode` int(11) DEFAULT NULL,
  `Bank_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`SupplierLedger_Detail_Id`),
  KEY `FK_SupplierLedger_Detail_Supplier` (`Supplier_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `supplierledger_detail` */

/*Table structure for table `table_master` */

DROP TABLE IF EXISTS `table_master`;

CREATE TABLE `table_master` (
  `Table_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Table_Code` varchar(50) DEFAULT NULL,
  `Table_Name` varchar(50) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Table_ID`),
  UNIQUE KEY `IX_Table_Master` (`Table_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `table_master` */

/*Table structure for table `tax` */

DROP TABLE IF EXISTS `tax`;

CREATE TABLE `tax` (
  `Tax_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tax_Percentage` decimal(18,2) DEFAULT NULL,
  `CGST` decimal(18,2) DEFAULT NULL,
  `SGST` decimal(18,2) DEFAULT NULL,
  `IGST` decimal(18,2) DEFAULT NULL,
  `CESS` decimal(18,2) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Tax_Id`),
  UNIQUE KEY `IX_Tax_Percentage` (`Tax_Percentage`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tax` */

/*Table structure for table `tbl_opening_denomination` */

DROP TABLE IF EXISTS `tbl_opening_denomination`;

CREATE TABLE `tbl_opening_denomination` (
  `Denomination_Master_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Transaction_Date` datetime(6) DEFAULT NULL,
  `TwoPointFive` decimal(18,2) DEFAULT NULL,
  `FivePointZero` decimal(18,2) DEFAULT NULL,
  `One` decimal(18,2) DEFAULT NULL,
  `Five` decimal(18,2) DEFAULT NULL,
  `Ten` decimal(18,2) DEFAULT NULL,
  `Twenteen` decimal(18,2) DEFAULT NULL,
  `fifty` decimal(18,2) DEFAULT NULL,
  `Hundred` decimal(18,2) DEFAULT NULL,
  `TwoHundred` decimal(18,2) DEFAULT NULL,
  `FiveHundred` decimal(18,2) DEFAULT NULL,
  `Thousand` decimal(18,2) DEFAULT NULL,
  `Opening_Total` decimal(18,4) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Is_Closed` tinyint(1) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Denomination_Master_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tbl_opening_denomination` */

/*Table structure for table `tbl_receipt_denomination` */

DROP TABLE IF EXISTS `tbl_receipt_denomination`;

CREATE TABLE `tbl_receipt_denomination` (
  `Receipt_Denomination_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Denomination_Master_ID` int(11) NOT NULL,
  `Transaction_Date` datetime(6) DEFAULT NULL,
  `TwoPointFive` decimal(18,2) DEFAULT NULL,
  `FivePointZero` decimal(18,2) DEFAULT NULL,
  `One` decimal(18,2) DEFAULT NULL,
  `Five` decimal(18,2) DEFAULT NULL,
  `Ten` decimal(18,2) DEFAULT NULL,
  `Twenteen` decimal(18,2) DEFAULT NULL,
  `fifty` decimal(18,2) DEFAULT NULL,
  `Hundred` decimal(18,2) DEFAULT NULL,
  `TwoHundred` decimal(18,2) DEFAULT NULL,
  `FiveHundred` decimal(18,2) DEFAULT NULL,
  `Thousand` decimal(18,2) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Is_Closed` tinyint(1) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Receipt_Denomination_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tbl_receipt_denomination` */

/*Table structure for table `tbl_transfer_denomination` */

DROP TABLE IF EXISTS `tbl_transfer_denomination`;

CREATE TABLE `tbl_transfer_denomination` (
  `Transfer_Denomination_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Denomination_Master_ID` int(11) NOT NULL,
  `Transaction_Date` datetime(6) DEFAULT NULL,
  `TwoPointFive` decimal(18,2) DEFAULT NULL,
  `FivePointZero` decimal(18,2) DEFAULT NULL,
  `One` decimal(18,2) DEFAULT NULL,
  `Five` decimal(18,2) DEFAULT NULL,
  `Ten` decimal(18,2) DEFAULT NULL,
  `Twenteen` decimal(18,2) DEFAULT NULL,
  `fifty` decimal(18,2) DEFAULT NULL,
  `Hundred` decimal(18,2) DEFAULT NULL,
  `TwoHundred` decimal(18,2) DEFAULT NULL,
  `FiveHundred` decimal(18,2) DEFAULT NULL,
  `Thousand` decimal(18,2) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Is_Closed` tinyint(1) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Transfer_Denomination_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tbl_transfer_denomination` */

/*Table structure for table `tblexpenceentry` */

DROP TABLE IF EXISTS `tblexpenceentry`;

CREATE TABLE `tblexpenceentry` (
  `Expence_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Transaction_Date` datetime(6) DEFAULT NULL,
  `Supplier_ID` int(11) DEFAULT NULL,
  `TRN_NO` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Bill_NO` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Particular` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Amount` decimal(18,4) DEFAULT NULL,
  `VAT_Amount` decimal(18,4) DEFAULT NULL,
  `Total` decimal(18,4) DEFAULT NULL,
  `Purchase_Master_ID` int(11) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Expence_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tblexpenceentry` */

/*Table structure for table `temp_product` */

DROP TABLE IF EXISTS `temp_product`;

CREATE TABLE `temp_product` (
  `Temp_Product_Id` int(11) NOT NULL,
  `Barcode` bigint(20) DEFAULT NULL,
  `Product_Name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Brand_Id` int(11) DEFAULT NULL,
  `Category_Id` int(11) DEFAULT NULL,
  `Cost` decimal(18,4) DEFAULT NULL,
  `Rate` decimal(18,4) DEFAULT NULL,
  `Unit_Id` int(11) DEFAULT NULL,
  `Stock` decimal(18,3) DEFAULT NULL,
  PRIMARY KEY (`Temp_Product_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `temp_product` */

/*Table structure for table `unit` */

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `Unit_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Unit_Name` varchar(20) DEFAULT NULL,
  `Unit_Description` varchar(50) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Unit_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `unit` */

/*Table structure for table `unit_detail` */

DROP TABLE IF EXISTS `unit_detail`;

CREATE TABLE `unit_detail` (
  `Unit_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Id` int(11) DEFAULT NULL,
  `Unit_Id` int(11) DEFAULT NULL,
  `Convertion_Factor` decimal(18,2) DEFAULT NULL,
  `Primary_Unit_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Unit_Detail_Id`),
  KEY `FK_Unit_Detail_Product_Master` (`Product_Id`),
  KEY `FK_Unit_Detail_Unit` (`Unit_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `unit_detail` */

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `Role_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Role_Name` varchar(50) DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Role_Id`),
  UNIQUE KEY `IX_User_Role` (`Role_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `user_role` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_Code` varchar(50) DEFAULT NULL,
  `User_Name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Password` longtext DEFAULT NULL,
  `User_Role` int(11) DEFAULT NULL,
  `Image64` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  `Acc_Password` longtext DEFAULT NULL,
  `MobPassword` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `FK_User_User_Role` (`User_Role`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `users` */

/*Table structure for table `vehicle` */

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `Vehicle_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_No` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Vehicle_Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Driver_Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `RC_Details` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Pollution_Expiry_Date` date DEFAULT NULL,
  `Insurance_Date` date DEFAULT NULL,
  `Last_Maintenance_Date` date DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `Modified_By` int(11) DEFAULT NULL,
  `Modified_Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Vehicle_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `vehicle` */

/*Table structure for table `waiter_master` */

DROP TABLE IF EXISTS `waiter_master`;

CREATE TABLE `waiter_master` (
  `Waiter_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Waiter_Code` varchar(50) DEFAULT NULL,
  `Waiter_Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Last_Modified_By` int(11) DEFAULT NULL,
  `Last_Modified_Date` datetime(6) DEFAULT NULL,
  `Ref_User_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Waiter_ID`),
  UNIQUE KEY `IX_Waiter_Master` (`Waiter_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `waiter_master` */

/*Table structure for table `window` */

DROP TABLE IF EXISTS `window`;

CREATE TABLE `window` (
  `Window_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Window_Name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Window_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `window` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
