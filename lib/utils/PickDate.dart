import 'package:employee_management_app/controllers/CunstructionController.dart';
import 'package:get/get.dart';
import 'package:employee_management_app/controllers/EmployeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> PickDate({BuildContext? context, bool startDate=false,bool endDate=false,bool searchDate=false } ) async {
  EmployeController employeController=Get.put(EmployeController());
  ContsructionController constructionController=Get.put(ContsructionController());
  var  _selectedDate=DateTime.now();
  final DateTime? picked = await showDatePicker(
      context: context!,
      initialDate: _selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2050));
  if (picked != null && picked != _selectedDate) {
    //taskController.selectedDate.value = picked;
    String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
    if(searchDate){
      print("formatte Date is $formattedDate");
      employeController.searchDate.value=formattedDate;
    }else if(startDate){
      constructionController.startDate.value=formattedDate;
      print("start date is : $formattedDate");
    }else if(endDate){
      print("end date is : $formattedDate");
      constructionController.endDate.value=formattedDate;
    }
    print("the selected date is $picked");
  }
}