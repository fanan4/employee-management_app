import 'package:employee_management_app/services/AuthService.dart';
import 'package:employee_management_app/utils/Storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  var waiting=false.obs;
  var loading=false.obs;
  var isLogedIn=false.obs;
  var isFocused=false.obs;
  var email="".obs;
  var password="".obs;
  setPassword(String password){
     this.password.value=password;
  }
  setEmail(String email){
     this.email.value=email;
  }
  Future<bool> login()async{
      waiting.value=true;
      var response=await Login(email.value, password.value);
      waiting.value=false;
      return response;
  }
  checkAuth()async{
    var token=await getStroage();
    print("choek auth :::token is $token");
    if(token!=null) isLogedIn.value=true;
    else isLogedIn.value=false;
    print("the auth token is ${isLogedIn.value}");
  }
}