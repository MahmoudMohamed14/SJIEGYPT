class HiringModel{
  String ? name;
  String ?nId;
  String ?date;
  String?governorate;
  String ?center;
  String ?city;
  String ?note;
  String ?covidNo;
  String?confirm;
  int?id;
  HiringModel({this.name,this.nId,this.governorate,this.city,this.center,this.covidNo,this.date,this.note,this.confirm=''});
  HiringModel.FromJson(Map<String,dynamic>  json){
    name=json['name'];
    nId=json['nId'];
    governorate=json['governorate'];
    center=json['center'];
    city=json['city'];
    covidNo=json['covidNo'];
    date=json['date'];
    note=json['note'];
    confirm=json['confirm'];
    id=json['id'];
  }
  Map<String,dynamic> toMap(){
return {
  'name':name,
  'nId':nId,
  'governorate':governorate,
  'center':center,
  'city':city,
  'covidNo':covidNo,
  'date':date,
  'note':note,
  'confirm':confirm



};
  }
}