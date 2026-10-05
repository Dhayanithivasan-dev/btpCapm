//Consume reference of my db table 
using{dhaya.db.master,dhaya.db.transaction} from '../db/datamodel'; 

service CatalogService @(path: 'CatalogService', requires: 'authenticated-user') {
    //Entity - representation of an endpoint of the data to perform the cridq operations

  entity EmployeeSet @( 
                          restrict:[
                            {grant : ['READ'], to :'Viewer',
                            //row level security 
                            where :'loginName = $user.loginName'},
                            {grant : ['WRITE','DELETE'], to :'Editor'},
                          ])as projection on master.employee;
  entity ProductSet as projection on master.product;
  entity BusinessPartnerSet as projection on master.businessparter;
  entity AddressSet as projection on master.address;
  //@readonly
 @Capabilities: { Deletable: false }
 @readonly
entity PurchaseOrderSet @( 
                          restrict:[
                            {grant : ['READ'], to :'Viewer'},
                            {grant : ['WRITE','DELETE'], to :'Editor'},
                          ],
                          odata.draft.enabled:true,
                          Common.DefaultValuesFunction: 'getDefaultValue')as projection on transaction.purchaseOrder {
    *, 
    case OVERALL_STATUS
        when 'P' then 'Pending'
        when 'A' then 'Approved'
        when 'X' then 'Rejected'
        when 'D' then 'Delivered'
        else 'Unknown'
    end as OverallStatus : String(10),

    case OVERALL_STATUS
        when 'P' then 2
        when 'A' then 3
        when 'X' then 1
        when 'D' then 3
        else 0
    end as Status : Integer
}
  actions{
    //Side Effects- a trigger to my action that leads to change of the field value data
    //this force the framework to make the getcall after the action is triggered to load the data
    // the system will pass po primary key -Node key automaticalyy to input
    @cds.odata.bindingparameter.name:'_dhaya'
    @Common.SideEffects:{
      TargetProperties:['_dhaya/GROSS_AMOUNT']
    }
      action boost() returns PurchaseOrderSet
  };
  entity PurchaseItemsSet as projection on transaction.purchaseOrderItems;


//noninstance bound because they are not connected to any entity
  function getLargestOrder() returns array of PurchaseOrderSet;



 

}