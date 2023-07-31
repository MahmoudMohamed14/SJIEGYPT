class PaySlipModel{
 String? code;
 String? name	;
 String?job_position;
 String? basic;
 // String?Variable	;
 // String?Clothing_Allow;
 String?Meal_Allow;
 String?Transportation;
 String?Productivity_Allow;
 String?Att_Bonus;
 String?Activity_Allow;
 String?Bonus;
 String?Overtime;
 String?Vacation_Balance;
 String?Other_Dues;
 String?Total_Dues;
 String?EmpSocial_Ins;
 String?Tax;
 String?Absent;
 String?Penalty	;
 String?Sick;
 String?WI;
 String?Bonus_Deduction;
 String?Other_Deduction;
 String?net_salary	;
 String?day_Work;
 String?day_absent;
 String?total_Deduction;
 String?casual;
 String?regular;

 PaySlipModel(
     {

this.code,
       this.total_Deduction,
       this.regular,
 this.job_position,
       this.casual,
       this.day_absent,
       this.day_Work,
       this.net_salary,
 this.name,
 this.Absent,
 this.Activity_Allow,
 this.Att_Bonus,
 this.basic,
 this.Bonus,
 this.Bonus_Deduction,
 // this.Clothing_Allow,
 this.EmpSocial_Ins,

 this.Meal_Allow,
 this.Other_Deduction,
 this.Other_Dues,
 this.Overtime,
 this.Penalty,
 this.Productivity_Allow,
 this.Sick,
 this.Tax,
 this.Total_Dues,
 this.Transportation,
 this.Vacation_Balance,
 // this.Variable,
 this.WI,


});
 PaySlipModel.fromJson(Map<String,dynamic>json){

   code=json['code'];



  name=json['name'];
  Absent=json['Absent'];
   Activity_Allow=json['Activity_Allow'];
   Att_Bonus=json['Att_Bonus'];
   basic=json['basic'];

   Bonus=json['Bonus'];

   Bonus_Deduction=json['Bonus_Deduction'];
   // Clothing_Allow=json['Clothing_Allow'];
  EmpSocial_Ins =json['EmpSocial_Ins'];
   job_position=json['job_position'];
   Meal_Allow=json['Meal_Allow'];
  Other_Deduction=json['Other_Deduction'];
   Other_Dues=json['Other_Dues'];
   Overtime=json['Overtime'];
   Penalty=json['Penalty'];
   Productivity_Allow=json['Productivity_Allow'];
  Sick=json['Sick'];
   Tax=json['Tax'];
   Total_Dues =json['Total_Dues'];
   Transportation=json['Transportation'];
   Vacation_Balance=json['Vacation_Balance'];
    WI=json['WI'];
  // Variable=json['Variable'];
   total_Deduction=json['total_Deduction'];
   regular =json['regular'];
   net_salary=json['net_salary'];
   day_Work=json['day_Work'];
  day_absent=json['day_absent'];
   casual=json['casual'];

 }
 Map<String,dynamic> toMap(){
   return {

   'code':code,




   'name':name,
  'Absent': Absent,
   'Activity_Allow': Absent,
 'Att_Bonus':Att_Bonus,
   'basic':basic,

   'Bonus':Bonus,
 "Bonus_Deduction":Bonus_Deduction,
   // "Clothing_Allow":Clothing_Allow,
   "EmpSocial_Ins" :EmpSocial_Ins,
   "job_position":job_position,
   "Meal_Allow":Meal_Allow,
   "Other_Deduction":Other_Deduction,
   "Other_Dues":Other_Dues,
   "Overtime":Overtime,
   "Penalty":Penalty,
   "Productivity_Allow":Productivity_Allow,
   "Sick":Sick,
   "Tax":Tax,
   "Total_Dues":Total_Dues,
   "Transportation":Transportation,

   "Vacation_Balance":Vacation_Balance,
   "WI":WI,
   // 'Variable':Variable,
     "total_Deduction":total_Deduction,
   'regular': regular,

    'casual':casual,
     'day_absent':day_absent,
    'day_Work':day_Work,
     'net_salary':net_salary,
   };

 }

}