class KittingComponant{

  String ?comment;
  String?startTime;
  String?endTime;
 List<dynamic>?  listComment;
 List<dynamic> ? listCheck1;
  List<dynamic> ? listCheck2;
  bool ?check1;
  bool ?check2;



  KittingComponant(
      {

        this.comment,
        this.startTime,
        this.endTime,
         this.listComment,
        this.listCheck1,
        this.listCheck2,
        this.check1=false,
        this.check2=false,

      });

  KittingComponant.fromJson(Map<String,dynamic>  json){

    comment=json['comment'];

    startTime=json['startTime'];
    endTime=json['endTime'];
    listComment=json['listComment'];
    check2=json['check2'];
    check1=json['check1'];
    listCheck2=json['listCheck2'];
    listCheck1=json['listCheck1'];


  }
  Map<String,dynamic> toMap(){
    return {

      "comment":comment,
      "startTime":startTime,
      "endTime":endTime,
      "listComment":listComment,
      "check2":check2,
      "check1":check1,
      "listCheck1":listCheck1,
      "listCheck2":listCheck2,

    };

  }


}