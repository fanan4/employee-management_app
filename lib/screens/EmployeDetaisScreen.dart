
import 'package:employee_management_app/screens/EmployeProfile.dart';
import 'package:employee_management_app/screens/EmployeeHistoryPaiment.dart';
import 'package:employee_management_app/widgets/Buttom_menu.dart';
import 'package:get/get.dart';
import 'package:employee_management_app/models/Employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Employee employee=Get.arguments;
    return Scaffold(
       body: Container(
         padding: EdgeInsets.all(10),
         child: Column(
           children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image(
                   width: MediaQuery.of(context).size.width,
                   height: 250,
                   image: AssetImage("lib/assets/images/user_image.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
             Container(
               margin: EdgeInsets.only(top: 30),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     child: Text(
                       employee.name.length >10 ?employee.name.substring(0,10)+"...":employee.name,
                       style: TextStyle(
                         fontSize: 22,
                         color: Colors.green,
                         fontWeight: FontWeight.bold
                       ),
                     ),
                   ),
                   Container(
                     child: Text(
                       employee.lastName,
                       style: TextStyle(
                           color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                       ),
                     ),
                   )
                 ],
               ),
             ),
             Container(
               margin: EdgeInsets.only(top: 50),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     child: Text(
                       "Personal Information",
                         style:TextStyle(
                             fontSize: 16,
                             fontWeight: FontWeight.bold
                         )
                     ),

                   ),
                   IconButton(
                       onPressed: (){
                         Get.to(
                            EmployeProfile(),
                            arguments: employee
                         );
                       },
                       icon: Icon(
                         Icons.arrow_forward_ios,
                         size: 25,
                       )
                   )
                 ],
               ),
             ),
             Container(
               margin: EdgeInsets.only(top: 30),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     child: Text(
                         "Paiment History",
                         style:TextStyle(
                             fontSize: 16,
                             fontWeight: FontWeight.bold
                         )
                     ),
                   ),
                   IconButton(
                       onPressed: (){
                          Get.to(EmployeeHistoryPaiment(),arguments: employee);
                       },
                       icon: Icon(
                         Icons.arrow_forward_ios,
                         size: 25,
                       )
                   )
                 ],
               ),
             )

           ],
         ),
       ),
           bottomNavigationBar: Container(height: 70,child: Button_Menu(),),
       );
  }

}







