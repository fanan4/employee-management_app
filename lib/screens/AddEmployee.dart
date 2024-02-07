import 'package:employee_management_app/controllers/CunstructionController.dart';
import 'package:employee_management_app/controllers/EmployeController.dart';
import 'package:employee_management_app/models/ConstructionSite.dart';
import 'package:employee_management_app/models/Employee.dart';
import 'package:employee_management_app/screens/EmployeListScreen.dart';
import 'package:employee_management_app/screens/EmployeProfile.dart';
import 'package:employee_management_app/utils/PickDate.dart';
import 'package:get/get.dart';
import 'package:employee_management_app/controllers/AuthController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEmployee extends StatelessWidget{
  AddEmployee(){
    contsructionController.getAllConstructionSite();
  }
  EmployeController employeController=Get.put(EmployeController());
  ContsructionController contsructionController=Get.put(ContsructionController());
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
                height: size.height ,
                margin: EdgeInsets.only(top: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /*Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          "Register and start managing your employee with ease",
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
                      ),*/
                      /*const SizedBox(
                        height: 20,
                      ),*/
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
                                 margin: EdgeInsets.only(bottom: 10),
                                 child: Stack(
                                   children: [
                                     rowndedImage(
                                         "lib/assets/images/user_image.jpeg", 120, context),
                                     Positioned(
                                       child: clickedIcon(
                                           const Icon(Icons.edit_outlined), 4, () {
                                         showDialog(
                                           barrierColor:
                                           const Color.fromARGB(186, 0, 0, 0),
                                           context: context,
                                           builder: (BuildContext context) {
                                             return const UploadImageScreeen();
                                           },
                                         );
// end upload image scree
                                       }, Colors.blue),
                                       bottom: 0,
                                       right: 0,
                                     )
                                   ],
                                 ),
                               ),
                               Container(
                                 width: 350,
                                 margin: EdgeInsets.only(bottom: 7),
                                 child: Text(
                                   "employee input:",
                                   style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 15,
                                     fontWeight: FontWeight.bold
                                   ),
                                 ),
                               ),
                               CustomTextFieldState(
                                "User name",
                                (value) {
                                    employeController.EmployeeName.value=value;
                                 },
                                   330,
                                 30
                          ),
                               CustomTextFieldState(
                            "Last Name",
                             (value) {
                                 employeController.EmployeeLastName.value=value;
                            },
                                   330,
                                   30
                          ),
                               CustomTextFieldState(
                             "homeAddress",
                             (value) {
                                  employeController.EmployeeAdress.value=value;
                               },
                                   330,
                                   30
                          ),
                               Row(
                                 children: [
                                   Container(
                                     margin: EdgeInsets.only(left: 20),
                                     child: CustomTextFieldState(
                                         "salary",
                                             (value) {
                                           employeController.EmployeeSalary.value=value;
                                           },
                                         160,
                                         10
                                     ),
                                   ),
                                   CustomTextFieldState(
                                       "phone",
                                           (value) {
                                           employeController.EmployeePhone.value=value;
                                       },
                                       160,
                                       0
                                   ),
                                 ],
                               ),
                             SizedBox(height: 10,),
                             InkWell(
                               onTap: (){
                                 showMenu(
                                     context: context,
                                     position: RelativeRect.fromLTRB(200,640, 40, 30),
                                     items: [
                                       ...contsructionController.ListConstruction.value.map((c){
                                         return PopupMenuItem(
                                            onTap:(){
                                              print("construction has been selected wich is: ${c.name} ");
                                              employeController.constructionSite.value=c;
                                              print("then new construction name is ${employeController.constructionSite.value.name}");
                                            },
                                            value: c.name,
                                             child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                               Container(
                                                   child: Row(
                                                     children: [
                                                       Container(
                                                         width:30,
                                                         height: 30,
                                                         child: Image(
                                                           image: AssetImage("lib/assets/images/buildingImg.png"),
                                                           fit: BoxFit.cover,
                                                         ),
                                                       ),
                                                       Container(
                                                         margin: EdgeInsets.only(left: 15),
                                                         child: Text(
                                                           c.name,
                                                           style: TextStyle(
                                                               fontSize: 18,
                                                               fontWeight: FontWeight.w500
                                                           ),
                                                         ),
                                                       )
                                                     ],
                                                   )
                                               ),
                                               Container(
                                                 margin: EdgeInsets.only(top: 5),
                                                 width: 130,
                                                 height: 1,
                                                 color: Colors.grey,
                                               )
                                             ],)
                                         );
                                       }).toList()
                                     ]
                                 );
                               },
                               child: Container(
                                 margin: EdgeInsets.symmetric(horizontal: 30),
                                 padding: EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                     color: Color.fromARGB(69, 163, 163, 163)
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                         "Select a Construction",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16
                                          ),
                                     ),
                                     Icon(
                                         Icons.keyboard_arrow_down_sharp
                                     )
                                   ],
                                 ),
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
                                child: employeController.waiting.value
                                    ? const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                  ),
                                )
                                    : InkWell(
                                  onTap: ()async{
                                      if(employeController.EmployeeName.value==""||employeController.EmployeeLastName.value=="" || employeController.EmployeeAdress.value=="" || employeController.EmployeePhone.value=="" || employeController.EmployeeSalary.value=="" ||employeController.constructionSite.value.name==""){
                                        //print("name is ${employeController.EmployeeName.value} lastname is:${employeController.EmployeeLastName.value} address :${employeController.EmployeeAdress.value} phone is :${employeController.EmployeePhone.value} salary is :${employeController.EmployeeSalary.value} construction name is :${employeController.EmployeeConstructionName.value} constructionAdress :${employeController.EmployeeConstructionAddress}");
                                        print("can not add employeee");
                                      }else{
                                        print("hello to add employee ");
                                        bool added =await employeController.addEmployee();
                                        if(added){
                                          employeController.EmployeeName.value="";
                                          employeController.EmployeeSalary.value="";
                                          employeController.EmployeeLastName.value="";
                                          employeController.EmployeePhone.value="";
                                          employeController.EmployeeAdress.value="";
                                          employeController.constructionSite.value=ConstructionSite(name:"", address: "", startDate:"", endDate: "");
                                          Get.to(EmployeListScreen());
                                        }
                                      }
                                  },
                                      child: Center(
                                       child: Text(
                                         "Add Employee",
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

  Widget rowndedImage(String url, double? size, context) => Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 230, 230),
          borderRadius: BorderRadius.all(Radius.circular(700))),
      child: GestureDetector(
        onTap: () {
          showDialog(
            barrierColor: const Color.fromARGB(186, 0, 0, 0),
            context: context,
            builder: (BuildContext context) {
              return ImagePopup(imageUrl: url);
            },
          );
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(700))),
          child: Image.asset(
            url,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
      )
  );


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