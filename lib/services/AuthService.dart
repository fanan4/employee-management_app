import 'package:employee_management_app/utils/Storage.dart';
import 'package:employee_management_app/utils/constants.dart';
import 'package:http/http.dart' as http;



import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<bool> Login(String email, String password)async{
  print("helllo to LOGGINGGG");
   String? apiKey = URL;
   var url=Uri.parse("$apiKey/auth/login");
   var body=json.encode({"email":email,"password":password});
   var headers = {'Content-Type': 'application/json'};
   try{
     var response =await http.post(url,headers: headers,body: body);
     print("got responseeeeeeee");
     if(response.statusCode==200){
       print("responsssssssssssssse succedddddd");
        var data=json.decode(response.body);
        putinStorage(data['token']);
        print(data['token']);
        return true;
     }
     else{
       print("request field with status ${response.statusCode} ");
       return false;
     }
   }catch(e){
     print('Error: $e');
     return false;
   }
 }
