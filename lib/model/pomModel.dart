class PomModel{

  String ?topModel;
  String?parentCode;
  String ?objectDescription;
  String ? component;
   String ? qtyBase;



  PomModel(
      {

        this.component,
        this.parentCode,
        this.objectDescription,
        this.topModel,
        this.qtyBase,
        // this.id,
        // this.boxQty,
        // this.capa
      });

  PomModel.fromJson(Map<String,dynamic>  json){

   component =json['component'];

    parentCode=json['parentCode'];
   objectDescription=json['objectDescription'];
    qtyBase=json['qtyBase'];
     topModel=json['topModel'];
    // capa=json['capa'];
    // id=json['id'];
    // orderType=json['orderType'];

  }
  Map<String,dynamic> toMap(){
    return {

      "component":component,

      "parentCode":parentCode,
      "objectDescription":objectDescription,
      "qtyBase":qtyBase,
      "topModel":topModel,
      // "capa":capa,
      // "orderType":orderType,
      // "id":id,
    };

  }


}