

class UsersModel{
  String? line;
  String? operator;
  String? password;
  bool ?isAdmin;


  UsersModel({this.line, this.operator, this.password,this.isAdmin});
  UsersModel.fromJson({required Map<String,dynamic> json}){
    line=json['line'];
    operator=json['operator'];
    password=json['password'];

    isAdmin=json['isAdmin'];

  }

  Map<String,dynamic> toMap(){
    return{
      'line':line,
      'operator':operator,
      'password':password,
      'isAdmin':isAdmin,


    };
  }
}