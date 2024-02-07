import 'package:employee_management_app/models/ConstructionSite.dart';
import 'package:employee_management_app/services/ConstructionService.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ContsructionController extends GetxController{
  var EmployeeConstructionName="".obs;
  var EmployeeConstructionAddress="".obs;
  var searchDate=DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  var startDate=DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  var endDate=DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  var deleting=false.obs;
  var dragging=false.obs;
  var ListConstruction=<ConstructionSite>[].obs;
  RxMap<String, List<ConstructionSite>> GroupConstruction=<String,List<ConstructionSite>>{}.obs;
  changeDeleting(bool value){
    deleting.value=value;
  }
  getAllConstructionSite()async{
    print("hello go get all constructionssssssssss ");
    List<ConstructionSite> AllSites=await GetAllConstructionSite();
    ListConstruction.value=AllSites;
    groupConstruction();
  }
  Future<bool> addConstruction()async{
     bool added =await AddConstruction(ConstructionSite(name:EmployeeConstructionName.value, address: EmployeeConstructionAddress.value, startDate: startDate.value, endDate: endDate.value));
     return added;
  }
  Future<bool> editConstruction(ConstructionSite constructionSite)async{
    print("updated from the controller ");
    bool updated=await EditConstruction(constructionSite);
    return updated;
  }
  groupConstruction(){
    Map<String,List<ConstructionSite>> newGroupConstruction={};
    for(var c in ListConstruction.value){
       String firstLetter=c.name[0].toUpperCase();
       newGroupConstruction.putIfAbsent(firstLetter, ()=><ConstructionSite>[]);
       newGroupConstruction[firstLetter]!.add(c);
     }
      GroupConstruction.value=newGroupConstruction;
   }
   deleteConstruction(int ConstructionId)async{
    print("trying to delete from controller ");
      bool deleted=await DeletConstruction(ConstructionId);
      if(deleted){
        print("now get all constructions ");
        getAllConstructionSite();
      }
   }
}

