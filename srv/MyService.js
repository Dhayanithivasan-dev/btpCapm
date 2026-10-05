//implemetation file - js same name
const cds = require('@sap/cds')

module.exports = class MyService extends cds.ApplicationService { init() {

  this.on ('dhaya', async (req) => {
    console.log('On dhaya', req.data)

    let myName = req.data.name;
    return`Welcome to My new learning Project, hello ${myName} How are you!`
  })
  //calling parent class constructor
  return super.init()
}}
