console.log("I'm Dhayanithivasan Learning JS");

//working with scaler variable
var x = 10;
var x;
let y;
const z = x + y;
console.log(z);
console.log(typeof y);
let ishappy = false;
console.log("Is she is happy? " + ishappy + " and the data type is " + typeof (ishappy));
const name = "Dhaya";
console.log("His name was " + name + " and the data type is " + typeof (name));
//Array practice
console.log("-------------------Array Preactice-----------------")
var employeeId = ['01', '02', '03', '04'];
var employeeName = ['Dhaya', 'Jeevish', 'DPN'];
console.log(employeeName);
console.log("The employee names are " + employeeName);
console.log("The array is " + employeeId);
console.log("the starting element is " + employeeId[0]);
console.log("the last element of the array is " + employeeId[employeeId.length - 1]);
employeeName.splice(1, 1);
console.log(employeeName);
employeeName.splice(2, 0, "Aksaj");
console.log(employeeName);

//iterating over the array

for (var i = 0; i < employeeName.length; i++) {
  console.log(employeeName[i]);
}
//Another method to iterate the Array
for (var names of employeeName) {
  console.log(names);
}

//String operations
//Split the words

var myName = "Dhayanithi vasan";
var splittedParts = myName.split(" ");
console.log(splittedParts);

//join the name
var joinName = splittedParts.join(" ");
console.log(joinName);

//reverse method
console.log("-----------------After reverse--------------");
var reverserdnName = splittedParts.reverse();
console.log(reverserdnName);

//sort Array
console.log("-----------------sort splitted array--------------");
splittedParts.sort();
console.log(splittedParts);

//convert the string into the uppercase
console.log("-----------------toUpperCase--------------");
var upper = myName.toUpperCase();
console.log(upper);

//convert the string intot he lowecase
console.log("-----------------toLowercase--------------");
var lower = myName.toLowerCase();
console.log(lower);


var aEmployees = [

  {
    "id": 1,
    "name": "Dhaya",
    "Position": "Developer",
    "age": 22,
    "salary": 1000000
  },
  {
    "id": 2,
    "name": "Dharshini",
    "Position": "Developer",
    "age": 22,
    "salary": 100000
  },
  {
    "id": 3,
    "name": "Akshaj",
    "Position": "Developer",
    "age": 22,
    "salary": 1000001
  },
  {
    "id": 1,
    "name": "Jeevish",
    "Position": "Developer",
    "age": 22,
    "salary": 100000
  },
  {
    "id": 1,
    "name": "Dpn",
    "Position": "Developer",
    "age": 22,
    "salary": 100000
  }
]
//print the salary of Akashaj
console.log(aEmployees[2].salary);

//using the loop

for (var i = 0; i < aEmployees.length; i++) {
  console.log(aEmployees[i].name + " - " + aEmployees[i].Position + " - " + aEmployees[i].salary);

}
console.log("----------------------Access the data by using the anonymous function------------------");
//creating function and access the data from aEmployees
aEmployees.forEach(
  function (dhaya) {
    console.log(dhaya.name + " -> " + dhaya.Position);
  }
)
//Named functions
console.log();
function splitString(str, delimiter) {
  return str.split(delimiter);

}
//crete the function to print salary of employee from array
function showMeRealSalary(employees, empname) {
  for (let i = 0; i < employees.length; i++) {
    if (employees[i].name === empname) {
      console.log(empname + "'s salary is : " + employees[i].salary);
      return;
    }
  }
}
//class variable in js
this.tax = 100

//increase the salary of employee by certain percentage
function increaseSalary(employees, percentage) {
  for (let i = 0; i < employees.length; i++) {
    employees[i].salary += employees[i].salary * (percentage / 100) + this.tax;
  }

}

//syntax 2 = function is created as a variable
var increaseSalaryV2 = function (employees, percentage) {
  for (let i = 0; i < employees.length; i++) {
    employees[i].salary += employees[i].salary * (percentage / 100) + this.tax;
  }
}

//syntax 3 for function = arrow function

var increaseSalaryv3 = (employees, percentage) => {
  for (let i = 0; i < employees.lenght; i++) {
    employees[i].salary += employees[i].salary * (percentage / 100) + this.tax;
  }
}

var employees = [
  { "name": "Dhaya", "salary": 200000 },
  { "name": "Akshaj", "salary": 200001 },
  { "name": "Jeevish", "salary": 200002 }
]

showMeRealSalary(employees, 'Dhaya');
console.log("Before salary increase");
console.log(employees);
increaseSalary(employees, 10);
showMeRealSalary(employees, 'Akshaj');
console.log("After salary increase");
console.log(employees);


//mapfunction



