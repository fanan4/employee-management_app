
import 'package:employee_management_app/controllers/CunstructionController.dart';
import 'package:employee_management_app/models/Employee.dart';
import 'package:employee_management_app/models/WorkMonth.dart';
import 'package:employee_management_app/screens/EmployeDetaisScreen.dart';
import 'package:employee_management_app/utils/PickDate.dart';
import 'package:employee_management_app/widgets/Buttom_menu.dart';
import 'package:get/get.dart';
import 'package:employee_management_app/controllers/EmployeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeListScreen extends StatelessWidget{
  EmployeListScreen(){
    employeController.fetchEmployee();
  }
  EmployeController employeController=Get.put(EmployeController());
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
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
                "Employees",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ),
               InkWell(
              onTap: ()async{
                if(employeController.searchByConstruction==""){
                  employeController.fetchEmployee();
                }
                 print("construction name is ${employeController.searchByConstruction.value} and dateee is: ${employeController.searchDate.value}");
                 employeController.searchEmployee();
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
                   Obx(() => EmployeList(context))

                 ],
             ),
           ),
       ),
       bottomNavigationBar: Container(height: 70,child: Button_Menu(showAdd: true,addEmployee: true,)),
     );
  }

  Widget EmployeList(BuildContext context){
      return SizedBox(
          height: employeController.showSearchBox.value? MediaQuery.of(context).size.height-220:MediaQuery.of(context).size.height-150,
          child: ListView.builder(
            itemCount: employeController.groupedEmployee.keys.length,
            itemBuilder: ((context,index){
              String startingLetter=employeController.groupedEmployee.keys.elementAt(index);
              List<Employee> employeesForLetter = employeController.groupedEmployee[startingLetter]!;
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
                    children: employeesForLetter
                        .map((employee) => Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LongPressDraggable(
                              data:employee,
                              onDragStarted:()=>employeController.changeDeleting(true),
                              onDraggableCanceled:(_,__)=>employeController.changeDeleting(false),
                              onDragEnd:(_)=>employeController.changeDeleting(false),
                              child: EmployeView(employee,context,false),
                              feedback: EmployeView(employee,context,true)
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 13),
                              width: 360,
                              height: 2,
                              color: Color(0xffdad8d8)
                          )
                        ],
                      ),
                    )
                    )
                        .toList(),
                  ),

                ],
              );
            }
            ),
          )
        );

  }
  Widget EmployeView(Employee employee,BuildContext context,bool dragging){
    return Material(
      child: InkWell(
        onTap: (){
          Get.off(EmployeeScreen(),arguments: employee);
        },
        child: Row(
          children: [
           !dragging? ClipOval(
              child: Container(
                width: 60,
                height: 60,
                child: Image(
                  image: AssetImage("lib/assets/images/user_image.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ):Container(),

            Container(
              width: MediaQuery.of(context).size.width-100,
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
              child: ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        employee.name + " "+ employee.lastName,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.circle,
                        color: employee.months.length>0 && employee.months[0].isPaid? Colors.green: Colors.red,
                        size: 7,
                      )

                    ],
                  ),
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top:  5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(employee.constructionSite!.name),
                      //SizedBox(height: 5,),
                      Text(
                        employee.months.length>0 ? employee.months[0]!.date:DateTime.now().month.toString()+"/"+DateTime.now().year.toString(),
                        style: TextStyle(
                            color:employee.months.length>0 && employee.months[0].isPaid?Colors.black : Colors.red
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ),
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
              employeController.searchByConstruction.value=value;
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
            await PickDate(context: context,searchDate: true);
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
  PreferredSizeWidget MyappBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.grey[50],
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              "Employees",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
          ),
          Container(
             child: Image(
                 width: 40,
                 height: 40,
                 image: AssetImage("lib/assets/images/icons8-search-64.png")
                  ),
                )
              ],
            ),
          );
      }
}