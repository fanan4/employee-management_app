

import 'package:employee_management_app/controllers/EmployeController.dart';
import 'package:employee_management_app/models/Employee.dart';
import 'package:employee_management_app/models/WorkMonth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeHistoryPaiment extends StatelessWidget{
  EmployeeHistoryPaiment(){
        employeController.getMonthByEmployee(emplyee.employerId!);
  }
  EmployeController employeController=Get.put(EmployeController());
  Employee emplyee=Get.arguments;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffb3b3b3),
        elevation: 0,
        title: const Text('Month Payment Status'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20,left: 15),
        child: Obx(()=>SizedBox(
          height:  MediaQuery.of(context).size.height-200,
          child: ListView.builder(
              itemCount: employeController.GroupMonth.keys.length,
              itemBuilder: ((context,index){
                String startingYear=employeController.GroupMonth.keys.elementAt(index);
                List<WorkMonth> monthForYear = employeController.GroupMonth[startingYear]!=null? employeController.GroupMonth[startingYear]!:[];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      startingYear,
                      style:const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Column(
                      children: monthForYear.map((month) =>
                          Container(
                            margin: EdgeInsets.only(bottom: 10,right: 20),
                            padding:EdgeInsets.all(10),
                            decoration:BoxDecoration(
                              color: Colors.white
                            ),
                            child: Row(
                              crossAxisAlignment:CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap:(){
                                      employeController.updatMonth(month,emplyee.employerId!);
                                  },
                                  child: Container(
                                    child:month.isPaid ? Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 40,
                                    ):Icon(
                                      Icons.check_circle_outline,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          month.date,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          month.isPaid? "Paid":"unPaid.",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: CupertinoColors.systemGrey
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ),
                                Container(
                                  margin:EdgeInsets.only(left: 90),
                                  child: Text(
                                    emplyee.salary+"DH",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),
                                  ),
                                )
                              ],
                            )
                          )
                      ).toList(),
                    )
                  ],
                );
              }),
          ),
        )),
      )
    );
  }
}