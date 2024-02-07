

import 'package:employee_management_app/controllers/CunstructionController.dart';
import 'package:employee_management_app/screens/ListConstruction.dart';
import 'package:employee_management_app/utils/PickDate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
class AddConstruction extends StatelessWidget{
  ContsructionController constructionController=Get.put(ContsructionController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: size.width,
          leading: Container(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      " Team.",
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      "trak",
                      style: GoogleFonts.robotoMono(
                        color: Color.fromARGB(255, 229, 115, 115),
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              )),
          backgroundColor: Color.fromARGB(255, 75, 75, 75),
        ),
        backgroundColor: Color.fromARGB(255, 75, 75, 75),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                "Add  and start managing your employes with ease",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  color: Colors.grey[300],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  textStyle: TextStyle(
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.5),
                                        spreadRadius: 10,
                                        blurRadius: 20,
                                        // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: 350,
                              margin: EdgeInsets.only(bottom: 7,top: 10),
                              child: Text(
                                "Construction input:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            CustomTextFieldState(
                                "constructionSite",
                                    (value) {
                                     constructionController.EmployeeConstructionName.value=value;
                                },
                                330,
                                30
                            ),
                            CustomTextFieldState(
                                "constructionSite Address",
                                    (value) {
                                      constructionController.EmployeeConstructionAddress.value=value;
                                },
                                330,
                                30
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      PickDate(context:context,startDate: true)
                                      ;},
                                    child: Container(
                                        width: 160,
                                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            color:  Colors.black54,
                                            width: 1,
                                          ),
                                          color: const Color.fromARGB(69, 163, 163, 163),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 15,),
                                            Container(
                                              child: Text(
                                                "Start Date",
                                                style: TextStyle(
                                                    color: Colors.white38
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      PickDate(context:context,endDate: true);
                                    },
                                    child: Container(
                                        width: 160,
                                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Colors.black54,
                                            width: 1,
                                          ),
                                          color: const Color.fromARGB(69, 163, 163, 163),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 15,),
                                            Container(
                                              child: Text(
                                                "End Date",
                                                style: TextStyle(
                                                    color: Colors.white38
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  foregroundColor: Color.fromARGB(255, 19, 19, 19),
                                  backgroundColor: Colors.red[300],
                                  alignment: Alignment.centerLeft,
                                  elevation: 10,
                                  shadowColor: Colors.red[300],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60, vertical: 18),
                                ),
                                onPressed: ()  {
                                  print("hello uploaddd image ");

                                  /*
                                List<dynamic> registered =
                                await auth.register();
                                if (registered[0] == true) {
                                  Get.back();
                                } else {
                                  Get.snackbar(
                                      "Registration Error", registered[1],
                                      backgroundColor: Colors.red[300],
                                      colorText: LightGrey,
                                      snackPosition: SnackPosition.BOTTOM,
                                      duration: const Duration(seconds: 2),
                                      animationDuration:
                                      const Duration(milliseconds: 100),
                                      margin: const EdgeInsets.all(20),
                                      icon: Icon(Icons.dangerous_sharp));
                                }*/
                                },
                                child: Container(
                                  child: false
                                      ? const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                    ),
                                  )
                                      : InkWell(
                                    onTap: ()async{
                                        print("hello to a addddd construction");
                                      if( constructionController.EmployeeConstructionName.value=="" || constructionController.EmployeeConstructionAddress=="" ){
                                        print(" construction name is :${constructionController.EmployeeConstructionName.value} constructionAdress :${constructionController.EmployeeConstructionAddress}");
                                        print("can not add employeee");
                                      }else{
                                         print("hello ooooooto add construction ");
                                         bool added =await constructionController.addConstruction();
                                         if(added){
                                           constructionController.EmployeeConstructionName.value="";
                                           constructionController.EmployeeConstructionAddress.value="";
                                           constructionController.startDate.value="";
                                           constructionController.endDate.value="";
                                           Get.to(ListContruction());
                                         }
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        "Add Construction",
                                        style: GoogleFonts.roboto(
                                          color: Color.fromARGB(255, 230, 230, 230),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ]
                      )
                    ]
                )
            )
        )
    );
  }

  Widget CustomTextFieldState(String hint , Function onChange,double? width,double margin){
    return Container(
      width: width,
      margin:  EdgeInsets.symmetric(vertical: 5, horizontal: margin),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:  /*Color.fromARGB(255, 229, 115, 115)*/ Colors.black54 ,
          width: 1,
        ),
        color: const Color.fromARGB(69, 163, 163, 163),
      ),
      child: TextField(

        onChanged: (value) {
          onChange(value);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38),
        ),
        onTapOutside: (value) {

        },
        onTap: () {

        },
        style: const TextStyle(color: Colors.white),
      ),
    );;
  }
}