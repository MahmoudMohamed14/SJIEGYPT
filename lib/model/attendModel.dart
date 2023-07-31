class AttendModel{



  String ?id;
  String ? name;
   String ?date;
  String?depart;
  String ?checkIn;
  String ?checkOut;




  AttendModel(
      {

        this.name,

        this.checkIn,
        // this.operator,
        this.depart,
         this.id,
        this.checkOut,
        this.date
      });

  AttendModel.fromJson(Map<String,dynamic>  json){

    name=json['name'];

    checkOut=json['checkOut'];
    // line=json['line'];
    //  operator=json['operator'];
    date=json['date'];
    depart=json['depart'];
     id=json['id'];
    checkIn=json[' checkIn'];

  }
  Map<String,dynamic> toMap(){
    return {

      " checkIn": checkIn,

      "checkOut":checkOut,

      "name":name,

      "depart":depart,
      "date":date,
       "id":id,
    };

  }


}