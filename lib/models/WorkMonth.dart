

class WorkMonth{
  int monthId;
  String date;
  bool isPaid;
  String employeeLastName;
  String employeeName;

  WorkMonth({
    required this.monthId,
    required this.date,
    required this.isPaid,
    required this.employeeLastName,
    required this.employeeName
  });
  factory WorkMonth.fromJson(Map<String, dynamic> json) {
    return WorkMonth(
       monthId: json['monthId'],
       date: json['date'],
       isPaid: json['payed'],
       employeeLastName: json['employeeLastName'],
       employeeName: json['employeeName']
       );
     }
  }