import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/componant/remote/dioHelper.dart';
import 'package:untitled/home.dart';

import 'package:untitled/model/payroll.dart';
import 'package:untitled/model/reviewModel.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';

import 'package:untitled/moduls/attend/getHistory.dart';
import 'package:untitled/moduls/attend/payslipscreen.dart';
import 'package:untitled/moduls/permisssion/deparScreen.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';
import 'package:untitled/shared/constant/color_manager.dart';
import 'package:untitled/shared/constant/icon_broken.dart';

class AttendCubit extends Cubit< AttendStates> {
  AttendCubit() : super( AttendInitState());

  static AttendCubit get(context) {
    return BlocProvider.of(context);
  }
  List<Widget>listScreenHome=[MonthsAttend(),HomeScreen(),MonthsAttend(),DepartScreen()];
  List<Widget>listTitleHome=[Text( "Month PaySlip", style: TextStyle(color:ColorManager.primary , fontSize: 20.0,)),Text('SJI EGYPT',style: TextStyle(color:ColorManager.primary , fontSize: 20.0,)),Text( "Month Review", style: TextStyle(color:ColorManager.primary , fontSize: 20.0,)),Text('Depart',style: TextStyle(color:ColorManager.primary , fontSize: 20.0,))];
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

  List<Widget> listBody=[PaySlipScreen()];
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

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      paySlipList = [];
      print(result.files.first.name);
      filePathPaySlip = result.files.first.path!;

      final input = File(filePathPaySlip!).openRead();
      final fields = await input
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();
     paySlipList  = fields;
      print(fields.length);
      print(paySlipList.length);

     payListModel=[];

      for (int i = 0; i <fields.length; i++) {


          payListModel.add(PaySlipModel(
              code: fields[i][0].toString().trim(),
              name: fields[i][1].toString().trim(),
              job_position: fields[i][2].toString().trim(),
              basic: fields[i][3].toString().trim(),
              // Variable: fields[i][4].toString().trim(),
              // Clothing_Allow: fields[i][5].toString().trim(),
             Meal_Allow: fields[i][4].toString().trim(),
              Transportation: fields[i][5].toString().trim(),
              Productivity_Allow: fields[i][6].toString().trim(),
              Att_Bonus: fields[i][7].toString().trim(),
              Activity_Allow: fields[i][8].toString().trim(),
              Bonus: fields[i][9].toString().trim(),
              Overtime: fields[i][10].toString().trim(),
              Vacation_Balance: fields[i][11].toString().trim(),
              Other_Dues: fields[i][12].toString().trim(),
              Total_Dues: fields[i][13].toString().trim(),
            net_salary:  fields[i][14].toString().trim(),
              EmpSocial_Ins: fields[i][15].toString().trim(),
              Tax: fields[i][16].toString().trim(),
              Absent: fields[i][17].toString().trim(),
              Penalty: fields[i][18].toString().trim(),
             Sick: fields[i][19].toString().trim(),
              WI: fields[i][20].toString().trim(),
             Bonus_Deduction: fields[i][21].toString().trim(),
              Other_Deduction: fields[i][22].toString().trim(),
            total_Deduction: fields[i][23].toString().trim(),
            regular: fields[i][24].toString().trim(),
            casual: fields[i][25].toString().trim(),
            day_absent: fields[i][26].toString().trim(),
            day_Work: fields[i][27].toString().trim(),





          ));



      }

      emit(FetchStateSuccess());
      // print(pomList);
      PlatformFile file = result.files.first;
      print(payListModel.length);

      print(file.name);

