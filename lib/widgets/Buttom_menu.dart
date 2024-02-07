
import 'package:employee_management_app/controllers/CunstructionController.dart';
import 'package:employee_management_app/controllers/EmployeController.dart';
import 'package:employee_management_app/screens/AddConstruction.dart';
import 'package:employee_management_app/screens/AddEmployee.dart';
import 'package:employee_management_app/screens/EmployeListScreen.dart';
import 'package:employee_management_app/screens/ListConstruction.dart';
import 'package:get/get.dart';
import 'package:employee_management_app/models/Employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button_Menu extends StatelessWidget{
  EmployeController employeController=Get.put(EmployeController());
  ContsructionController constructionController=Get.put(ContsructionController()) ;
  Button_Menu({this.addAdmin=false,this.addEmployee=false,this.showAdd=false});
  bool addAdmin;
  bool addEmployee;
  bool showAdd;
  @override
  Widget build(BuildContext context) {
    return DragTarget<Employee>(builder:(_,__,___){
      return  Container(
        color: Color.fromARGB(255, 230, 230, 230),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: (){
                           Get.off(EmployeListScreen());
                        },
                        icon:Icon(
                          Icons.menu,
                          color: Colors.black,
                        ))
                    ,
                    showAdd ? Obx(() => Transform.scale(
                      scale: 1.2,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                              border: Border.all(color: Colors.red, width: 2)),
                          child:employeController.deleting.value  || constructionController.deleting.value?
                          ClickedIcon(Icon(Icons.delete,), 10, () {}):
                          ClickedIcon(const Icon(Icons.add), 10, (){
                            if(addEmployee){
                               Get.to(AddEmployee());
                            }else if(addAdmin){
                               Get.to(AddConstruction());
                            }
                          }
                          )
                      ),
                    )
                    ):Container(),

                    InkWell(
                      onTap: (){
                        Get.to(ListContruction());
                         },
                      child: Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.home_work_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      );
    },
    onAccept: (Employee employee){
        print("heeell accept the employeee");
        employeController.deleteEmploye(employee.employerId!);
       },
    );
  }

  ClickedIcon(Icon icon, double padding, Function whenClickDo) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            foregroundColor: Colors.black87,
            backgroundColor: employeController.deleting.value ? Colors.red : Color.fromARGB(255, 230, 230, 230),
            alignment: Alignment.centerLeft,
            elevation: 0,
            padding: EdgeInsets.all(padding),
            minimumSize: Size.zero),
        onPressed: () {
          whenClickDo();
        },
        child: Container(
          child: icon,
        ),
      );


}