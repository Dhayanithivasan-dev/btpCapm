const cds = require('@sap/cds')
const { SELECT } = require('@sap/cds/lib/ql/cds-ql')

module.exports = class CDSService extends cds.ApplicationService { init() {

  const { ProductSet, ItemsSet } = cds.entities('CDSService')

  this.before (['CREATE', 'UPDATE'], ProductSet, async (req) => {
    console.log('Before CREATE/UPDATE ProductSet', req.data)
  })
  this.after ('READ', ProductSet, async (productSet, req) => {

    //step1 - Get all the unique prduct ID's
    let ids = productSet.map(p=>p.ProductId);

    //cds ql to go to all the item data and aggregate the count 
    const orderCount = await SELECT.from(ItemView)
                                    .columns('ProductId', {func : 'count', as: 'dhaya'})
                                    .where({'ProductId': {in: ids}})
                                    .groupBy('ProductId');

    
    for(const product of productSet){
      const element = productSet[product];
      const foundRecord = orderCount.find(pc=>pc.ProductID === element.ProductID)
      element.soldCount = foundRecord ? foundRecord.count : 0;
    }
  })
  this.before (['CREATE', 'UPDATE'], ItemsSet, async (req) => {
    console.log('Before CREATE/UPDATE ItemsSet', req.data)
  })
  this.after ('READ', ItemsSet, async (itemsSet, req) => {
    console.log('After READ ItemsSet', itemsSet)
  })


  return super.init()
}}
