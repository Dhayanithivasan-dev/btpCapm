module.exports ={

//increase the salary of employee by certain percentage
increaseSalary : function (employees, percentage) {
  for (let i = 0; i < employees.length; i++) {
    employees[i].salary += employees[i].salary * (percentage / 100) ;
  }

},

//syntax 2 = function is created as a variable
increaseSalaryV2 : function(employees, percentage) {
  for (let i = 0; i < employees.length; i++) {
    employees[i].salary += employees[i].salary * (percentage / 100) ;
  }
},

//syntax 3 for function = arrow function

increaseSalaryv3 : (employees, percentage) => {
  for (let i = 0; i < employees.length; i++) {
    employees[i].salary += employees[i].salary * (percentage / 100);
  }
}
};