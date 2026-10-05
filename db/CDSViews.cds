namespace dhaya.cds;
using { dhaya.db.master,dhaya.db.transaction } from './datamodel';

context CDSViews {
    define view ![POWorkList] as 
        select from transaction.purchaseOrder{
        key PO_ID as ![purchaseOrderId],
        key ITEMS.PO_ITEM_POS as ![ItemPosition],
        PARTNER_GUID.BP_ID as ![PartnerId],
        PARTNER_GUID.Company_name as ![Company_name],
        GROSS_AMOUNT as ![GrossAmount],
        NET_AMOUNT as ![NetAmount],
        TAX_AMOUNT as ![TaxAmount],
        CURRENCY as ![CurrencyCode],
        OVERALL_STATUS as ![OverAllStatus],
        ITEMS.PRODUCT_GUID.PRODUCT_ID as ![ProductId],
        ITEMS.PRODUCT_GUID.DESCRIPTION as ![Descritpion],
        PARTNER_GUID.Address_GUID.city as ![City],
        PARTNER_GUID.Address_GUID.Country as ![Country]
    }
    define view![ProductValueHelp] as
        select from master.product{
            @EndUserText.lable:[
                {
                    language: 'En',
                    Text: 'ProductId'
                },
                {
                    language: 'DE',
                    Text: 'Produkt Id'
                }
            ]
            PRODUCT_ID as ![ProductId],
             @EndUserText.lable:[
                {
                    language: 'En',
                    Text: 'Description'
                },
                {
                    language: 'DE',
                    Text: 'Product Description'
                }
            ]

            DESCRIPTION as ![Description],

        }
        Define view ![ItemView] as
        select from transaction.purchaseOrderItems{
            key PARTNER_KEY.PARTNER_GUID.node_key as ![CustomerID],
            key PRODUCT_GUID.node_key as ![ProductId],
            CURRENCY as ![CurrencyCode],
            GROSS_AMOUNT as ![GrossAmount],
            TAX_AMOUNT as ![TAX_AMOUNT],
            NET_AMOUNT as ![NetAmount],
            PARTNER_KEY.OVERALL_STATUS as ![Status],


        }
        define view ![ProductView] as select from master.product
        //mixin is for the loose Coupling
        //when the call is happen it will load unless it won't
        mixin{
            //view on view
            PO_ORDER: Association to many ItemView on PO_ORDER.ProductId =$projection.ProductId
        } into {
            node_key as ![ProductId],
            DESCRIPTION as ![Description],
            CATEGORY as ![category],
            PRICE as ![Price],
            SUPPLIER_GUID.BP_ID as ![SupplierID],
            SUPPLIER_GUID.Company_name as ![CompanyName],
            SUPPLIER_GUID.Address_GUID.Country as ![Country],
            //Exposed association -@runtime we load data on-demand
            PO_ORDER as ![To_Items]
        };

        define view CProductValuesView as 
            Select from ProductView{
                ProductId,
                Country,
                round(sum(To_Items.GrossAmount),2) as ![Total_Amount],
                To_Items.CurrencyCode as ![CurrencyCode],
            }group by ProductId,
            Country,To_Items. CurrencyCode
            


}
