using CatalogService as service from '../../srv/CatalogService';
annotate service.PurchaseOrderSet with @(
    UI.SelectionFields: [
        PO_ID,
        PARTNER_GUID.Company_name,
        PARTNER_GUID.Address_GUID.Country,
        GROSS_AMOUNT,
        OVERALL_STATUS
    ],
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
             $Type : 'UI.DataField',
            Value : NOTE,
        },
        {
             $Type : 'UI.DataField',
            Value : PARTNER_GUID.Company_name,    
        },
        {
             $Type : 'UI.DataField',
            Value : PARTNER_GUID.Address_GUID.Country,           
        },

        {
             $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,          
        },

        {
             $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.boost',  
            Label : 'boost',
            Inline : true,        
        },

        {
             $Type : 'UI.DataField',
            Value : OVERALL_STATUS,            
        },        
    ],

     UI.HeaderInfo: {
        TypeName : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title : {Value: PO_ID},
        Description : {Value: PARTNER_GUID.Company_name},
        ImageUrl : 'data:image/webp;base64,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'
    },
    //Add tab strips in the Second page (Facets) - object page
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label : 'General Information',
            Facets:[
                {   
                    Label : 'Basic Info',
                    $Type : 'UI.ReferenceFacet',
                    Target : '@UI.Identification',
                },
                {   
                    Label : 'Pricing Details',
                    $Type : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#test1',
                },
                {   
                    Label : 'Aditional Data',
                    $Type : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#test2',
                },
                {   
                    Label : 'Items Data',
                    $Type : 'UI.ReferenceFacet',
                    Target : 'ITEMS/@UI.LineItem', 
                },



            ],
        },
    ],

    //default block which is always one -Identification block
    //contains group of fields
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
            Label : 'Purchase Order ID'

        },
        {
            $Type : 'UI.DataField',
            Value :  PARTNER_GUID_node_key,
            Label : 'Business Partner'
        },
        {
            $Type : 'UI.DataField',
            Value : NOTE,
            Label : 'Note'

        },
    ],
    //FieldGroup block that can be multiple and have many fields
    UI.FieldGroup #test1: {
       
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
                Label : 'Gross Amount',
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
                Label : 'Net Amount',

            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
                Label : 'Tax Amount',
            },
        ],

    },
    //FieldGroup for the Status Data
    UI.FieldGroup #test2: {
        
        Data : [
            {
                $Type : 'UI.DataField',
                Value : OverallStatus,
                 Label : 'Overall Status',
                Criticality : Status,
            },
            {
                $Type : 'UI.DataField',
                Value : LifeCycleStatus,
                Label : 'Lifecycle Status',
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY,
                Label : 'Currency',
            },

        ]
    }


); 

annotate service.PurchaseItemsSet with @(
    //How should ONE record look at the top of its Object Page?
    UI.HeaderInfo:{
        TypeName : 'Purchase Order Item',
        TypeNamePlural : 'Purchase Order Items',
        Title : {Value : PO_ITEM_POS},  
        Description : {Value: PRODUCT_GUID.DESCRIPTION}

    },
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
            Label : 'Item Position'
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DESCRIPTION,
            Label : 'Product'
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
            Label : 'Gross Amount'
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
            Label : 'Net Amount'
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
            Label : 'Tax Amount'
        },
        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS,
            Label : 'Status'
        },
        {
            $Type : 'UI.DataField',
            Value : Lifecycle,
            Label : 'Lifecycle Status'
        },
        {
            $Type : 'UI.DataField',
            Value : NOTE,
            Label : 'Note'
        }
    ],

    UI.Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item Details',
            Target : '@UI.Identification',
        }
    ], 
    UI.Identification:[

        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
            Label : 'PO Item Position'
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID,
            Label : 'Product guid node key'
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
            Label : 'Gross Amount'
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
            Label : 'Net Amount'
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
            Label : 'Tax Amount'
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY,
            Label : 'Currency'
        },

    ]
);

/*

//anotate a field to get its meingful text


//anotate a field to get its meingful text
annotate service.PurchaseOrderSet with{
    @Common.Text : OverallStatus OVERALL_STATUS;
    @Common.Text : NOTE
    PO_ID; 
    @Common.Text: PARTNER_GUID.Company_name
    @ValueList.entity : BusinessPartnerSet
   // @Common : {TextArrangement : #TextOnly}
    PARTNER_GUID;

} ;
//anotate a field to get its meingful text
annotate service.PurchaseItemsSet with{
   // @Common.Text : OverallStatus OVERALL_STATUS;
    
    @Common.Text: PARTNER_GUID.Description
    @ValueList.entity : ProductSet
   // @Common : {TextArrangement : #TextOnly}
    PRODUCT_GUID;

    } ; 
*/
annotate service.PurchaseOrderSet with {
    PARTNER_GUID @(
        Common.Text : PARTNER_GUID.Company_name,
        ValueList.entity : 'BusinessPartnerSet'
    );
};
    
//Design the valuehelp in CAPM for the Partner Guid and Product Guid
@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(
    UI.Identification:[
        {
            $Type: 'UI.DataField',
            Value : Company_name,   
        }
    ]
);
//Design the valuehelp in CAPM for the Partner Guid and Product Guid
@cds.odata.valuelist
annotate service.ProductSet with @(
    UI.Identification:[
        {
            $Type: 'UI.DataField',
            Value : DESCRIPTION,
        }
    ]
);
