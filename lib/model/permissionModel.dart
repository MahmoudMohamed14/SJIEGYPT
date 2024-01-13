class PermissionModel{



  String ?code;
  String ? name;
  String ?date;
  String?depart;
  String ?day;
  String ?reason;
  String ?state;

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

    state=json['state'];

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

    };

  }


}