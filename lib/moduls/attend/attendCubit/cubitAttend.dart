import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/componant/remote/dioHelper.dart';
import 'package:untitled/home.dart';
import 'package:untitled/model/payroll.dart';
import 'package:untitled/model/reviewModel.dart';
import 'package:untitled/model/vacationModel.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';
import 'package:untitled/moduls/attend/monthsAttend .dart';
import 'package:untitled/moduls/attend/vacation_screen.dart';
import 'package:untitled/moduls/permisssion/deparScreen.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';
import 'package:untitled/shared/constant/icon_broken.dart';

class AttendCubit extends Cubit< AttendStates> {
  AttendCubit() : super( AttendInitState());

  static AttendCubit get(context) {
    return BlocProvider.of(context);
  }
  String dropValue='SEEG';
  List<String>dropValueList=['SEEG','Silo','Fayoum'];
  void dropButtonChange({vlu}) {
    dropValue = vlu;
    emit(HiringDropState ());
  }
  //review
  String? filePathReview;
  List<ReviewModel> reviewListModel=[];
  List<List<dynamic>> reviewList= [];
  pickFileReview() async {

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       reviewList = [];
//       print(result.files.first.name);
//       filePathReview = result.files.first.path!;
//
//       final input = File(filePathReview!).openRead();
//       final fields = await input
//           .transform(utf8.decoder)
//           .transform(const CsvToListConverter())
//           .toList();
//       reviewList   = fields;
//       print(fields.length);
//       print( reviewList.length);
//
//       reviewListModel=[];
//
//       for (int i = 0; i <fields.length; i++) {
//
//
//         reviewListModel.add(ReviewModel(
//           code: fields[i][0].toString().trim(),
//           name: fields[i][1].toString().trim(),
//           month_1: fields[i][2].toString().trim(),
//           month_2: fields[i][3].toString().trim(),
//           // Variable: fields[i][4].toString().trim(),
//           // Clothing_Allow: fields[i][5].toString().trim(),
//           month_3: fields[i][4].toString().trim(),
//           month_4: fields[i][5].toString().trim(),
//           month_5: fields[i][6].toString().trim(),
//           month_6: fields[i][7].toString().trim(),
//           month_7: fields[i][8].toString().trim(),
//           month_8: fields[i][9].toString().trim(),
//           month_9: fields[i][10].toString().trim(),
//           month_10: fields[i][11].toString().trim(),
//           month_11: fields[i][12].toString().trim(),
//           month_12: fields[i][13].toString().trim(),
//           month_13:  fields[i][14].toString().trim(),
//           month_14: fields[i][15].toString().trim(),
//           month_15: fields[i][16].toString().trim(),
//           month_16: fields[i][17].toString().trim(),
//           month_17: fields[i][18].toString().trim(),
//           month_18: fields[i][19].toString().trim(),
//           month_19: fields[i][20].toString().trim(),
//           month_20: fields[i][21].toString().trim(),
//           month_21: fields[i][22].toString().trim()??'',
//           month_22: fields[i][23].toString().trim()??'',
//           month_23: fields[i][24].toString().trim()??'',
//           month_24: fields[i][25].toString().trim()??'',
//           month_25: fields[i][26].toString().trim()??'',
//           month_26: fields[i][27].toString().trim()??'',
//           month_27: fields[i][28].toString().trim()??'',
//           month_28: fields[i][29].toString().trim()??'',
//           month_29: fields[i][30].toString().trim()??'',
//           month_30: fields[i][31].toString().trim()??'',
//           month_31: fields[i][32].toString().trim()??'',
//           month: '',
//
//
//
//
//
//
//         ));
//
//
//
//       }
//
//       emit(FetchStateSuccess());
//       // print(pomList);
//       PlatformFile file = result.files.first;
//       print(reviewList.length);
//
//       print(file.name);
//
//       print(file.size);
//       print(file.extension);
//       print(file.path);
//     }
//
//
//     else {
// // User canceled the picker
//     }


  }
  //review
  //Vacation
  String? filePathVacation;
  List<VacationModel> vacationListModel=[];
  List<List<dynamic>> vacationList= [];

