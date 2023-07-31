class PlanModel{

  String ?operator;
  String?line;
  String ?code;
  String ? qty;
  // String ?id;
   //String?orderType;
 //  String ?capa;
//  String ?boxQty;




  PlanModel(
      {

        this.code,
        this.qty,
        this.line,
        this.operator,
      //  this.orderType,
        // this.id,
      //   this.boxQty,
      //   this.capa
      });

  PlanModel.fromJson(Map<String,dynamic>  json){

    code=json['code'];

    qty=json['qty'];
    line=json['line'];
    operator=json['operator'];
   // boxQty=json['boxQty'];
   //  capa=json['capa'];
    // id=json['id'];
  //  orderType=json['orderType'];

  }
  Map<String,dynamic> toMap(){
    return {

      "code":code,

      "qty":qty,
      "line":line,
      "operator":operator,
     //  "boxQty":boxQty,
    //   "capa":capa,
     // "orderType":orderType,
      // "id":id,
    };

  }


}