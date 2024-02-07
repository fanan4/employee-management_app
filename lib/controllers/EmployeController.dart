import 'dart:math';

import 'package:employee_management_app/models/ConstructionSite.dart';
import 'package:employee_management_app/models/Employee.dart';
import 'package:employee_management_app/models/WorkMonth.dart';
import 'package:employee_management_app/services/EmployeeService.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmployeController extends GetxController{
  var showSearchBox=false.obs;
  var searchByConstruction="".obs;
  var deleting=false.obs;
  var waiting=false.obs;
  var EmployeeName="".obs;
  var EmployeeLastName="".obs;
  var EmployeePhone="".obs;
  var EmployeeAdress="".obs;
  var EmployeeSalary="".obs;
  Rx<ConstructionSite> constructionSite=ConstructionSite(name:"", address: "", startDate: "", endDate: "").obs;
  var searchDate=DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  var monthsByEmployee=<WorkMonth>[].obs;
  RxMap<String, List<Employee>> groupedEmployee=<String,List<Employee>>{}.obs;
  RxMap<String, List<WorkMonth>> GroupMonth=<String,List<WorkMonth>>{}.obs;

  var EmployeList=[].obs;

   void setShowSearchBox(){
    showSearchBox.value=!showSearchBox.value;
  }

  getMonthByEmployee(int id)async{
      print("employee is is $id");
      List<WorkMonth>? months=await GetMonthByEmployee(id);
      monthsByEmployee.value=months!;
      GroupMonth.value=groupMonthsByYear();
      print("then new groupmonth isssssssss: ${GroupMonth.value}");
  }
  updatMonth(WorkMonth month,int employeeId)async{
     print("hello to update month ${month.monthId} of employee ${employeeId}");
     bool updated=await UpdateMonth(month);
     if(updated){
       print("updated the month succedddd ");
       await getMonthByEmployee(employeeId);
       }
    }
   changeDeleting(bool value){
     deleting.value=value;
    }
   fetchEmployee()async{
      List<Employee>? AllEmployees=await GetAllEmployees();
      EmployeList.value=AllEmployees!=null ? AllEmployees:[];
      print("from fetch employesss the new list iss $AllEmployees");
      fetchSortedEmployee();
   }
   UpdateEmployee(Employee employee)async{
     //Employee employee=Employee(employerId: employerId,name: EmployeeName.value, lastName: EmployeeLastName.value, homeAddress: EmployeeAdress.value, phone:EmployeePhone.value, salary: EmployeeSalary.value, months: [],constructionSite: constructionSite.value );
     bool isAdded=await UpdateEmployee(employee);
     return isAdded;
   }

   searchEmployee()async{
     List<Employee>? filtteredEmployeed=await SearchEmployee(searchByConstruction.value,searchDate.value);
     EmployeList.value=filtteredEmployeed!=null ? filtteredEmployeed:[];
     fetchSortedEmployee();
   }
   deleteEmploye(int employeId)async{
     print("delet employee with id $employeId");
     bool deleted=await DeteltEmployee(employeId);
     if(deleted){
       fetchEmployee();
     }
   }
  deletEmployee(Employee employee)async{
     /*print("hellllo deletinggggg employeeeeeeeeee ${employee.name}");
     int index = EmployeList.value.indexWhere((e) => employee.name ==e.name );
     print("indexxxxx is $index");
    if (index != -1) {
      EmployeList.value.removeAt(index);
      /*groupedEmployee.update(employee.name[0].toUpperCase(), (value){
        value.remove(employee);
        return value;
           }
      );*/
      print("removing succefuly the employee");
      fetchSortedEmployee();
    } else {
      print('Employee with ID not found.');
    }*/
   // bool deleted =await deleteEmploye(employee.employerId!);
  }
      Future<bool> addEmployee()async{
         print("construction site name is ${constructionSite.value.name}");
         Employee employee=Employee(name: EmployeeName.value, lastName: EmployeeLastName.value, homeAddress: EmployeeAdress.value, phone:EmployeePhone.value, salary: EmployeeSalary.value, months: [],constructionSite:constructionSite.value);
         bool isAdded=await AddEmployee(employee);
         return isAdded;
      }
      fetchSortedEmployee(){
        // Sort employees by name
        Map<String,List<Employee>> NewGroupEmployees=Map.from({});
        print("calling our group map is $groupedEmployee");
        EmployeList.sort((a,b)=>a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        for(Employee employee in EmployeList){
          String startingLetter = employee.name[0].toUpperCase();
          NewGroupEmployees.putIfAbsent(startingLetter, () => <Employee>[]);
          NewGroupEmployees[startingLetter]!.add(employee);
         }
        groupedEmployee.value=NewGroupEmployees;
    }

  Map<String, List<WorkMonth>> groupMonthsByYear() {
    Map<String, List<WorkMonth>> groupedMonths = {};

    for (var month in monthsByEmployee.value) {
      String year = month.date.substring(0,4);
      groupedMonths.putIfAbsent(year, () => []);
      groupedMonths[year]!.add(month);
    }

    return groupedMonths;
  }


}