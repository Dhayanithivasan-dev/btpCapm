const reuse = require('./util/reuse');

//create a json object
let employees =[
    { name: "Jeevish", salary : 20000 , email : "jeevish@gmail.com"},
    { name: "DPN", salary : 20000 , email : "dpn@gmail.com"},
    { name: "Akshaj", salary : 20000 , email : "Akshaj@gmail.com"}
];

reuse.increaseSalaryv3(employees, 10);
console.log("Employees after salary increase:");
console.log(employees);



