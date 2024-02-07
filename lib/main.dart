import 'package:employee_management_app/controllers/AuthController.dart';
import 'package:employee_management_app/screens/AddEmployee.dart';
import 'package:employee_management_app/screens/AuthScreen.dart';
import 'package:employee_management_app/screens/EditConstruction.dart';
import 'package:employee_management_app/screens/EmployeDetaisScreen.dart';
import 'package:employee_management_app/screens/EmployeListScreen.dart';
import 'package:employee_management_app/screens/EmployeProfile.dart';
import 'package:employee_management_app/screens/EmployeeHistoryPaiment.dart';
import 'package:employee_management_app/utils/Storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
void main() async{

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp(){
     print("check auth is called ");
     authController.checkAuth();
     print("is login first time ${authController.isLogedIn.value}");
   }

    AuthController authController=Get.put(AuthController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
        routes: {
          '/EditConstruction': (context) => EditConstruction(),
        },
      home:authController.isLogedIn.value? EmployeListScreen():AuthScreen()
    );
  }
}