  pickVacation() async {

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       vacationList = [];
//       print(result.files.first.name);
//       filePathVacation = result.files.first.path!;
//
//       final input = File(filePathVacation!).openRead();
//       final fields = await input
//           .transform(utf8.decoder)
//           .transform(const CsvToListConverter())
//           .toList();
//       vacationList   = fields;
//       print(fields.length);
//       print( vacationList.length);
//
//       vacationListModel=[];
//
//       for (int i = 0; i <fields.length; i++) {
//
//
//         vacationListModel.add(VacationModel(
//           code: fields[i][0].toString().trim(),
//           date1: fields[i][1].toString().trim(),
//           type1: fields[i][2].toString().trim(),
//           date2: fields[i][3].toString().trim(),
//           type2: fields[i][4].toString().trim(),
//           date3: fields[i][5].toString().trim(),
//           type3: fields[i][6].toString().trim(),
//           date4: fields[i][7].toString().trim(),
//           type4: fields[i][8].toString().trim(),
//           date5: fields[i][9].toString().trim(),
//           type5: fields[i][10].toString().trim(),
//           date6: fields[i][11].toString().trim(),
//           type6: fields[i][12].toString().trim(),
//           date7: fields[i][13].toString().trim(),
//           type7:  fields[i][14].toString().trim(),
//           date8: fields[i][15].toString().trim(),
//           type8: fields[i][16].toString().trim(),
//           date9: fields[i][17].toString().trim(),
//           type9: fields[i][18].toString().trim(),
//           date10: fields[i][19].toString().trim(),
//           type10: fields[i][20].toString().trim(),
//           date11: fields[i][21].toString().trim(),
//           type11: fields[i][22].toString().trim()??'',
//           date12: fields[i][23].toString().trim()??'',
//           type12: fields[i][24].toString().trim()??'',
//           date13: fields[i][25].toString().trim()??'',
//           type13: fields[i][26].toString().trim()??'',
//           date14: fields[i][27].toString().trim()??'',
//           type14: fields[i][28].toString().trim()??'',
//           date15: fields[i][29].toString().trim()??'',
//           type15: fields[i][30].toString().trim()??'',
//          date16: fields[i][31].toString().trim()??'',
//           type16: fields[i][32].toString().trim()??'',
//           date17: fields[i][33].toString().trim()??'',
//           type17: fields[i][34].toString().trim()??'',
//           date18: fields[i][35].toString().trim()??'',
//           type18: fields[i][36].toString().trim()??'',
//           date19: fields[i][37].toString().trim()??'',
//           type19: fields[i][38].toString().trim()??'',
//           date20: fields[i][39].toString().trim()??'',
//           type20: fields[i][40].toString().trim()??'',
//           date21: fields[i][41].toString().trim()??'',
//           type21: fields[i][42].toString().trim()??'',
//           date22: fields[i][43].toString().trim()??'',
//           type22: fields[i][44].toString().trim()??'',
//           date23: fields[i][45].toString().trim()??'',
//           type23: fields[i][46].toString().trim()??'',
//           date24: fields[i][47].toString().trim()??'',
//           type24: fields[i][48].toString().trim()??'',
//           date25: fields[i][49].toString().trim()??'',
//           type25: fields[i][50].toString().trim()??'',
//           date26: fields[i][51].toString().trim()??'',
//           type26: fields[i][52].toString().trim()??'',
//           date27: fields[i][53].toString().trim()??'',
//           type27: fields[i][54].toString().trim()??'',
//           date28: fields[i][55].toString().trim()??'',
//           type28: fields[i][56].toString().trim()??'',
//           date29: fields[i][57].toString().trim()??'',
//           type29: fields[i][58].toString().trim()??'',
//           date30: fields[i][59].toString().trim()??'',
//           type30: fields[i][60].toString().trim()??'',
//           date31: fields[i][61].toString().trim()??'',
//          type31: fields[i][62].toString().trim()??'',
//           date32: fields[i][63].toString().trim()??'',
//           type32: fields[i][64].toString().trim()??'',
//           date33: fields[i][65].toString().trim()??'',
//           type33: fields[i][66].toString().trim()??'',
//           date34: fields[i][67].toString().trim()??'',
//           type34: fields[i][68].toString().trim()??'',
//           date35: fields[i][69].toString().trim()??'',
//           type35: fields[i][70].toString().trim()??'',
//           date36: fields[i][71].toString().trim()??'',
//           type36: fields[i][72].toString().trim()??'',
//           date37: fields[i][73].toString().trim()??'',
//           type37: fields[i][74].toString().trim()??'',
//           date38: fields[i][75].toString().trim()??'',
//           type38: fields[i][76].toString().trim()??'',
//           date39: fields[i][77].toString().trim()??'',
//           type39: fields[i][78].toString().trim()??'',
//           date40: fields[i][79].toString().trim()??'',
//          type40: fields[i][80].toString().trim()??'',
//           date41: fields[i][81].toString().trim()??'',
//           type41: fields[i][82].toString().trim()??'',
//           date42: fields[i][83].toString().trim()??'',
//           type42: fields[i][84].toString().trim()??'',
//           date43: fields[i][85].toString().trim()??'',
//           type43: fields[i][86].toString().trim()??'',
//           date44: fields[i][87].toString().trim()??'',
//           type44: fields[i][88].toString().trim()??'',
//           date45: fields[i][89].toString().trim()??'',
//           type45: fields[i][90].toString().trim()??'',
//
//
//
//
//
//
//
//
//         ));
//
//
//
//       }
//
//       emit(FetchStateSuccess());
//       // print(pomList);
//       PlatformFile file = result.files.first;
//       print(reviewList.length);
//
//       print(file.name);
//
//       print(file.size);
//       print(file.extension);
//       print(file.path);
//     }
//
//
//     else {
// // User canceled the picker
//     }


  }
  //vacation
  List<Widget>listScreenHome=[MonthsAttend(),HomeScreen(),MonthsAttend(),VacationScreen(),DepartScreen()];
  List<String>listTitleHome=["Month PaySlip", 'SJI EGYPT',  "Month Review",'Vacation' ,'Depart'];
  List<String>listOfNameMonth=[" January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  List<String>listOfNameMonthArabic=['يناير','فبراير','مارس','أبريل', 'مايو','يونيو', 'يوليو','أغسطس','سبتمبر','أكتوبر','نوفمبر','ديسمبر'];
  List<List<dynamic>> attendList = [];
  int indexBotten = 0;
  void  changeBottomNav({required int index})
  {

    this. indexBotten = index;

    emit( ChangeBottomNavState());
  }

  String? filePathAttend;

  List<List<dynamic>> paySlipList = [];
  List<List<dynamic>> suddenNormalList = [];

 // List<Widget> listBody=[PaySlipScreen()];
  List<String> listTitle=['attendance','PaySlip'];
  List<Widget> listIcons=[Icon(IconBroken.User,),Icon(IconBroken.Wallet,)];

  String? filePathPaySlip;
  String? filePathSuddenNormal;
  List<PaySlipModel> payListModel=[];
  String monthindex='';
  void getmonthindex(idx){
    monthindex=listOfNameMonth[idx];
    getEmit();
  }
//to build aab to add in google play
  pickFilePaySlip() async {

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       paySlipList = [];
//       print(result.files.first.name);
//       filePathPaySlip = result.files.first.path!;
//
//       final input = File(filePathPaySlip!).openRead();
//       final fields = await input
//           .transform(utf8.decoder)
//           .transform(const CsvToListConverter())
//           .toList();
//      paySlipList  = fields;
//       print(fields.length);
//       print(paySlipList.length);
//
//      payListModel=[];
//
//       for (int i = 0; i <fields.length; i++) {
//
//
//           payListModel.add(PaySlipModel(
//               code: fields[i][0].toString().trim(),
//               name: fields[i][1].toString().trim(),
//               job_position: fields[i][2].toString().trim(),
//               basic: fields[i][3].toString().trim(),
//               // Variable: fields[i][4].toString().trim(),
//               // Clothing_Allow: fields[i][5].toString().trim(),
//              Meal_Allow: fields[i][4].toString().trim(),
//               Transportation: fields[i][5].toString().trim(),
//               Productivity_Allow: fields[i][6].toString().trim(),
//               Att_Bonus: fields[i][7].toString().trim(),
//               Activity_Allow: fields[i][8].toString().trim(),
//               Bonus: fields[i][9].toString().trim(),
//               Overtime: fields[i][10].toString().trim(),
//               Vacation_Balance: fields[i][11].toString().trim(),
//               Other_Dues: fields[i][12].toString().trim(),
//               Total_Dues: fields[i][13].toString().trim(),
//             net_salary:  fields[i][14].toString().trim(),
//               EmpSocial_Ins: fields[i][15].toString().trim(),
//               Tax: fields[i][16].toString().trim(),
//               Absent: fields[i][17].toString().trim(),
//               Penalty: fields[i][18].toString().trim(),
//              Sick: fields[i][19].toString().trim(),
//               WI: fields[i][20].toString().trim(),
//              Bonus_Deduction: fields[i][21].toString().trim(),
//               Other_Deduction: fields[i][22].toString().trim(),
//             total_Deduction: fields[i][23].toString().trim(),
//             regular: fields[i][24].toString().trim(),
//             casual: fields[i][25].toString().trim(),
//             day_absent: fields[i][26].toString().trim(),
//             day_Work: fields[i][27].toString().trim(),
//
//
//
//
//
//           ));
//
//
//
//       }
//
//       emit(FetchStateSuccess());
//       // print(pomList);
//       PlatformFile file = result.files.first;
//       print(payListModel.length);
//
//       print(file.name);
//
//       print(file.size);
//       print(file.extension);
//       print(file.path);
//     }
//
//
//     else {
// // User canceled the picker
//     }


  }
  pickFileusers() async {

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       paySlipList = [];
//       print(result.files.first.name);
//       filePathPaySlip = result.files.first.path!;
//
//       final input = File(filePathPaySlip!).openRead();
//       final fields = await input
//           .transform(utf8.decoder)
//           .transform(const CsvToListConverter())
//           .toList();
//       paySlipList  = fields;
//       print(fields.length);
//       print(paySlipList.length);
//
//
//
//       emit(FetchStateSuccess());
//       // print(pomList);
//       PlatformFile file = result.files.first;
//       print(paySlipList.length);
//
//       print(file.name);
//
//       print(file.size);
//       print(file.extension);
//       print(file.path);
//     }
//
//
//     else {
// // User canceled the picker
//     }


  }
  pickFileSuddenNormal() async {

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       suddenNormalList = [];
//       print(result.files.first.name);
//       filePathSuddenNormal = result.files.first.path!;
//
//       final input = File(filePathSuddenNormal!).openRead();
//       final fields = await input
//           .transform(utf8.decoder)
//           .transform(const CsvToListConverter())
//           .toList();
//       suddenNormalList  = fields;
//       print(fields.length);
//       print(suddenNormalList.length);
//
//
//
//       emit(FetchStateSuccess());
//       // print(pomList);
//       PlatformFile file = result.files.first;
//       print(suddenNormalList.length);
//
//       print(file.name);
//
//       print(file.size);
//       print(file.extension);
//       print(file.path);
//     }
//
//
//     else {
// // User canceled the picker
//     }


  }
  Future waiting(int secnd )async {

    await Future.delayed(Duration(milliseconds: secnd));

  }

  int i=0;
  double valuepross=0;
  // addPaySlip(context,{  String? moth, bool  fromdialog = false , int indexx =1}){
  //   i+=1;
  //   if(i>1&&fromdialog)  Navigator.pop(context);
  //
  //   // for( int index = fromdialog?indexx:1;index<=payListModel.length;index++){
  //   //   Firestore.instance
  //   //       .collection("userAttend").document("${payListModel[index-1].code}")
  //   //       .collection('payslip').
  //   //   document("${months[int.parse(moth!) - 1]}").
  //   //   set(payListModel[index-1].toMap()).then((value) {});
  //   //   if(index%200==0&&(payListModel.length-index)>0){
  //   showDialog(
  //
  //
  //       barrierDismissible: false,
  //       context: context, builder: (context) =>
  //       AlertDialog(
  //
  //         title: Text('متابعة تحميل الرواتب'),
  //         content:Directionality(
  //           textDirection: TextDirection.rtl,
  //           child: Text("",
  //             locale: Locale('ar'),
  //           ),
  //         ),
  //
  //         actions: [
  //           TextButton(onPressed: () {
  //             Navigator.pop(context);
  //           },
  //               child: Text('Cancel',
  //                 style: TextStyle(color: Colors.red),)),
  //
  //         ],
  //
  //       ));
  //   //     break;
  //   //   }
  //   //   if(index==payListModel.length){
  //   //     payListModel.clear();
  //   //     paySlipList.clear();
  //   //     emit(AddAttendStateSuccess());
  //   //   }
  //   //
  //   // }
  //   // payListModel.forEach((element) {
  //   //
  //   //     Firestore.instance
  //   //         .collection("userAttend").document("${element.code}")
  //   //         .collection('payslip').
  //   //     document("${months[int.parse(moth!) - 1]}").
  //   //     set(element.toMap()).then((value) {});
  //   //
  //   // });
  //
  //
  //   // payListModel.clear();
  //   // paySlipList.clear();
  //   // emit(AddAttendStateSuccess());
  // }
  Future  insertPaySlipSql()async  {
    emit(AddPaySlipLoadState());
    valuepross=0;
    print('ok'+payListModel.length.toString());

    for(int i=0;i<payListModel.length;i++){
      payListModel[i].month=monthindex;
      try{
        Response response=await DioHelper.dio.post('insertSlip.php',queryParameters: payListModel[i].toMap());
        if(response.statusCode==200){
          print(i);
          valuepross=(i+1)/payListModel.length*100;
          getEmit();
          print("###############################");
          print(response.data);
          if(valuepross.toInt()==100){
            paySlipList.clear();
            emit(AddPaySlipStateSuccess());
          }
        }else{
          print("payupload  Fail"+ response.statusCode.toString());
          emit(AddPaySlipStateError());
        }
      }catch(error){
        print("payupload "+error.toString());
        emit(AddPaySlipStateError());

      }

      // DioHelper.dio.post('insertSlip.php',queryParameters: payListModel[i].toMap()) .then((value) {
      //   var res=json.decode(value.data);
      //   if (value.statusCode == 200 ) {
      //     paySlipList.removeAt(i);
      //
      //
      //    print(res);
      //
      //
      //
      //     print(value.statusCode);
      //
      //   } else {
      //
      //     print('insert failed: ${value.data}');
      //
      //   }
      // }).catchError((onError){
      //   //emit(LoginErrorState(error: "Login onError"));
      //
      //   print('payslip onError: ${onError.toString()}');
      //   print(onError);
      // });
      // if(i==payListModel.length-1){
      //   emit(InsetSQLSuccess());
      //  // paySlipList.clear();
      // }





    }



  }
  Future  insertVacationSql()async  {
    emit(AddVacationLoadState());
    valuepross=0;
    print('ok'+vacationListModel.length.toString());

    for(int i=0;i<vacationListModel.length;i++){

      try{
        Response response=await DioHelper.dio.post('insertVacation.php',queryParameters: vacationListModel[i].toMap());
        if(response.statusCode==200){
          print(i);
          valuepross=(i+1)/vacationListModel.length*100;
          getEmit();
          print("###############################");
          print(response.data);
          if(valuepross.toInt()==100){
            vacationList.clear();
            emit(AddVacationStateSuccess());
          }
        }else{
          print("payupload  Fail"+ response.statusCode.toString());
          emit(AddVacationStateError());
        }
      }catch(error){
        print("payupload "+error.toString());
        emit(AddVacationStateError());

      }

      // DioHelper.dio.post('insertSlip.php',queryParameters: payListModel[i].toMap()) .then((value) {
      //   var res=json.decode(value.data);
      //   if (value.statusCode == 200 ) {
      //     paySlipList.removeAt(i);
      //
      //
      //    print(res);
      //
      //
      //
      //     print(value.statusCode);
      //
      //   } else {
      //
      //     print('insert failed: ${value.data}');
      //
      //   }
      // }).catchError((onError){
      //   //emit(LoginErrorState(error: "Login onError"));
      //
      //   print('payslip onError: ${onError.toString()}');
      //   print(onError);
      // });
      // if(i==payListModel.length-1){
      //   emit(InsetSQLSuccess());
      //  // paySlipList.clear();
      // }





    }



  }

  Future insertReviewSql({context})async  {
    valuepross=0;

    for(int i=0;i<reviewListModel.length;i++){
      reviewListModel[i].month=monthindex;
      try{
        Response response=await DioHelper.dio.post('insetreview.php',queryParameters: reviewListModel[i].toMap(),
            onReceiveProgress: (act,total){
              // valuepross=act/total*100;
              // getEmit();



            });
        if(response.statusCode==200){
          print(i);
          valuepross=(i+1)/reviewListModel.length*100;
          // PermissionCubit.get(context).reviewList.removeWhere((element) =>element.contains(PermissionCubit.get(context).reviewListModel[i].code) );
          getEmit();
          print("###############################");
          print(response.data);
          if(valuepross.toInt()==100){
           reviewList.clear();
            getEmit();
          }

          //PermissionCubit.get(context).reviewListModel.removeAt(i);
          // getEmit();
        }
      }catch(error){
        print("resopne "+ error.toString());
      }



    }


  }
  Future updateReviewSql({context})async  {
    valuepross=0;

    for(int i=0;i<reviewListModel.length;i++){
      reviewListModel[i].month=monthindex;
      try{
        Response response=await DioHelper.dio.post('updatereview.php',queryParameters: reviewListModel[i].toMap(),
            onReceiveProgress: (act,total){
              // valuepross=act/total*100;
              // getEmit();



            });
        if(response.statusCode==200){
          print(i);
          valuepross=(i+1)/reviewListModel.length*100;
          // PermissionCubit.get(context).reviewList.removeWhere((element) =>element.contains(PermissionCubit.get(context).reviewListModel[i].code) );
          getEmit();
          print("###############################");
          print(response.data);
          if(valuepross.toInt()==100){
            reviewList.clear();
            getEmit();
          }

          //PermissionCubit.get(context).reviewListModel.removeAt(i);
          // getEmit();
        }
      }catch(error){
        print("resopne "+ error.toString());
      }



    }


  }



  int totalAbsent=0;
  int totalPermission=0;
// List<String> listofDay=[];


  ReviewModel ?reviewModel;
 Future<ReviewModel ?> getReview(month) async {
  //  emit(LoadReviewStateSuccess());

    reviewModel=null;//PaySlipModel.fromJson({"code":"","name":"","Absent":"","Activity_Allow":"","Att_Bonus":"","basic":"","Bonus":"","Bonus_Deduction":"","EmpSocial_Ins":"","job_position":"","Meal_Allow":"","Other_Deduction":"","Other_Dues":"","Overtime":"","Penalty":"","Productivity_Allow":"","Sick":"","Tax":"","Total_Dues":"","Transportation":"","Vacation_Balance":"","WI":"","total_Deduction":"","regular":"","net_salary":"","day_Work":"","day_absent":"","casual":""});
try{
   Response response=await DioHelper.dio.post('getreview.php',queryParameters:{
      'code':CacheHelper.getData(key: 'myId'),
      'month':month
    } );
   if (response.statusCode == 200 ) {
     //print(value.data.toString());

     var res=json.decode(response.data);

     if(res.length>0){
       showToast(text: 'GET SUCCESS', state: ToastState.SUCCESS);
       //  print(res);
       reviewModel= ReviewModel.fromJson(res[0]);
       // print(paySlipModel!.toMap());

     //  emit(GetReviewStateSuccess());



     }

     print(response.statusCode);
     return reviewModel;

   }else {
     emit(GetReviewStateEroor());
     showToast(text: 'ERROR   ', state: ToastState.ERROR);


     print('get failed: ${response.data}');

   }

    }catch(error){
  emit(GetReviewStateEroor());
  //emit(LoginErrorState(error: "Login onError"));
  showToast(text: 'ERROR   '+onError.toString(), state: ToastState.ERROR);

  print('payslip onError: ${onError.toString()}');
  print(onError);

}
    //    Firestore.instance .collection("userAttend")
    //     .document("${CacheHelper.getData(key: 'myId')}")
    //     .collection('payslip').
    //    document("${months[monthindex]}").get()
    //     .then((value) {
    //       if(value.map!=null){
    //       print(value.map);
    //       paySlipModel= PaySlipModel.fromJson(value.map);
    //       emit(GetPaySlipStateSuccess());}
    //
    // });


  }
  // getvot(){
  //   emit(LoadReviewStateSuccess());
  //
  //   //reviewModel=null;//PaySlipModel.fromJson({"code":"","name":"","Absent":"","Activity_Allow":"","Att_Bonus":"","basic":"","Bonus":"","Bonus_Deduction":"","EmpSocial_Ins":"","job_position":"","Meal_Allow":"","Other_Deduction":"","Other_Dues":"","Overtime":"","Penalty":"","Productivity_Allow":"","Sick":"","Tax":"","Total_Dues":"","Transportation":"","Vacation_Balance":"","WI":"","total_Deduction":"","regular":"","net_salary":"","day_Work":"","day_absent":"","casual":""});
  //
  //   DioHelper.dio.post('getvot.php' ).then((value) async {
  //     //
  //     if (value.statusCode == 200 ) {
  //       //print(value.data.toString());
  //
  //       var res=json.decode(value.data);
  //
  //       if(res.length>0){
  //         final Workbook workbook = Workbook();
  //         final Worksheet sheet = workbook.worksheets[0];
  //        // listOfExcel=  listOfSearch.isNotEmpty?listOfSearch:listModelHiring;
  //
  //         for(int i=0;i<res.length;i++){
  //
  //           if(i==0){
  //             sheet.getRangeByName('A1').setText('Code');
  //             sheet.getRangeByName('B1').setText('Name');
  //             sheet.getRangeByName('C1').setText('size');
  //             sheet.getRangeByName('D1').setText("Location");
  //
  //           }
  //           else{
  //
  //
  //
  //                 sheet.getRangeByName('A${i+1}').setText('${res[i]['code']}');
  //                 sheet.getRangeByName('B${i+1}').setText('${res[i]['name']}');
  //                 sheet.getRangeByName('C${i+1}').setText('${res[i]['size']}');
  //                 sheet.getRangeByName('D${i+1}').setText('${res[i]['location']}');
  //
  //
  //
  //
  //
  //           }
  //
  //
  //
  //
  //
  //         }
  //
  //         final List<int> bytes = workbook.saveAsStream();
  //         workbook.dispose();
  //
  //
  //           final String path = ( await getDownloadsDirectory())!.path;
  //           final String fileName = '$path\\Output.xlsx' ;
  //           final File file = File(fileName);
  //           await file.writeAsBytes(bytes, flush: true);
  //           OpenFile.open(fileName);
  //        // showToast(text: 'GET SUCCESS', state: ToastState.SUCCESS);
  //          print(res);
  //      //   reviewModel= ReviewModel.fromJson(res[0]);
  //         // print(paySlipModel!.toMap());
  //
  //         emit(GetReviewStateSuccess());
  //
  //
  //
  //       }
  //
  //       print(value.statusCode);
  //
  //     } else {
  //       emit(GetReviewStateEroor());
  //       showToast(text: 'ERROR   ', state: ToastState.ERROR);
  //
  //
  //       print('get failed: ${value.data}');
  //
  //     }
  //   }).catchError((onError){
  //     emit(GetReviewStateEroor());
  //     //emit(LoginErrorState(error: "Login onError"));
  //     showToast(text: 'ERROR   '+onError.toString(), state: ToastState.ERROR);
  //
  //     print('payslip onError: ${onError.toString()}');
  //     print(onError);
  //   });
  //   //    Firestore.instance .collection("userAttend")
  //   //     .document("${CacheHelper.getData(key: 'myId')}")
  //   //     .collection('payslip').
  //   //    document("${months[monthindex]}").get()
  //   //     .then((value) {
  //   //       if(value.map!=null){
  //   //       print(value.map);
  //   //       paySlipModel= PaySlipModel.fromJson(value.map);
  //   //       emit(GetPaySlipStateSuccess());}
  //   //
  //   // });
  //
  //
  //
  //
  // }
  // // Future<void> createExcel() async {
  // //   listOfExcel=[];
  // //   final Workbook workbook = Workbook();
  // //   final Worksheet sheet = workbook.worksheets[0];
  // //   listOfExcel=  listOfSearch.isNotEmpty?listOfSearch:listModelHiring;
  // //
  // //   for(int i=0;i<=selectedNID.length;i++){
  // //
  // //     if(i==0){
  // //       sheet.getRangeByName('A1').setText('English Name');
  // //       sheet.getRangeByName('B1').setText('Arabic Name');
  // //       sheet.getRangeByName('C1').setText('NID');
  // //       sheet.getRangeByName('D1').setText("Mother's Name");
  // //       sheet.getRangeByName('E1').setText('Mobile No.');
  // //       sheet.getRangeByName('F1').setText('governerate');
  // //       sheet.getRangeByName('G1').setText('center');
  // //       sheet.getRangeByName('H1').setText('village');
  // //       sheet.getRangeByName('I1').setText('Birth Date');
  // //       sheet.getRangeByName('J1').setText('Issuing Id');
  // //       sheet.getRangeByName('K1').setText('Expired Id');
  // //       sheet.getRangeByName('L1').setText('Social Ins no');
  // //     }
  // //     else{
  // //
  // //       listModelHiring.forEach((element) {
  // //         if(element.nId==selectedNID[i-1]){
  // //           sheet.getRangeByName('A${i+1}').setText('${element.english_name}');
  // //           sheet.getRangeByName('B${i+1}').setText('${element.arabic_name}');
  // //           sheet.getRangeByName('C${i+1}').setText('${element.nId}');
  // //           sheet.getRangeByName('D${i+1}').setText('${element.mother}');
  // //           sheet.getRangeByName('E${i+1}').setText('${element.mob_no}');
  // //           sheet.getRangeByName('F${i+1}').setText('${element.governerate}');
  // //           sheet.getRangeByName('G${i+1}').setText('${element.center}');
  // //           sheet.getRangeByName('H${i+1}').setText('${element.village}');
  // //           sheet.getRangeByName('I${i+1}').setText('${element.birth_date}');
  // //           sheet.getRangeByName('J${i+1}').setText('${element.issuing_id}');
  // //           sheet.getRangeByName('K${i+1}').setText('${element.expired_id}');
  // //           sheet.getRangeByName('L${i+1}').setText('${element.social_insno}');
  // //
  // //         }
  // //       }
  // //       );
  // //
  // //
  // //     }
  // //
  // //
  // //
  // //
  // //
  // //   }
  // //
  // //   final List<int> bytes = workbook.saveAsStream();
  // //   // workbook.dispose();
  // //   //
  // //   //
  // //   //   final String path = ( await getDownloadsDirectory())!.path;
  // //   //   final String fileName = '$path\\Output.xlsx' ;
  // //   //   final File file = File(fileName);
  // //   //   await file.writeAsBytes(bytes, flush: true);
  // //   //   OpenFile.open(fileName);
  // //
  // // }
  VacationModel ?vacationModel;
  int countVacation=0;
  getVacation(){
    vacationModel=null;
    countVacation=0;
    emit(GetVacationLoadState());

    DioHelper.dio.post('getVacation.php',queryParameters:{
      'code':CacheHelper.getData(key: 'myId'),

    } ).then((value) {
      //
      if (value.statusCode == 200 ) {
       // print(value.data.toString());

        var res=json.decode(value.data);

        if(res.length>0){
          vacationModel= VacationModel.fromJson(res[0]);
           for(int i=1;i<=45;i++){
          if(res[0]['date$i']!='-'){
            countVacation+=1;
          }
        //  print(countVacation);

           }

          showToast(text: 'GET SUCCESS', state: ToastState.SUCCESS);
          //  print(res);

          // print(paySlipModel!.toMap());

          emit(GetVacationStateSuccess());



        }

        print(value.statusCode);

      } else {
        emit(GetVacationStateError());
        showToast(text: 'ERROR', state: ToastState.ERROR);


        print('get failed: ${value.data}');

      }
    }).catchError((onError){
      emit(GetVacationStateError());
      //emit(LoginErrorState(error: "Login onError"));
      showToast(text: 'ERROR   '+onError.toString(), state: ToastState.ERROR);

      print('payslip onError: ${onError.toString()}');
      print(onError);
    });
    //    Firestore.instance .collection("userAttend")
    //     .document("${CacheHelper.getData(key: 'myId')}")
    //     .collection('payslip').
    //    document("${months[monthindex]}").get()
    //     .then((value) {
    //       if(value.map!=null){
    //       print(value.map);
    //       paySlipModel= PaySlipModel.fromJson(value.map);
    //       emit(GetPaySlipStateSuccess());}
    //
    // });




  }
  PaySlipModel ?paySlipModel;
 Future<PaySlipModel?>  getPaySlip(month) async {
   // emit(LoadPaySlipStateSuccess());

    paySlipModel=null;//PaySlipModel.fromJson({"code":"","name":"","Absent":"","Activity_Allow":"","Att_Bonus":"","basic":"","Bonus":"","Bonus_Deduction":"","EmpSocial_Ins":"","job_position":"","Meal_Allow":"","Other_Deduction":"","Other_Dues":"","Overtime":"","Penalty":"","Productivity_Allow":"","Sick":"","Tax":"","Total_Dues":"","Transportation":"","Vacation_Balance":"","WI":"","total_Deduction":"","regular":"","net_salary":"","day_Work":"","day_absent":"","casual":""});
try{

  Response response = await   DioHelper.dio.post('getpayslip.php',queryParameters:{
      'code':CacheHelper.getData(key: 'myId'),
      'month':month
    } );
  if (response.statusCode == 200 ) {


    var res=json.decode(response .data);
    if(res.length>0){
      // showToast(text: 'GET SUCCESS', state: ToastState.SUCCESS);

      print(res);
      paySlipModel= PaySlipModel.fromJson(res[0]);
      // print(paySlipModel!.toMap());

      //  emit(GetPaySlipStateSuccess());



    }

    print(response.statusCode);
    return paySlipModel;

  }
  else {
    showToast(text: 'ERROR   ', state: ToastState.ERROR);
    emit(GetPaySlipStateError());

    print('get failed: ${response.data}');

  }
 }catch(eroor){
  showToast(text: 'ERROR   '+onError.toString(), state: ToastState.ERROR);
  //emit(LoginErrorState(error: "Login onError"));
  emit(GetPaySlipStateError());
  print('payslip onError: ${onError.toString()}');
  print(onError);
}
  }
  int indexHomeButton=1;
  void changeHomeButton(ind,context){
    if(ind==0){getPayOrReview('pay');}

    if(ind==2){getPayOrReview('review');}
    if(ind==3){
      indexHomeButton=ind;
      emit(ChangeHomeButton());
      getVacation();
    }
    if(ind==4){
      if(CacheHelper.getData(key: 'control')){
        getDepart();
        // navigateTo(context,DepartScreen());
      }else{
        PermissionCubit.get(context).getOrderPermissionSQL();
        // if(CacheHelper.getData(key: 'control'))   navigateTo(context, LayoutPermission());else navigateTo(context,MyScreen());
        // navigateTo(context,MyScreen());}
      }}

  if(ind!=3) {
    indexHomeButton=ind;
    emit(ChangeHomeButton());
  }
  }

  // void getPermission(){
  //   listOfAttendGl.forEach((element) {
  //     if(element.checkIn!.trim().isEmpty && element.checkOut!.trim().isEmpty) {
  //       totalAbsent += 1;
  //
  //
  //     }
  //     else if(element.checkOut!.isNotEmpty&&int.parse(element.checkOut!.substring(0,element.checkOut!.indexOf(':')))<=16)
  //     {
  //       totalPermission+=1;
  //     }
  //   });
  //   print("permission= "+totalPermission.toString());
  //   print("absent= "+totalAbsent.toString());
  //   emit(GetPermissionAttendState());
  // }


  void getEmit(){
    emit(EmitAttend() );
  }
  bool isScure=true;
  IconData suffix = Icons.visibility_off;
  String isPayORreview='';
  bool editReview=false;
  void getPayOrReview(value){
    isPayORreview=value;
    emit(GetPayOrReviewState() );
  }
  void passwordLogin(){

    isScure = !isScure;
    suffix= isScure?Icons.visibility_off :Icons.visibility;
    emit(LoginPasswordState());

  }

  List<String>myDepartList=[];
  void getDepart(){
    myDepartList=[];
    DioHelper.dio.get('getdepart.php',queryParameters: {
      'code': CacheHelper.getData(key: 'myId'),

    }).then((value) {

      //
      if (value.statusCode == 200 ) {
        var res=json.decode(value.data);
        showToast(text: value.data.toString(), state: ToastState.SUCCESS);
        if(res.length>0){
          print(res);
          res.forEach((element){
            myDepartList.add(element['depart']);
          });

          emit(GetDepartSQLSuccess());

        }

        print(value.statusCode);

      } else {


        print('Login failed: ${value.data}');

      }
    }).catchError((onError){
      emit(LoginErrorState(error: "Login onError"));

      print('Login onError: ${onError.toString()}');
      print(onError);
    });


  }

  Future loginSql(String username, String password,{bool notLogin=false})  async {
    if(username.isNotEmpty&password.isNotEmpty) {
      notLogin ? emit(GetUserLoadingState()) : emit(LoginLoadingState());
      // var url = Uri.parse('https://sjiappeg.sji-eg.com/login.php');// Replace with your PHP script URL
      try {
        Response response = await DioHelper.dio.post('login.php',
            queryParameters: {'code': username, 'password': password});
        if (response.statusCode == 200) {
          var res = json.decode(response.data);
          if (res.length > 0) {
            print(res);
            print(res[0]['normal']);
            CacheHelper.putData(key: 'isLogin', value: true);
            CacheHelper.putData(key: 'myId', value: res[0]['code']);
            CacheHelper.putData(key: 'password', value: res[0]['password']);
            CacheHelper.putData(key: 'isAtt', value: true);
            CacheHelper.putData(key: 'myname', value: res[0]['name']);
            CacheHelper.putData(key: 'depart', value: res[0]['depart']);
            CacheHelper.putData(key: 'normal', value: res[0]['normal']);
            CacheHelper.putData(key: 'sudden', value: res[0]['sudden']);
            CacheHelper.putData(key: 'location', value: res[0]['location']);
            CacheHelper.putData(key: 'controller', value: res[0]['controller']);
            if (res[0]['controller'] == 'true') {
              CacheHelper.putData(key: 'control', value: true);
            } else
              CacheHelper.putData(key: 'control', value: false);

            notLogin ? emit(GETUserSuccessState()) : emit(LoginSuccessState());
          }

          print(response.statusCode);
        } else {
          emit(LoginErrorState(error: " Error !!!!!!!!! "));

          print('Login failed: ${response.data.toString()}');
        }
      } catch (error) {
        emit(LoginErrorState(error: "Login onError : ${error.toString()}"));

        print('Login onError: ${error.toString()}');
        print(onError);
      }
    }

  }
  Future changePasswordSql(String username, String password,context) async {

    try{
      Response response=await  DioHelper.dio.post('updatepassword.php',queryParameters:{'code': username, 'password': password,} );
      if (response.statusCode == 200 && response.data.trim().contains("success" )) {


        await CacheHelper.putData(key: 'password', value: password);
        Navigator.pop(context);
        emit(ChangePasswordSuccessState());
        // print(value.headers);
        print(response.data.trim()); // The response from PHP script
      } else {
        showToast(text: 'code error', state: ToastState.ERROR);
        print('Login failed: ${response.data.trim()}');

      }}catch(error){
      print(error.toString());
      showToast(text: error.toString(), state: ToastState.ERROR);
    }

  }
  Future registerSql(code,name,password,location) async {
    try{
      Response response=await DioHelper.dio.post('register.php',queryParameters: {
        'name': name,
        'code': code,
        'depart': '',
        'password':password,
        'controller': 'false',
        'normal':'0',
        'sudden':'0',
        'location':location
      });
      if(response.statusCode==200){
        loginSql(code, password);
        // print(i);
        //  valuepross=(i+1)/paySlipList.length*100;
        //getEmit();
        print("###############################");
        emit(RegisterSQLSuccessState());
      }
    }catch(error){
      print("payupload "+error.toString());

    }

  }

  Future insertUserSql(
      )  async {
    valuepross=0;

    for(int i=0;i< paySlipList.length;i++){

      try{
        Response response=await DioHelper.dio.post('register.php',queryParameters: {
          'name': paySlipList[i][1].toString(),
          'code': paySlipList[i][0].toString(),
          'depart': paySlipList[i][2].toString(),
          'password': '123456',
          'controller': 'false',
          'normal':'0',
          'sudden':'0'
        });
        if(response.statusCode==200){
          print(i);
          valuepross=(i+1)/paySlipList.length*100;
          getEmit();
          print("###############################");
          print(response.data);
          if(valuepross.toInt()==100){
            paySlipList.clear();
            emit(RegisterSQLSuccessState());
          }
        }
      }catch(error){
        print("payupload "+error.toString());

      }

      // DioHelper.dio.post('insertSlip.php',queryParameters: payListModel[i].toMap()) .then((value) {
      //   var res=json.decode(value.data);
      //   if (value.statusCode == 200 ) {
      //     paySlipList.removeAt(i);
      //
      //
      //    print(res);
      //
      //
      //
      //     print(value.statusCode);
      //
      //   } else {
      //
      //     print('insert failed: ${value.data}');
      //
      //   }
      // }).catchError((onError){
      //   //emit(LoginErrorState(error: "Login onError"));
      //
      //   print('payslip onError: ${onError.toString()}');
      //   print(onError);
      // });
      // if(i==payListModel.length-1){
      //   emit(InsetSQLSuccess());
      //  // paySlipList.clear();
      // }





    }
    // var url = Uri.parse('https://sjeg.seongji-eg.com/register.php');// Replace with your PHP script URL
    //                paySlipList.forEach((element) {
    //                  http.post(url,headers: {'Accept':'application/json'} ,body: {
    //                    'name': element[1].toString(),
    //                    'code': element[0].toString(),
    //                    'depart': element[2].toString(),
    //                    'password': '123456',
    //                    'controller': 'false',
    //                  }).then((value)
    //                  {
    //
    //                    print('=============done ========Ok======');
    //
    //                    //
    //                    print(value.statusCode);
    //                    if (value.statusCode == 200 ) {
    //                      emit(RegisterSQLSuccessState());
    //                      // print(value.headers);
    //                      print(value.body.trim()); // The response from PHP script
    //                    } else {
    //                      print('Login failed: ${value.body}');
    //
    //                    }
    //                  }).catchError((onError)
    //                  {
    //                    print('register onError: ${onError.toString()}');
    //                    print(onError);
    //                  });
    //
    //                });


  }
  Future UpdateSuddenNormalSql(
      )  async {
    valuepross=0;

    for(int i=0;i< suddenNormalList.length;i++){

      try{
        Response response=await DioHelper.dio.post('updatevacation.php',queryParameters: {
          'normal': suddenNormalList[i][1].toString(),
          // 'location': suddenNormalList[i][1].toString(),
          'code': suddenNormalList[i][0].toString(),
          'sudden': suddenNormalList[i][2].toString(),

        });
        if(response.statusCode==200){
          print(i);
          valuepross=(i+1)/suddenNormalList.length*100;
          getEmit();
          print("###############################");
          print(response.data);
          if(valuepross.toInt()==100){
            suddenNormalList.clear();
            emit(UpdateSuddenNormalSQLSuccessState());
          }
        }
      }catch(error){
        print("Sudden Normal upload "+error.toString());

      }







    }


  }
  String valueRadioButton='';
  void onChangeRadioButton(v){
    valueRadioButton=v;
    getEmit();
  }
  Future EditSizeFunction() async {
    emit( SizeLoadingState());
    try{
      Response response = await DioHelper.dio.post('editSize.php', queryParameters: {
        'code': CacheHelper.getData(key: 'myId')??"_" ,
        'size':dropValueSize??'_',}
      );
      if(response.statusCode==200){

        emit(SizeSuccessState());

        // valuepross=(i+1)/suddenNormalList.length*100;
        // getEmit();
        print("###############################");
        print(response.data);

      }else{
        emit(SizeErrorState());
      }
    }catch(error){
      print("Vot "+error.toString());
      emit(SizeErrorState());
    }
  }
  Future votFunction(context) async {
    emit( SizeLoadingState());
    try{
      Response response = await DioHelper.dio.post('size.php', queryParameters: {
        'code': CacheHelper.getData(key: 'myId')??"_" ,
        'location': CacheHelper.getData(key: 'location')??'_',
        'size':dropValueSize??'_',
        'name':CacheHelper.getData(key: 'myname').toString().replaceAll("'", "")??'_'}
      );
      if(response.statusCode==200){
        if(response.data.toString().contains("Success Size Incert")){

          CacheHelper.putData(key: 'size${CacheHelper.getData(key: 'myId')}',value:  true );
          emit(SizeSuccessState());
          showDialog(
              barrierDismissible: false,
              context: context,
              builder:(context )=>AlertDialog(

                backgroundColor:Colors.grey,

                title: Text('شكرا لك تم التسجيل ',style: TextStyle(color: Colors.white),),
                // content:  Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Center(child: CircularProgressIndicator()),
                //     // state is HiringAddErrorState? Text('تم الفحص الكود من قبل !!',style: TextStyle(color: Colors.white)):SizedBox(),
                //   ],
                // ),
                actions: [
                  TextButton(onPressed: (){
                    //emit(FinishSCanStateSuccess());
                    // duplicated=false;
                    // emitState();

                    Navigator.of(context).pop(true);

                  }, child: Text('Cancel',style: TextStyle(color: Colors.white),)),


                ],

              ));
        }
        print(i);
        // valuepross=(i+1)/suddenNormalList.length*100;
       // getEmit();
        print("###############################");
        print(response.data);

      }else{
        emit(SizeErrorState());
      }
    }catch(error){
      showDialog(
          barrierDismissible: false,
          context: context,
          builder:(context )=>AlertDialog(

            backgroundColor:Colors.grey,

            title: Text('لم يتم التسجيل حاول مره اخره',style: TextStyle(color: Colors.white),),
            // content:  Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Center(child: CircularProgressIndicator()),
            //     // state is HiringAddErrorState? Text('تم الفحص الكود من قبل !!',style: TextStyle(color: Colors.white)):SizedBox(),
            //   ],
            // ),
            actions: [
              TextButton(onPressed: (){
                //emit(FinishSCanStateSuccess());
                // duplicated=false;
                // emitState();

                Navigator.of(context).pop(true);

              }, child: Text('Cancel',style: TextStyle(color: Colors.white),)),


            ],

          ));
      print("Vot "+error.toString());
      emit(SizeErrorState());
    }
  }
  String dropValueSize='';
  List<String>dropValueSizeList=['','Medium','Large','XLarge','2XLarge','3XLarge'];
  void dropButtonChangeSize({vlu}) {
    dropValueSize = vlu;
    emit(HiringDropState ());
  }

}