class ReviewModel{
  String?code;
  String?name;
  String?month;
  String? month_1;
  String? month_2;
  String? month_3;
  String? month_4;
  String? month_5;
  String? month_6;
  String? month_7;
  String? month_8;
  String? month_9;
  String? month_10;
  String? month_11;
  String? month_12;
  String? month_13;
  String? month_14;
  String? month_15;
  String? month_16;
  String? month_17;
  String? month_18;
  String? month_19;
  String? month_20;
  String? month_21;
  String? month_22;
  String? month_23;
  String? month_24;
  String? month_25;
  String? month_26;
  String? month_27;
  String? month_28;
  String? month_29;
  String? month_30;
  String? month_31;
  ReviewModel(
      {
    this.name,
    this.month,
    this.code,
    this.month_1,
    this.month_2,
    this.month_3,
    this.month_4,
    this.month_5,
    this.month_6,
    this.month_7,
    this.month_8,
    this.month_9,
    this.month_10,
    this.month_11,
    this.month_12,
    this.month_13,
    this.month_14,
    this.month_15,
    this.month_16,
    this.month_17,
    this.month_18,
    this.month_19,
    this.month_20,
    this.month_21,
    this.month_22,
    this.month_23,
    this.month_24,
    this.month_25,
    this.month_26,
    this.month_27='',
    this.month_28='',
    this.month_29='',
    this.month_30='',
    this.month_31='',


  });
  ReviewModel.fromJson(Map<String,dynamic>  json){
    name=json['name'];
    code=json['code'];
    month=json['month'];
    month_1=json['month_1'];
    month_2=json['month_2'];
    month_3=json['month_3'];
    month_4=json['month_4'];
    month_5=json['month_5'];
    month_6=json['month_6'];
    month_7=json['month_7'];
    month_8=json['month_8'];
    month_9=json['month_9'];
    month_10=json['month_10'];
    month_11=json['month_11'];
    month_12=json['month_12'];
    month_13=json['month_13'];
    month_14=json['month_14'];
    month_15=json['month_15'];
    month_16=json['month_16'];
    month_17=json['month_17'];
    month_18=json['month_18'];
    month_19=json['month_19'];
    month_20=json['month_20'];
    month_21=json['month_21'];
    month_22=json['month_22'];
    month_23=json['month_23'];
    month_24=json['month_24'];
    month_25=json['month_25'];
    month_26=json['month_26'];
    month_27=json['month_27'];
    month_28=json['month_28'];
    month_29=json['month_29'];
    month_30=json['month_30'];
    month_31=json['month_31'];


  }

  Map<String,dynamic> toMap(){
    return {
      'name':name,
     'code':code,
      'month':month,
      'month_1':month_1,
      'month_2':month_2,
      'month_3':month_3,
      'month_4':month_4,
      'month_5':month_5,
      'month_6':month_6,
      'month_7':month_7,
      'month_8':month_8,
      'month_9':month_9,
      'month_10':month_10,
      'month_11':month_11,
      'month_12':month_12,
      'month_13':month_13,
      'month_14':month_14,
      'month_15':month_15,
      'month_16':month_16,
      'month_17':month_17,
      'month_18':month_18,
      'month_19':month_19,
      'month_20':month_20,
      'month_21':month_21,
      'month_22':month_22,
      'month_23':month_23,
      'month_24':month_24,
      'month_25':month_25,
      'month_26':month_26,
      'month_27':month_27,
      'month_28':month_28,
      'month_29':month_29,
      'month_30':month_30,
      'month_31':month_31,

    };
  }
}