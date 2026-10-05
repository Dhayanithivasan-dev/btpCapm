const cds = require('@sap/cds')

module.exports = class CatalogService extends cds.ApplicationService { init() {

  const { EmployeeSet, ProductSet, BusinessPartnerSet, AddressSet, PurchaseOrderSet, PurchaseItemsSet } = cds.entities('CatalogService')

  this.before (['CREATE', 'UPDATE'], EmployeeSet, async (req) => {
    console.log('Before CREATE/UPDATE EmployeeSet', req.data)

    let salaryAmount = parseFloat(req.data.SalaryAmount);
    if(salaryAmount>10000000){
      req.error(500,"heyy, please check the salary amount")
    }
  })
  this.after ('READ', EmployeeSet, async (employeeSet, req) => {
    console.log('After READ EmployeeSet', employeeSet)
  })
  this.before (['CREATE', 'UPDATE'], ProductSet, async (req) => {
    console.log('Before CREATE/UPDATE ProductSet', req.data)
  })
  this.after ('READ', ProductSet, async (productSet, req) => {
    console.log('After READ ProductSet', productSet)
  })
  this.before (['CREATE', 'UPDATE'], BusinessPartnerSet, async (req) => {
    console.log('Before CREATE/UPDATE BusinessPartnerSet', req.data)
  })
  this.after ('READ', BusinessPartnerSet, async (businessPartnerSet, req) => {
    console.log('After READ BusinessPartnerSet', businessPartnerSet)
  })
  this.before (['CREATE', 'UPDATE'], AddressSet, async (req) => {
    console.log('Before CREATE/UPDATE AddressSet', req.data)
  })
  this.after ('READ', AddressSet, async (addressSet, req) => {
    console.log('After READ AddressSet', addressSet)
  })
  this.before (['CREATE', 'UPDATE'], PurchaseOrderSet, async (req) => {
    console.log('Before CREATE/UPDATE PurchaseOrderSet', req.data)
  })
  this.after ('READ', PurchaseOrderSet, async (purchaseOrderSet, req) => {
    console.log('After READ PurchaseOrderSet', purchaseOrderSet)

    for (let index = 0; index < PurchaseOrderSet.length; index++) {
      const element = PurchaseItemsSet[index];
      element.NOTE='Not Found'
      
    }

  })
  this.before (['CREATE', 'UPDATE'], PurchaseItemsSet, async (req) => {
    console.log('Before CREATE/UPDATE PurchaseItemsSet', req.data)
  })
  this.after ('READ', PurchaseItemsSet, async (purchaseItemsSet, req) => {
    console.log('After READ PurchaseItemsSet', purchaseItemsSet)
  })


  //generic handler to support function implementation - always returns data(get only)
  this.on('getLargestOrder', async(req,res)=>{
    try {
      const tx = cds.tx(req);
      //use the cds query lang to make the call to DB
      const reply = await tx.read(PurchaseOrderSet).orderBy({
        'GROSS_AMOUNT' : 'desc'
      }).limit(1);
      return reply;
    } catch (error) {
      req.error(500,'some error occured : ' + error.toString())      
    }
  });

  //implementation of action -create, update
  this.on('boost', async(req)=>{
    //debugger;
    try {
      //extract the primary key
      const PRIMARYKEY = req.params[0];
      //start the transaction to DB
      const tx  = cds.tx(req);
      //use cds query language to update the gross_amoutn by 20k 
      await tx.update(PurchaseOrderSet).with({
        GROSS_AMOUNT :{ '+=': 20000 },
          NOTE : 'Boosted!' 
      }).where(PRIMARYKEY);
      //read the record and send in out
      return await tx.read(PurchaseOrderSet).where(PRIMARYKEY);
    } catch (error) {     
      req.error(500, 'Some error occured' + error.toString());
      
    }
  });
  return super.init()
}}
