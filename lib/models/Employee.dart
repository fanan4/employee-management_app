
import 'package:employee_management_app/models/ConstructionSite.dart';

import 'WorkMonth.dart';
class Employee{
  int? employerId;
  String name;
  String lastName;
  String homeAddress;
  String phone;
  String salary;
  List<WorkMonth> months;
  ConstructionSite? constructionSite;
  Employee({
    this.employerId,
    required this.name,
    required this.lastName,
    required this.homeAddress,
    required this.phone,
    required this.salary,
    required this.months,
    required this.constructionSite
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    print("hello from json ");
    List<dynamic> jsonMonths = json['months'];
    List<WorkMonth> monthsList = jsonMonths.map((month) => WorkMonth.fromJson(month)).toList();
    print("monthe succed to be converted ");

    return Employee(
      employerId:json['employerId'],
      name: json['name'],
      lastName: json['lastName'],
      homeAddress: json['homeAddress'],
      salary: json['salary'],
      phone: json['phone'],
      months: monthsList,
      constructionSite: ConstructionSite.fromJson(json['constructionSiteDto']),
    );
  }

}