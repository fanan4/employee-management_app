
import 'dart:convert';

import 'package:employee_management_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:employee_management_app/models/ConstructionSite.dart';
import 'package:employee_management_app/utils/Storage.dart';

Future<List<ConstructionSite>> GetAllConstructionSite()async{
  String? ApiKey="$URL/api/v1";
  var Url = Uri.parse("$ApiKey/ConstructionSites/page/1?pageSize=20");
  var Token=await getStroage();
  var headers = {'Content-Type': 'application/json', 'Authorization':"Bearer $Token"} as Map<String, String>?;
  try{
    var response =await http.get(Url,headers: headers);
    if(response.statusCode==200){
      print("get ell construction has succeddddddd ");
      List<dynamic> jsonResponse = jsonDecode(response.body);
      print("employeee areee $jsonResponse");
      return jsonResponse.map((json) => ConstructionSite.fromJson(json)).toList();
    }
  }catch(e){

  }
  return [];
}
Future<bool> AddConstruction(ConstructionSite constructionSite)async{
  String? ApiKey="$URL/api/v1";
  var Url = Uri.parse("$ApiKey/ConstructionSites");
  var Token=await getStroage();
  var headers = {'Content-Type': 'application/json', 'Authorization':"Bearer $Token"} as Map<String, String>?;
  var body=jsonEncode(
      {
       "name": constructionSite!.name,
       "startDate":constructionSite!.startDate,
       "endDate": constructionSite!.endDate,
       "address": constructionSite!.address
     }
  );
  try{
     var response=await http.post(Url,headers: headers,body: body);
     if(response.statusCode==200){
       print("construction added succeflyyyyyyyyyy");
       return true;
     }else return false;
  }catch(e){
    print("something went wrong $e");
  }
  return false;
}
Future<bool> EditConstruction(ConstructionSite constructionSite)async{
  String? ApiKey="$URL/api/v1";
  var Url = Uri.parse("$ApiKey/ConstructionSites");
  var Token=await getStroage();
  var headers = {'Content-Type': 'application/json', 'Authorization':"Bearer $Token"} as Map<String, String>?;
  var body=jsonEncode(
      {
        "constructionSiteId":constructionSite.constructionSiteId,
        "name": constructionSite!.name,
        "startDate":constructionSite!.startDate,
        "endDate": constructionSite!.endDate,
        "address": constructionSite!.address
      }
  );
  try{
    var response=await http.put(Url,headers: headers,body: body);
    if(response.statusCode==200){
      print("construction updated succeflyyyyyyyyyy");
      return true;
    }else return false;
  }catch(e){
    print("something went wrong $e");
  }
  return false;
}

Future<bool> DeletConstruction(int ConstructionId)async{
  String? ApiKey="$URL/api/v1";
  var Url = Uri.parse("$ApiKey/ConstructionSites/$ConstructionId");
  var Token=await getStroage();
  var headers = {'Content-Type': 'application/json', 'Authorization':"Bearer $Token"} as Map<String, String>?;
  try{
    var response=await http.delete(Url,headers: headers);
    if(response.statusCode==204){
      print("construction deleted with id $ConstructionId has been deleted ");
      return true;
    }
  }catch(e){
    print("something went wrong: $e");
    return false;
  }
  return false;
}