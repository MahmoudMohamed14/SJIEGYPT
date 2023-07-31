class PermissionModel{



  String ?id;
  String ? name;
  String ?date;
  String?depart;
  String ?day;
  String ?reason;
  String ?state;
  String ?done;




  PermissionModel(
      {

        this.name,

        this.day,
        // this.operator,
        this.depart,
        this.id,
        this.reason,
        this.date,
        this.state,
        this.done
      });

  PermissionModel.fromJson(Map<String,dynamic>  json){

    name=json['name'];

    day=json['day'];
    // line=json['line'];
    //  operator=json['operator'];
    date=json['date'];
    depart=json['depart'];
    id=json['id'];
    reason=json['reason'];
    done=json['done'];
    state=json['state'];

  }
  Map<String,dynamic> toMap(){
    return {

      "reason": reason,

      "day":day,

      "name":name,

      "depart":depart,
      "date":date,
      "id":id,
      'state':state,
      'done':done
    };

  }


}