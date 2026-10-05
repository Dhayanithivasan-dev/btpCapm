 //consume the resuable module

 const express = require('express');

 //create an instanse of the express application
 const app = express();
 

 //define handler to handle HTTP GET request
 app.get('/',(req,res) =>{

    res.send("Welcome Dhayas");


 });

 app.use(express.static('webapp'));
//  app.get("/employee",(req,res)=>{
//     const employee ={
//         id: 101,
//         name: " Jeevish",
//         position : "software engineer",
//         department:"CSE"
//     };
//     res.json(employee);
//  });

 app.get("/dhaya",(req,res)=>{
    const dhaya ={
        id : 102,
        name : "Dhaya",
        position : "Software engineer",
    };
    res.json(dhaya)
 });

 //start the server and listen on port 3000
 const port = process.env.PORT ||3000;
 app.listen(port,() =>{
console.log(`server is running on http://localhost:${port}`);

 });