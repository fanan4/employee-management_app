

import 'dart:convert';

import 'package:employee_management_app/models/WorkMonth.dart';
import 'package:employee_management_app/utils/Storage.dart';
import 'package:employee_management_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:employee_management_app/models/Employee.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<Employee>?> GetAllEmployees()async{
    print("hello to get all employee ");
    String? ApiKey="$URL/api/v1";
    var Url = Uri.parse("$ApiKey/Employees/page/1?pageSize=20");
    var Token=await getStroage();
    print("token isss :$Token");
    var headers = {'Content-Type': 'application/json', 'Authorization':"Bearer $Token"} as Map<String, String>?;
    try{
        var response=await http.get(Url,headers: headers);
        if(response.statusCode==200){
            print("get ell employee has succeddddddd ");
            List<dynamic> jsonResponse = jsonDecode(response.body);
            print("employeee areee $jsonResponse");
            return jsonResponse.map((json) => Employee.fromJson(json)).toList();
        }
    }catch(e){
        print(" the status code is  ${e}");
        throw Exception('Failed to load data');
    }
}

Future<List<Employee>?> SearchEmployee(String name ,String date)async{
    String? ApiKey="$URL/api/v1";
    var Url = Uri.parse("$ApiKey/Employees/searchEmplyees?name=$name&date=$date");
    var Token=await getStroage();
    var headers = {'Content-Type': 'application/json', 'Authorization':"Bearer $Token"} as Map<String, String>?;
    try{
        var response=await http.get(Url,headers: headers);
        if(response.statusCode==200){
            print("get ell filtered  employee has succeddddddd ");
            List<dynamic> jsonResponse = jsonDecode(response.body);
            print("filtere are employeee areee $jsonResponse");
            return jsonResponse.map((json) => Employee.fromJson(json)).toList();
        }
    }catch(e){
        print(" the status code is  ${e}");
        throw Exception('Failed to load data');
    }
}
Future<bool>  AddEmployee(Employee employee)async{
    String? ApiKey="$URL/api/v1";
    var Url = Uri.parse("$ApiKey/Employees");
    var Token=await getStroage();
    var headers = {'Content-Type': 'application/json', 'Authorization':"Bearer $Token"} as Map<String, String>?;
    print("the new employee construction isss ${employee.constructionSite!.name}");
    var body= jsonEncode(
        {
            "name":employee.name,
            "lastName": employee.lastName,
            "homeAddress": employee.homeAddress,
            "salary": employee.salary,
            "phone": employee.phone,
            "constructionSiteDto":employee.constructionSite!.name!=""? {
                "name": employee.constructionSite!.name,
                "startDate":employee.constructionSite!.startDate,
                "endDate": employee.constructionSite!.endDate,
                "address": employee.constructionSite!.address
            }:null
        }
    );
    try{
        var response=await http.post(Url,headers: headers,body: body);
        if(response.statusCode==200){
            print("employeee added succefely ");
            return true;
        }
        return false;
    }catch(e){
        print("something went wrong: $e");
        return false;
    }
}
Future<bool> UpdateEmployee(Employee employee)async{
    String? ApiKey="$URL/api/v1";
    var Url = Uri.parse("$ApiKey/Employees");
    var Token=await getStroage();
    var headers = {'Content-Type': 'application/json', 'Authorization':"Bearer $Token"} as Map<String, String>?;
    var body= jsonEncode(
        {
            "name":employee.name,
            "lastName": employee.lastName,
            "homeAddress": employee.homeAddress,
            "salary": employee.salary,
            "phone": employee.phone,
            "constructionSiteDto": employee.constructionSite!.name!="" ?{
                "name": employee.constructionSite!.name,
                "startDate":employee.constructionSite!.startDate,
                "endDate": employee.constructionSite!.endDate,
                "address": employee.constructionSite!.address
            }:null
        }
    );
    try{
        var response=await http.put(Url,headers: headers,body: body);
        if(response.statusCode==200){
            return true;
        }
        return false;
    }catch(e){
        print("something went wrong: $e");
        return false;
    }
    return false;
}

Future<bool> DeteltEmployee(int employeId)async{
    String? ApiKey="$URL/api/v1";
    var Url = Uri.parse("$ApiKey/Employees/$employeId");
    var Token=await getStroage();
    var headers = {'Content-Type': 'application/json', 'Authorization':"Bearer $Token"} as Map<String, String>?;
    try{
        var response=await http.delete(Url,headers: headers);
        if(response.statusCode==204){
            print("employee with id $employeId has been deleted ");
            return true;
        }
    }catch(e){
        print("something went wrong: $e");
        return false;
    }
    return false;
}
Future<List<WorkMonth>?> GetMonthByEmployee(int Employeid)async{
    String? ApiKey="$URL/api/v1";
    var Url = Uri.parse("$ApiKey/Months/page/monthsByEmployeeid/$Employeid");
    var Token=await getStroage();
    var headers = {'Content-Type': 'application/json', 'Authorization':"Bearer $Token"} as Map<String, String>?;
    try{
        var response=await http.get(Url,headers: headers);
        if(response.statusCode==200){
            print("get months by  employee has succeddddddd ");
            List<dynamic> jsonResponse = jsonDecode(response.body);
            print("months by employeee areee $jsonResponse");
            List<WorkMonth> months=jsonResponse.map((json) => WorkMonth.fromJson(json)).toList();
            return months;
        }
    }catch(e){
        print("something went wrong: $e");
    }
}
 Future<bool> UpdateMonth(WorkMonth month)async{
     String? ApiKey="$URL/api/v1";
     var Url = Uri.parse("$ApiKey/Months");
     var Token=await getStroage();
     var headers = {'Content-Type': 'application/json', 'Authorization':"Bearer $Token"} as Map<String, String>?;
     var body=json.encode({
         "monthId": month.monthId,
         "date": month.date,
         "employeeName": month.employeeName,
         "payed": !month.isPaid,
         "employeeLastName": month.employeeLastName
     });
     try{
         var response=await http.put(Url,headers: headers,body: body);
         if(response.statusCode==200){
             print("responsee of update month has succed ");
             return true;
         }
     }catch(e){
         print("something went wrong: $e");
         return false;
     }
       return false;
 }



