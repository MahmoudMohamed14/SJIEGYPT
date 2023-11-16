class HiringModel{
  String ?note;
  String ?date_interview;

  String?confirm;
  String ?iscall;
  String?startdate;
  String?enddate;
  int?id;
  String?gencode;
  String?code;
  String?locatwork;
  //dowon ok
  String?english_name ;
  String?arabic_name ;
  String?gender;
  String?nId ;
  String?issuing_id;
  String?expired_id;
  String?mob_no;
  String?social_insno;
  String?birth_date;
  String ?mother;
  String?age;
  String?governerate ;
  String?center;
  String?village ;
  String?address;

  String?project;
  String?service ;
  String?title;
  String?category;
  String?social_insamount ;
  String?vest;
  String?shoes_size;
  String?safety_soes;
  String?crocs;
  String?safety_helmet;
  String?ear_blug;
  String?cutter ;

  String? criminal_report;
  String? education_certificate;
  String? military_certificate ;
  String? birth_certificate;
  String? insurance_print ;
  String? nid_copy;
  String? personal_photo;
  String? form_111;
  String? qr_vaccine;



  HiringModel({

    this.note,
    this.confirm='',
    this.date_interview,
    this.iscall='',
    this.startdate='',
    this.gencode,
    this.code,
    this.locatwork,
    this.enddate,

    //ok down
    this.english_name ,
    this.arabic_name ,
    this.gender,
    this.nId ,
    this.issuing_id,
    this.expired_id,
    this.mother,
    this.mob_no,
    this.social_insno,
    this.birth_date,
    this.age,
    this.governerate ,
    this.center,
    this.village="" ,
    this.address="",

    this.project="",
    this.service ="",
    this.title="",
    this.category="",
    this.social_insamount ="",
    this.vest="",
    this.shoes_size="",
    this.safety_soes="",
    this.crocs="",
    this.safety_helmet="",
    this.ear_blug="",
    this.cutter="",

    this.criminal_report="Not Received",
    this.education_certificate="Not Received",
    this.military_certificate ="Not Received",
    this.birth_certificate="Not Received",
    this.insurance_print="Not Received",
    this.nid_copy="Not Received",
    this.personal_photo="Not Received",
    this.form_111="Not Received",
    this.qr_vaccine="Not Received",


  });
  HiringModel.FromJson(Map<String,dynamic>  json){


    note=json['note'];
    confirm=json['confirm'];
    id=json['id'];
    date_interview=json['date_interview'];
    iscall=json['iscall'];
    startdate=json['startdate'];
    enddate=json['enddate'];
    gencode=json['gencode'];
   code=json['code'];
   locatwork=json['locatwork'];

    //ok down
    english_name =json['english_name'];
    arabic_name =json['arabic_name'];
    gender=json['gender'];
    nId =json['nId'];
    mother=json['mother'];
    issuing_id=json['issuing_id'];
    expired_id=json['expired_id'];
    mob_no=json['mob_no'];
    social_insno=json['social_insno'];
    birth_date=json['birth_date'];
    age=json['age'];
    governerate =json['governerate'];
    center=json['center'];
    village =json['village'];
    address=json['address'];

    project=json['project'];
    service =json['service'];
    title=json['title'];
    category=json['category'];
    social_insamount =json['social_insamount'];
    vest=json['vest'];
    shoes_size=json['shoes_size'];
    safety_soes=json['safety_soes'];
    crocs=json['crocs'];
    safety_helmet=json['safety_helmet'];
    ear_blug=json['ear_blug'];
    cutter =json['cutter'];


    criminal_report=json['criminal_report'];
    education_certificate=json['education_certificate'];
    military_certificate =json['military_certificate'];
    birth_certificate=json['birth_certificate'];
    insurance_print =json['insurance_print'];
    nid_copy=json['nid_copy'];
    personal_photo=json['personal_photo'];
    form_111=json['form_111'];
    qr_vaccine=json['qr_vaccine'];

  }
  Map<String,dynamic> toMap(){
return {

  'note':note,
  'confirm':confirm,
  'iscall':iscall,
  'startdate':startdate,
  'enddate':enddate,
  'date_interview':date_interview,
 'gencode':gencode,
 'code':code,
  "locatwork":locatwork,
  //ok down
  'english_name':english_name ,
  'arabic_name':arabic_name ,
  'gender':gender,
  'nId':nId ,
  'mother':mother,
  'issuing_id':issuing_id,
  'expired_id':expired_id,
  'mob_no':mob_no,
  'social_insno':social_insno,
  'birth_date':birth_date,
  'age':age,
  'governerate':governerate,
  'center':center,
  'village':village ,
  'address':address,

  'project':project,
  'service':service ,
  'title':title,
  'category':category,
  'social_insamount':social_insamount ,
  'vest':vest,
  'shoes_size':shoes_size,
  'safety_soes':safety_soes,
  'crocs':crocs,
  'safety_helmet':safety_helmet,
  'ear_blug':ear_blug,
  'cutter':cutter ,


  'criminal_report':criminal_report,
  'education_certificate':education_certificate,
  'military_certificate':military_certificate ,
  'birth_certificate':birth_certificate,
  'insurance_print':insurance_print ,
  'nid_copy':nid_copy,
  'personal_photo':personal_photo,
  'form_111':form_111,
  'qr_vaccine':qr_vaccine,




};
  }
  String valueSearch(){
    return "${code}${nId}${arabic_name}${english_name}${mother}${mob_no}${locatwork}${governerate}${village}${center}${project}${startdate}${birth_date}${gender}${shoes_size}${social_insno}${date_interview}";
  }
}