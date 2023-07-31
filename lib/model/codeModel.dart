class CodeModel{



  String ?code;
  String ? check;
  // String ?id;
  String?orderType;
  String ?capa;
  String ?bag;




  CodeModel(
      {

        this.code,

        this.check,
       // this.operator,
        this.orderType,
        // this.id,
        this.bag,
        this.capa
      });

  CodeModel.fromJson(Map<String,dynamic>  json){

    code=json['code'];

    check=json['check'];
   // line=json['line'];
  //  operator=json['operator'];
   bag=json['bag'];
    capa=json['capa'];
    // id=json['id'];
    orderType=json['orderType'];

  }
  Map<String,dynamic> toMap(){
    return {

      "code":code,

      "check":check,
     // "line":line,
      "bag":bag,
     // "boxQty":boxQty,
      "capa":capa,
      "orderType":orderType,
      // "id":id,
    };

  }


}