      print(file.size);
      print(file.extension);
      print(file.path);
    }


    else {
// User canceled the picker
    }


  }
  pickFileusers() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      paySlipList = [];
      print(result.files.first.name);
      filePathPaySlip = result.files.first.path!;

      final input = File(filePathPaySlip!).openRead();
      final fields = await input
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();
      paySlipList  = fields;
      print(fields.length);
      print(paySlipList.length);



      emit(FetchStateSuccess());
      // print(pomList);
      PlatformFile file = result.files.first;
      print(paySlipList.length);

      print(file.name);

      print(file.size);
      print(file.extension);
      print(file.path);
    }


    else {
// User canceled the picker
    }


  }
  pickFileSuddenNormal() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      suddenNormalList = [];
      print(result.files.first.name);
      filePathSuddenNormal = result.files.first.path!;

      final input = File(filePathSuddenNormal!).openRead();
      final fields = await input
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();
      suddenNormalList  = fields;
      print(fields.length);
      print(suddenNormalList.length);



      emit(FetchStateSuccess());
      // print(pomList);
      PlatformFile file = result.files.first;
      print(suddenNormalList.length);

      print(file.name);

      print(file.size);
      print(file.extension);
      print(file.path);
    }


    else {
// User canceled the picker
    }


  }
  Future waiting(int secnd )async {

    await Future.delayed(Duration(milliseconds: secnd));

  }

  int i=0;
  double valuepross=0;
  addPaySlip(context,{  String? moth, bool  fromdialog = false , int indexx =1}){
    i+=1;
    if(i>1&&fromdialog)  Navigator.pop(context);

    // for( int index = fromdialog?indexx:1;index<=payListModel.length;index++){
    //   Firestore.instance
    //       .collection("userAttend").document("${payListModel[index-1].code}")
    //       .collection('payslip').
    //   document("${months[int.parse(moth!) - 1]}").
    //   set(payListModel[index-1].toMap()).then((value) {});
    //   if(index%200==0&&(payListModel.length-index)>0){
     showDialog(


            barrierDismissible: false,
            context: context, builder: (context) =>
            AlertDialog(

              title: Text('متابعة تحميل الرواتب'),
              content:Directionality(
                textDirection: TextDirection.rtl,
                child: Text("",
                  locale: Locale('ar'),
                ),
              ),

              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                },
                    child: Text('Cancel',
                      style: TextStyle(color: Colors.red),)),

              ],

           ));
    //     break;
    //   }
    //   if(index==payListModel.length){
    //     payListModel.clear();
    //     paySlipList.clear();
    //     emit(AddAttendStateSuccess());
    //   }
    //
    // }
      // payListModel.forEach((element) {
      //
      //     Firestore.instance
      //         .collection("userAttend").document("${element.code}")
      //         .collection('payslip').
      //     document("${months[int.parse(moth!) - 1]}").
      //     set(element.toMap()).then((value) {});
      //
      // });


      // payListModel.clear();
      // paySlipList.clear();
      // emit(AddAttendStateSuccess());
    }
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

  Future insertReviewSql({context})async  {
    valuepross=0;

    for(int i=0;i<PermissionCubit.get(context).reviewListModel.length;i++){
      PermissionCubit.get(context).reviewListModel[i].month=monthindex;
      try{
       Response response=await DioHelper.dio.post('insetreview.php',queryParameters: PermissionCubit.get(context).reviewListModel[i].toMap(),
           onReceiveProgress: (act,total){
         // valuepross=act/total*100;
         // getEmit();



       });
       if(response.statusCode==200){
         print(i);
         valuepross=(i+1)/PermissionCubit.get(context).reviewListModel.length*100;
        // PermissionCubit.get(context).reviewList.removeWhere((element) =>element.contains(PermissionCubit.get(context).reviewListModel[i].code) );
         getEmit();
         print("###############################");
         print(response.data);
         if(valuepross.toInt()==100){
           PermissionCubit.get(context).reviewList.clear();
           getEmit();
         }

         //PermissionCubit.get(context).reviewListModel.removeAt(i);
        // getEmit();
       }
      }catch(error){
        print("resopne "+ error.toString());
      }

      // DioHelper.dio.post('insetreview.php',queryParameters: PermissionCubit.get(context).reviewListModel[i].toMap(),) .then((value) {
      //   var res=json.decode(value.data);
      //   if (value.statusCode == 200 ) {
      //     //paySlipList.removeAt(i);
      //  print(res);
      //    print(value.statusCode);
      //
      //   } else {
      //
      //     print('insert failed: ${value.data}');
      //
      //   }
      // }).catchError((onError){
      //   //emit(LoginErrorState(error: "Login onError"));
      //
      //   print('review onError: ${onError.toString()}');
      //   print(onError);
      // });
      // if(i==PermissionCubit.get(context).reviewListModel.length-1){
      //   emit(InsetSQLSuccess());
      //   // paySlipList.clear();
      // }

      // getEmit();
      // await waiting(10);


    }


  }
  

  int totalAbsent=0;
  int totalPermission=0;
