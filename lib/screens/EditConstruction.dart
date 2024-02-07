import 'dart:ui';

import 'package:employee_management_app/controllers/CunstructionController.dart';
import 'package:employee_management_app/models/ConstructionSite.dart';
import 'package:employee_management_app/screens/ListConstruction.dart';
import 'package:employee_management_app/utils/PickDate.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditConstruction extends StatelessWidget{
  ContsructionController constructionController=Get.put(ContsructionController());
  @override
  Widget build(BuildContext context) {
    ConstructionSite constructionSite=Get.arguments;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "lib/assets/images/background_profile_screen.png",
                  ),
                alignment: Alignment.topCenter
            )
        ),
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
                  child: Row(
                    children: [
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
                        //TODO: fatimas part add list of text fields
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
                                        hinttext: "ConstructionSite",
                                        icon: const Icon(Icons.home_work_sharp),
                                        label: "Construction Name",
                                        onchange: (value) {
                                          constructionController.EmployeeConstructionName.value=value;
                                        },
                                        inittext: constructionSite.name,
                                        width: 300,
                                      ),
                                      MyCustomForm(
                                        hinttext: "Construction Address",
                                        icon: const Icon(Icons.home_work_outlined),
                                        label: "Construction Address",
                                        onchange: (value) {
                                          constructionController.EmployeeConstructionAddress.value=value;
                                        },
                                        inittext: constructionSite.address,
                                        width: 300,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                                        child: Row(
                                          children: [
                                            Container(
                                              child:Icon(
                                                Icons.data_exploration,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            InkWell(
                                              onTap: (){
                                                PickDate(context:context,startDate: true)
                                                ;},
                                              child: Container(
                                                  width: 130,
                                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(50),
                                                    border: Border.all(width: 1, color:Colors.black54),

                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.date_range,
                                                        color: Colors.black54,
                                                      ),
                                                      SizedBox(width: 15,),
                                                      Container(
                                                        child: Text(
                                                          "Start Date",
                                                          style: TextStyle(
                                                              color: Colors.black
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            InkWell(
                                              onTap: (){
                                                PickDate(context:context,endDate: true);
                                              },
                                              child: Container(
                                                  width: 130,
                                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(50),
                                                    border: Border.all(width: 1, color:Colors.black54),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.date_range,
                                                        color: Colors.black54,
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Container(
                                                        child: Text(
                                                          "End Date",
                                                          style: TextStyle(
                                                              color: Colors.black
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
                                    onPressed: () async{
                                      print("hello to edit the construction");
                                      int? constructionSiteId=constructionSite!.constructionSiteId;
                                      String name=constructionController.EmployeeConstructionName.value==""?constructionSite.name : constructionController.EmployeeConstructionName.value;
                                      String address=constructionController.EmployeeConstructionAddress.value==""?constructionSite.address:constructionController.EmployeeConstructionAddress.value;
                                      String? startDate=constructionController.startDate.value==""?constructionSite.startDate: constructionController.startDate.value;
                                      String? endDate=constructionController.endDate.value==""?constructionSite.endDate: constructionController.endDate.value;
                                      bool update=await constructionController.editConstruction(ConstructionSite(constructionSiteId: constructionSiteId,name: name, address: address, startDate: startDate, endDate: endDate));
                                      if(update){
                                        constructionController.EmployeeConstructionName.value="";
                                        constructionController.EmployeeConstructionAddress.value="";
                                        constructionController.startDate.value="";
                                        constructionController.endDate.value="";
                                        Get.to(ListContruction());
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


}
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