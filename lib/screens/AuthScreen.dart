import 'package:employee_management_app/controllers/AuthController.dart';
import 'package:employee_management_app/screens/EmployeListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AuthController authController=Get.put(AuthController());
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 75, 75, 75),
      body: SingleChildScrollView(
        child: Container(
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    "Ready to get things done? Login and start managing your employees with ease",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SvgPicture.asset(
                    "lib/assets/icons/loginsvg.svg",
                    width: size.width
                ),
                SizedBox(height: 20),
                Obx(() => authController.waiting.value?
                    Container(
                      height: 160,
                      child: Center(
                        child: CircularProgressIndicator(
                           strokeWidth: 3,
                        ),
                      ),
                    ):
                    Container(
                       child: Column(
                         children: [
                           Container(
                             margin: const EdgeInsets.all(10),
                              child: TextField(
                                onChanged:(value){ authController.setEmail(value); },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                    ),
                                    hintText: "Email",
                                    hintStyle:
                                    TextStyle(color: Colors.white38)),
                              ),
                           ),
                           Container(
                             margin: const EdgeInsets.all(10),
                             child: TextField(
                               onChanged:(value){ authController.setPassword(value); },
                               decoration: InputDecoration(
                                   border: OutlineInputBorder(
                                     borderRadius:
                                     BorderRadius.circular(10),
                                   ),
                                   hintText: "Password",
                                   hintStyle:
                                   TextStyle(color: Colors.white38)),
                             ),
                           ),
                           ElevatedButton(
                             style: ElevatedButton.styleFrom(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(30.0),
                                 ),
                                 foregroundColor: Color.fromARGB(255, 19, 19, 19),
                                 backgroundColor: Colors.red[300],
                                 alignment: Alignment.centerLeft,
                                 elevation: 0,
                                 padding: const EdgeInsets.symmetric(
                                     horizontal: 60, vertical: 18),
                                 minimumSize: Size.zero),
                             onPressed: () async {
                               print('email: ${authController.email.value}');
                               print('password : ${authController.password.value}');
                               bool logedin = await authController.login();
                               if (logedin == true) {
                                 authController.isLogedIn.value=true;
                                 Get.to(EmployeListScreen());
                               }
                               //TODO:  PROCESS LOGIN
                             },
                             child: Container(
                               child: Text("Login",
                                   style: GoogleFonts.roboto(
                                     color: Color.fromARGB(255, 19, 19, 19),
                                     fontWeight: FontWeight.bold,
                                     fontSize: 18,
                                   )),
                             ),
                           ),
                         ],
                       ),
                    )
                )
              ],
            ),
        ),
      ),
    );
  }
  
}

class LightGrey {
}