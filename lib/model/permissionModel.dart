class PermissionModel{



  String ?code;
  String ? name;
  String ?date;
  String?depart;
  String ?day;
  String ?reason;
  String ?state;
  String ?type;
  String ?location;
  String ?dateAccept;
  PermissionModel(
      {

        this.name,

        this.day,
        // this.operator,
        this.depart,
        this.code,
        this.reason,
        this.date,
        this.state,
        this.type,
        this.location,
        this.dateAccept

      });

  PermissionModel.fromJson(Map<String,dynamic>  json){

    name=json['name'];

    day=json['day'];
    // line=json['line'];
    //  operator=json['operator'];
    date=json['date'];
    depart=json['depart'];
    code=json['code'];
    reason=json['reason'];
    type=json['type'];

    state=json['state'];
    dateAccept=json['dateAccept'];

    location=json['location'];

  }
  Map<String,dynamic> toMap(){
    return {

      "reason": reason,
      "day":day,
      "name":name,
      "depart":depart,
      "date":date,
      "code":code,
      'state':state,
      "type":type,
      'location':location,
      "dateAccept":dateAccept,

    };

  }


}