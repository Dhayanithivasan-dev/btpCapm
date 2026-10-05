namespace dhaya.db;
using {dhaya.common as common} from './common';
using {cuid} from '@sap/cds/common';
context master{
    //foreign key table -Address_GUID
    entity businessparter{
        key node_key:common.guid @(title: '{i18n>PO_ITEM_KEY}');
        BP_ROLE:String(32);
        BP_ID : String(32) @(title: '{i18n>BP_ID}');
        Company_name : String(32) @(title: '{i18n>COMPANY_NAME}');
        Email_Address : String(32) @(title: '{i18n>EMAIL_ADD}');
        Phone_number : String(10) @(title: '{i18n>PHONE_NUMBER}');
        Fax_number: String(32);
        Web_address: String(32);
        //column name = Address_GUID_NODE_KEY
        Address_GUID :Association to one address;
    }
    entity address{
        key node_key: common.guid;
        city: String(44);
        postal_code: String(6);
        Street : String(32);
        Building: String(32);
        Country : String(32);
        Address_type:String(32);
        Lattitude : String(32);
        Longitude : String(32);
        businessparter : Association to one businessparter on
                         businessparter.Address_GUID = $self   
    }
    entity employee : cuid{
     // key id : String(32);
        nameFirst : String(256);
        
        nameMiddle : String(256);
        nameLast : String(256);
        type : String(10);
        gender : String(2);
        sex : common.gender;
        language: String(10);
        PhoneNumber: common.PhoneNumber;
        
        email : common.email;
        loginName: String(12);
        Currency:common.Currency;
        SalaryAmount: common.Money;
    };

    //master data of the Product
    entity product{
        key node_key : common.guid;
        PRODUCT_ID : String(32);
        TYPE_CODE : String(10);
        CATEGORY : String(4);
        DESCRIPTION : String(255);
        SUPPLIER_GUID : Association to one master.businessparter;
        TAX_TARRIF_CODE : Integer;
        WEIGHT_MEASURE : String(2);
        WEIGHT_UNIT : String(2);
        CURRENCY_CODE : String(2);
        PRICE : Decimal(10, 2);
        WIDTH:Decimal(2, 2);
        HEIGHT:Decimal(2, 2);
        DEPTH: Decimal(4, 2);
    }
}
context transaction {
    entity purchaseOrder :  common.Amount,cuid{

       //key NODE_KEY : common.guid;
        PO_ID:String(32) @(title:'{i18n>PO_ID}');
        PARTNER_GUID : Association to master.businessparter;
        LIFECYCLE_STATUS:String(32);
        OVERALL_STATUS : String(32);
        NOTE : String(32);
        ITEMS: Association to  many purchaseOrderItems on ITEMS.PARTNER_KEY=$self;

    }

       entity purchaseOrderItems :common.Amount,cuid{

     // key NODE_KEY : common.guid;
        PARTNER_KEY : Association to purchaseOrder;
       //         on PARTNER_KEY.NODE_KEY = $self.NODE_KEY;
        PO_ITEM_POS:Integer;
        PRODUCT_GUID : Association to master.product;
        LIFECYCLE_STATUS:String(32);
        OVERALL_STATUS : String(32);
        NOTE : String(32);

    }
    
}