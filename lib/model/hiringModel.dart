class HiringModel{
  String ? name;
  String ? ename;
  String ?nId;
  String ?date;
  String?governorate;
  String ?center;
  String ?city;
  String ?note;
  String ?phoneno;
  String?confirm;
  String ?iscall;
  String?startdate;
  String?document;
  int?id;
  String ?mother;
  String?socialnum;
  String?importdate;
  String?exportdate;
  String?gencode;
  String?code;
  String?group;
  String?service;
  String?project;
  String?locatwork;
  String?category;
  String?safety;
  String?crocs;
  String?vest;


  HiringModel({
    this.name,
    this.ename,
    this.nId,
    this.document,
    this.governorate,
    this.city,
    this.center,
    this.phoneno,
    this.date,
    this.note,
    this.confirm='',
    this.iscall='',
    this.startdate='',
    //
    this.socialnum,
    this.category,
    this.mother,
    this.importdate,
    this.exportdate,
    this.gencode,
    this.code,
    this.group,
    this.locatwork,
    this.project,
    this.service,
    this.crocs,
    this.safety,
    this.vest

  });
  HiringModel.FromJson(Map<String,dynamic>  json){
    name=json['name'];
    ename=json['ename'];
    nId=json['nId'];
    governorate=json['governorate'];
    center=json['center'];
    city=json['city'];
   phoneno=json['phoneno'];
    date=json['date'];
    note=json['note'];
    confirm=json['confirm'];
    id=json['id'];
    iscall=json['iscall'];
    startdate=json['startdate'];
    document=json['document'];
  }
  Map<String,dynamic> toMap(){
return {
  'name':name,
  'ename':ename,
  'nId':nId,
  'governorate':governorate,
  'center':center,
  'city':city,
  'phoneno':phoneno,
  'date':date,
  'note':note,
  'confirm':confirm,
  'iscall':iscall,
  'startdate':startdate,
  'document':document



};
  }
}