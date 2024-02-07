


class  ConstructionSite{
   int? constructionSiteId;

   String name;

   String address;

   String? startDate;

   String? endDate;

   ConstructionSite({this.constructionSiteId,required this.name,required this.address,required this.startDate,required this.endDate});

   factory ConstructionSite.fromJson(Map<String, dynamic>? json) {
      print("try convert construction");
      return json!=null? ConstructionSite(
         constructionSiteId:json['constructionSiteId'],
         name: json['name'],
         address: json['address'],
         startDate: json['startDate'] != null ? json['startDate'] : null,
         endDate: json['endDate'] != null ? json['endDate']: null,
      ):ConstructionSite(name: "", address: "", startDate:"", endDate: "");
   }
}