// List<String> listofDay=[];


  ReviewModel ?reviewModel;
  getReview(month){
    emit(LoadReviewStateSuccess());

    reviewModel=null;//PaySlipModel.fromJson({"code":"","name":"","Absent":"","Activity_Allow":"","Att_Bonus":"","basic":"","Bonus":"","Bonus_Deduction":"","EmpSocial_Ins":"","job_position":"","Meal_Allow":"","Other_Deduction":"","Other_Dues":"","Overtime":"","Penalty":"","Productivity_Allow":"","Sick":"","Tax":"","Total_Dues":"","Transportation":"","Vacation_Balance":"","WI":"","total_Deduction":"","regular":"","net_salary":"","day_Work":"","day_absent":"","casual":""});

    DioHelper.dio.get('getreview.php',queryParameters:{
      'code':CacheHelper.getData(key: 'myId'),
      'month':month
    } ).then((value) {
      //
      if (value.statusCode == 200 ) {
        //print(value.data.toString());

        var res=json.decode(value.data);

        if(res.length>0){
          showToast(text: 'GET SUCCESS', state: ToastState.SUCCESS);
          //  print(res);
          reviewModel= ReviewModel.fromJson(res[0]);
          // print(paySlipModel!.toMap());

          emit(GetReviewStateSuccess());



        }

        print(value.statusCode);

      } else {
        emit(GetReviewStateEroor());
        showToast(text: 'ERROR   ', state: ToastState.ERROR);


        print('get failed: ${value.data}');

      }
    }).catchError((onError){
      emit(GetReviewStateEroor());
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
  getPaySlip(month){
    emit(LoadPaySlipStateSuccess());

    paySlipModel=null;//PaySlipModel.fromJson({"code":"","name":"","Absent":"","Activity_Allow":"","Att_Bonus":"","basic":"","Bonus":"","Bonus_Deduction":"","EmpSocial_Ins":"","job_position":"","Meal_Allow":"","Other_Deduction":"","Other_Dues":"","Overtime":"","Penalty":"","Productivity_Allow":"","Sick":"","Tax":"","Total_Dues":"","Transportation":"","Vacation_Balance":"","WI":"","total_Deduction":"","regular":"","net_salary":"","day_Work":"","day_absent":"","casual":""});

        DioHelper.dio.post('getpayslip.php',queryParameters:{
          'code':CacheHelper.getData(key: 'myId'),
          'month':month
        } ).then((value) {
      //
      if (value.statusCode == 200 ) {


        var res=json.decode(value.data);
        if(res.length>0){
          showToast(text: 'GET SUCCESS', state: ToastState.SUCCESS);

        //  print(res);
          paySlipModel= PaySlipModel.fromJson(res[0]);
         // print(paySlipModel!.toMap());

          emit(GetPaySlipStateSuccess());



        }

        print(value.statusCode);

      } else {
        showToast(text: 'ERROR   ', state: ToastState.ERROR);
        emit(GetPaySlipStateError());

        print('get failed: ${value.data}');

      }
    }).catchError((onError){
          showToast(text: 'ERROR   '+onError.toString(), state: ToastState.ERROR);
      //emit(LoginErrorState(error: "Login onError"));
       emit(GetPaySlipStateError());
      print('payslip onError: ${onError.toString()}');
      print(onError);
    });
  }
  int indexHomeButton=1;
  void changeHomeButton(ind,context){
    if(ind==0)getPayOrReview('pay');

    if(ind==2)getPayOrReview('review');
    if(ind==3){
      if(CacheHelper.getData(key: 'control')){
       getDepart();
       // navigateTo(context,DepartScreen());
      }else{
        PermissionCubit.get(context).getOrderPermissionSQL();
        // if(CacheHelper.getData(key: 'control'))   navigateTo(context, LayoutPermission());else navigateTo(context,MyScreen());
       // navigateTo(context,MyScreen());}
    }}
    indexHomeButton=ind;
    emit(ChangeHomeButton());
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
  Future registerSql(
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

}