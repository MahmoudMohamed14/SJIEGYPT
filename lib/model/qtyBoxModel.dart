class CodeBoxModel{


  String?code;

  String ? qtyBox;

  CodeBoxModel(
      {

        this.code,

        this.qtyBox,

      });

  CodeBoxModel.fromJson(Map<String,dynamic>  json){



  code=json['code'];

    qtyBox=json['qtyBox'];


  }
  Map<String,dynamic> toMap(){
    return {



      "code":code,

      "qtyBox":qtyBox,

    };

  }


}