
import 'package:employee_management_app/controllers/CunstructionController.dart';
import 'package:employee_management_app/models/ConstructionSite.dart';
import 'package:employee_management_app/screens/EditConstruction.dart';
import 'package:get/get.dart';
import 'package:employee_management_app/widgets/Buttom_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListContruction extends StatelessWidget{
  ContsructionController construcionController=Get.put(ContsructionController());
  ListContruction(){
    construcionController.getAllConstructionSite();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                "Constructions",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ),
            InkWell(
              onTap: ()async{
                /*if(employeController.searchByConstruction==""){
                  employeController.fetchEmployee();
                }
                print("construction name is ${employeController.searchByConstruction.value} and dateee is: ${employeController.searchDate.value}");
                employeController.searchEmployee();*/
              },
              child: Container(
                child: Image(
                    width: 40,
                    height: 40,
                    image: AssetImage("lib/assets/images/icons8-search-64.png")
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchBox(context),
             constructionList(context)
            ],
          ),
        ),
      ),
     bottomNavigationBar: Container(height: 70,child: Button_Menu(showAdd: true,addAdmin: true)),
   );
  }

  Widget searchBox(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
          margin: EdgeInsets.only(top: 15.0,bottom: 20),
          width: 270.0,
          decoration: BoxDecoration(
            color: Color(0xE0EEEEEE),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child:  TextField(
            onChanged: (value){
              //employeController.searchByConstruction.value=value;
            },
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w400),
              suffixIcon: Icon(
                Icons.search_sharp,
                color: Colors.black,
                size: 25.0,
              ),
              prefixIconConstraints: BoxConstraints(),
              border: InputBorder.none,
            ),
          ),
        ),
        InkWell(
          onTap: ()async{
            //await PickDate(context: context,searchDate: true);
          },
          child: Container(
            margin: EdgeInsets.only(left: 20,bottom:  8),
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
            decoration: BoxDecoration(
                color: Color(0xE0EEEEEE),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Icon(
              Icons.date_range,
              size: 30,
            ),
          ),
        ),
        /*InkWell(
          onTap: (){ employeController.setShowSearchBox();},
          child: Container(
            margin: EdgeInsets.only(top: 10,left: 10),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            decoration: BoxDecoration(
                color: Color(0xE0EEEEEE),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Image(
                width: 40,
                height: 40,
                image: AssetImage("lib/assets/images/icons8-search-64.png")
            ),
          ),
        )*/
      ],
    );
  }

  Widget constructionList(BuildContext context){
    return Obx(() => SizedBox(
      height:MediaQuery.of(context).size.height-220,
      child: ListView.builder(
          itemCount: construcionController.GroupConstruction.keys.length,
          itemBuilder: ((context,index){
            String startingLetter=construcionController.GroupConstruction.keys.elementAt(index);
            List<ConstructionSite> constructionForLetter = construcionController.GroupConstruction[startingLetter]!;
            int value=0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  startingLetter,
                  style:const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: constructionForLetter.map((construction) {
                    return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LongPressDraggable(
                            data:construction,
                            onDragStarted:()=>construcionController.changeDeleting(true),
                            onDraggableCanceled:(_,__)=>construcionController.changeDeleting(false),
                            onDragEnd:(_)=>construcionController.changeDeleting(false),
                            child:ConstructionView(value++,context, construction, false),
                            feedback: ConstructionView(value++,context, construction, true)
                        ),
                        SizedBox(height: 3,),
                        Container(
                            margin: EdgeInsets.only(left: 13),
                            width: 360,
                            height: 2,
                            color: Color(0xffdad8d8)
                        ),
                        SizedBox(height: 15,)
                        ],
                       );
                     }
                   ).toList(),
                )
              ],
            );
          })
      ),
    )
    );
  }

  //Construction view

  Widget ConstructionView(int index,BuildContext context,ConstructionSite constructionSite,bool dragging){
    double value=250+index*30;
    print("value of index is $value");
    return Material(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Container(
              padding: dragging? EdgeInsets.all(10):EdgeInsets.all(0),
             decoration: BoxDecoration(
               color: dragging?Color(0xfff2f9ff): Colors.grey[50],
               borderRadius: BorderRadius.circular(10.0),
               boxShadow: [
                 dragging ? BoxShadow(
                   color: Colors.grey.withOpacity(0.5), // Shadow color
                   offset: Offset(0, 3), // Offset in x and y
                   blurRadius: 5.0, // Blur radius
                   spreadRadius: 3.0, // Spread radius
                 ):BoxShadow(blurRadius: 0,spreadRadius: 0,color:Colors.grey.withOpacity(0) ),
               ],
             ),
              child: Row(
                children: [
                  !dragging? ClipOval(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image(
                        image: AssetImage("lib/assets/images/buildingImg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ):Container(),
                  Container(
                    width: MediaQuery.of(context).size.width-150,
                    margin: EdgeInsets.only(left: 10),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                              constructionSite.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                          ),
                        ),
                        SizedBox(height: 6,),
                        Container(
                          child: Text(
                              constructionSite.address
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
           ),
           InkWell(
             onTap: (){
               //Get.to(EditConstruction(),arguments: constructionSite);
               showMenu(
                   context: context,
                   position:  RelativeRect.fromLTRB(100, value, 20, 0),
                   items: [
                      PopupMenuItem(
                          onTap: ()async{
                              //Get.to(EditConstruction(),arguments: constructionSite);
                          },
                          child: InkWell(
                            onTap:(){
                              Get.to(EditConstruction(),arguments: constructionSite);
                            },
                            child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "edit"
                                    )
                                  ],
                                ),
                            ),
                          ),
                      ),
                     PopupMenuItem(
                       onTap: ()async{
                         //Get.to(EditConstruction(),arguments: constructionSite);
                       },
                       child: InkWell(
                         onTap:(){
                           print("trying to delete a construction with id ${constructionSite.constructionSiteId}");
                           construcionController.deleteConstruction(constructionSite.constructionSiteId!);

                         },
                         child: Container(
                           child: Row(
                             children: [
                               Icon(
                                   Icons.delete,
                                   color: Colors.red,
                               ),
                               SizedBox(
                                 width: 10,
                               ),
                               Text(
                                   "delete"
                               )
                             ],
                           ),
                         ),
                       ),
                     )
                   ]

               );
              },
             child: Container(
               child: Icon(
                   Icons.more_vert
               ),
             ),
           )

         ],
       ),
    );
  }
}