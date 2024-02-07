import 'dart:ui';
import 'package:employee_management_app/controllers/CunstructionController.dart';
import 'package:employee_management_app/controllers/EmployeController.dart';
import 'package:employee_management_app/models/ConstructionSite.dart';
import 'package:employee_management_app/models/Employee.dart';
import 'package:employee_management_app/screens/EmployeListScreen.dart';
import 'package:employee_management_app/utils/PickDate.dart';
import 'package:employee_management_app/widgets/Buttom_menu.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class EmployeProfile extends StatelessWidget {
  EmployeController employeController=Get.put(EmployeController());
  ContsructionController contsructionController=Get.put(ContsructionController());
  EmployeProfile();

  @override
  Widget build(BuildContext context) {
    Employee employee=Get.arguments;
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "lib/assets/images/background_profile_screen.png",
                  ),
                  alignment: Alignment.topCenter)),
          padding: const EdgeInsets.only(
            top: 25,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Column(
              children: [
                //Custom app bar
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 15, bottom: 50, left: 20),
                    child: Row(children: [
                      clickedIcon(const Icon(Icons.arrow_back_ios_new_outlined), 13,
                              () {
                                Get.back();
                              }, const Color.fromARGB(52, 0, 0, 0))
                    ])),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.only(top: 80),
                          decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                            color: Color.fromARGB(255, 230, 230, 230),
                          ),
                          child: Container(
                            decoration: BoxDecoration(),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                        border: Border.all(
                                            width: 1, color: Colors.redAccent)),
                                    child: Column(
                                      children: [
                                        MyCustomForm(
                                          hinttext: "Username",
                                          icon: Icon(Icons.verified_user),
                                          label: "username",
                                          onchange: (value) {
                                             employeController.EmployeeName.value=value;
                                          },
                                          inittext: employee.name,
                                          width: 300,
                                        ),
                                        MyCustomForm(
                                          hinttext: "Last Name",
                                          icon: const Icon(Icons.verified_user_outlined),
                                          label: "Last Name",
                                          onchange: (value) {
                                              employeController.EmployeeLastName.value=value;
                                          },
                                          inittext: employee.lastName,
                                          width: 300,
                                        ),
                                        MyCustomForm(
                                          hinttext: "homeAddress",
                                          icon: const Icon(Icons.home),
                                          label: "Last Name",
                                          onchange: (value) {
                                              employeController.EmployeeAdress.value=value;
                                          },
                                          inittext: employee.homeAddress,
                                          width: 300,
                                        ),
                                         Container(
                                           margin: EdgeInsets.only(top: 10,left: 15),
                                           child: Row(
                                             children: [
                                               MyCustomForm(
                                                 hinttext: "Salary",
                                                 icon: const Icon(Icons.numbers),
                                                 label: "Salary",
                                                 onchange: (value) {
                                                     employeController.EmployeeSalary.value=value;
                                                 },
                                                 inittext: employee.salary.toString(),
                                                 width: 135,
                                               ),
                                               SizedBox(width: 5,),
                                               MyCustomForm(
                                                 hinttext: "Phone",
                                                 icon: const Icon(Icons.phone),
                                                 label: "Phone",
                                                 onchange: (value) {
                                                   employeController.EmployeePhone.value=value;
                                                 },
                                                 inittext: employee.phone,
                                                 width: 160,
                                               )
                                             ],
                                           ),
                                         ),
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


                                      ],
                                    ),

                                  ),
                                  Container(

                                    margin: EdgeInsets.only(top: 15),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: TextButton(
                                      onPressed: ()async {
                                        String name=employeController.EmployeeName.value==""?employee.name:employeController.EmployeeName.value;
                                        String lastName=employeController.EmployeeLastName.value==""?employee.lastName:employeController.EmployeeLastName.value;
                                        String homeAddress=employeController.EmployeeAdress.value==""?employee.homeAddress:employeController.EmployeeAdress.value;
                                        String salary=employeController.EmployeeSalary.value==""?employee.salary:employeController.EmployeeSalary.value;
                                        String phone=employeController.EmployeePhone.value==""?employee.phone:employeController.EmployeePhone.value;
                                        ConstructionSite? constructionSite=employeController.constructionSite.value.name==""?employee.constructionSite:employeController.constructionSite.value;
                                        bool updated=employeController.UpdateEmployee(Employee(name: name, lastName: lastName, homeAddress: homeAddress, phone: phone, salary: salary, months: employee.months, constructionSite: constructionSite));
                                        if(updated){
                                          employeController.EmployeeName.value="";
                                          employeController.EmployeeLastName.value="";
                                          employeController.EmployeeAdress.value="";
                                          employeController.EmployeeSalary.value="";
                                          employeController.EmployeePhone.value="";
                                          employeController.constructionSite.value=ConstructionSite(name: "", address: "", startDate: "", endDate: "");
                                          Get.to(EmployeListScreen());
                                        }
                                      },
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.edit_note_rounded,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            Text("submit",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: -60,
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
   //end upload image screen
                                },
                                Colors.blue
                                ),
                                bottom: 0,
                                right: 0,
                               )
                             ],
                          )
                       )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}

// components
clickedIcon(Icon icon, double padding, Function whenClickDo, color) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          foregroundColor: Colors.black87,
          backgroundColor: color,
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

class ImagePopup extends StatelessWidget {
  final String imageUrl;

  const ImagePopup({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class UploadImageScreeen extends StatelessWidget {
  const UploadImageScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(0),
              width: double.infinity,
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.all(20),
                    backgroundColor: const Color.fromARGB(255, 43, 134, 7),
                  ),
                  onPressed: () {},
                  child: InkWell(
                    onTap: (){ _selectImage(); },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform.scale(
                            scale: 1.6,
                            child: const Icon(
                              Icons.upload_sharp,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Selectionner une image",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(0),
              width: double.infinity,
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.all(20),
                    backgroundColor: const Color.fromARGB(172, 244, 76, 54),
                  ),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.scale(
                          scale: 1.6,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Supprimer l'Image",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
Future<void> _selectImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    // Set the image file path to the employee instance
    // Replace this with your actual employee object
    /*Employee employee = Employee();
      employee.imagePath = pickedFile.path;*/

    // Handle storing the employee with the image to the backend
    // Call your backend API to send the employee data with the image
    print('Selected image path: ${pickedFile.path}');
  }
}
class MyCustomForm extends StatelessWidget {
  const MyCustomForm(
      {super.key,
        required this.hinttext,
        required this.label,
        required this.inittext,
        required this.onchange,
        required this.icon,
        required this.width
      });
  final String hinttext;
  final String label;
  final String inittext;
  final Icon icon;
  final Function onchange;
  final double width;
  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 5),
          Container(
            width: width,
            child: TextField(
              controller: TextEditingController()..text = inittext,
              onChanged: (value) {
                onchange(value);
              },
              decoration: InputDecoration(
                icon: icon,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 4, color: Color.fromARGB(31, 229, 229, 229)),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                hintText: hinttext,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      );

  }
}
