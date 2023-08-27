import 'dart:convert';
import 'dart:io';

// import 'package:csv/csv.dart';
//  import 'package:file_picker/file_picker.dart';

import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/model/attendModel.dart';
import 'package:untitled/model/payroll.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';
import 'package:untitled/moduls/attend/attend_Sceen.dart';
import 'package:untitled/moduls/attend/payslipscreen.dart';
import 'package:untitled/shared/constant/icon_broken.dart';

class AttendCubit extends Cubit< AttendStates> {
  AttendCubit() : super( AttendInitState());

  static AttendCubit get(context) {
    return BlocProvider.of(context);
  }
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
  List<AttendModel> listModel=[];
  List<List<dynamic>> paySlipList = [];

  List<Widget> listBody=[AttendScreen(),PaySlipScreen()];
  List<String> listTitle=['attendance','PaySlip'];
  List<Widget> listIcons=[Icon(IconBroken.User,),Icon(IconBroken.Wallet,)];

  String? filePathPaySlip;
  List<PaySlipModel> payListModel=[];
  String monthindex='';
  void getmonthindex(idx){
    monthindex=listOfNameMonth[idx];
    getEmit();
  }
//to build aab to add in google play
  pickFilePaySlip() async {
    //
    // FilePickerResult? result = await FilePicker.platform.pickFiles();
    //
    // if (result != null) {
    //   paySlipList = [];
    //   print(result.files.first.name);
    //   filePathPaySlip = result.files.first.path!;
    //
    //   final input = File(filePathPaySlip!).openRead();
    //   final fields = await input
    //       .transform(utf8.decoder)
    //       .transform(const CsvToListConverter())
    //       .toList();
    //  paySlipList  = fields;
    //   print(fields.length);
    //   print(paySlipList.length);
    //
    //  payListModel=[];
    //
    //   for (int i = 0; i <fields.length; i++) {
    //
    //
    //       payListModel.add(PaySlipModel(
    //           code: fields[i][0].toString().trim(),
    //           name: fields[i][1].toString().trim(),
    //           job_position: fields[i][2].toString().trim(),
    //           basic: fields[i][3].toString().trim(),
    //           // Variable: fields[i][4].toString().trim(),
    //           // Clothing_Allow: fields[i][5].toString().trim(),
    //          Meal_Allow: fields[i][4].toString().trim(),
    //           Transportation: fields[i][5].toString().trim(),
    //           Productivity_Allow: fields[i][6].toString().trim(),
    //           Att_Bonus: fields[i][7].toString().trim(),
    //           Activity_Allow: fields[i][8].toString().trim(),
    //           Bonus: fields[i][9].toString().trim(),
    //           Overtime: fields[i][10].toString().trim(),
    //           Vacation_Balance: fields[i][11].toString().trim(),
    //           Other_Dues: fields[i][12].toString().trim(),
    //           Total_Dues: fields[i][13].toString().trim(),
    //         net_salary:  fields[i][14].toString().trim(),
    //           EmpSocial_Ins: fields[i][15].toString().trim(),
    //           Tax: fields[i][16].toString().trim(),
    //           Absent: fields[i][17].toString().trim(),
    //           Penalty: fields[i][18].toString().trim(),
    //          Sick: fields[i][19].toString().trim(),
    //           WI: fields[i][20].toString().trim(),
    //          Bonus_Deduction: fields[i][21].toString().trim(),
    //           Other_Deduction: fields[i][22].toString().trim(),
    //
    //         total_Deduction: fields[i][23].toString().trim(),
    //         regular: fields[i][24].toString().trim(),
    //         casual: fields[i][25].toString().trim(),
    //         day_absent: fields[i][26].toString().trim(),
    //         day_Work: fields[i][27].toString().trim(),
    //
    //
    //
    //
    //
    //       ));
    //
    //
    //
    //   }
    //
    //   emit(FetchStateSuccess());
    //   // print(pomList);
    //   PlatformFile file = result.files.first;
    //   print(paySlipList.length);
    //
    //   print(file.name);
    //
    //   print(file.size);
    //   print(file.extension);
    //   print(file.path);
    // }


//     else {
// // User canceled the picker
//     }


  }
  Future waiting(int secnd )async {

    await Future.delayed(Duration(seconds: secnd,));

  }
//   pickFileAttend() async {
//
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       attendList = [];
//       print(result.files.first.name);
//       filePathAttend = result.files.first.path!;
//
//       final input = File(filePathAttend!).openRead();
//       final fields = await input
//           .transform(utf8.decoder)
//           .transform(const CsvToListConverter())
//           .toList();
//       attendList  = fields;
//       print(fields.length);
//     //  attendMap=[];
//       listModel=[];
//
//       for (int i = 0; i <fields.length; i++) {
//         if(i!=0) {
//           listModel.add(AttendModel(
//               id: fields[i][0].toString().trim(),
//               depart: fields[i][1].toString().trim(),
//               name: fields[i][2].toString().trim(),
//               date: fields[i][3].toString().trim(),
//               checkIn: fields[i][4].toString().trim(),
//               checkOut: fields[i][5].toString().trim()
//
//
//           ));
//         }
//
//
//       }
//
//
//
//
//       emit(FetchStateSuccess());
//       // print(pomList);
//       PlatformFile file = result.files.first;
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
//
//
//   }
  addAttendance({  String? day,required bool edit,required bool del}){
    if(del)deleteAddend(day);
    else {
      listModel.forEach((element) {

         // Firestore.instance
         //    .collection("userAttend").document("${element.id}").update({'name':element.name});
        // String name='5x10x2023';
        // print(name.indexOf('',3));
        // print(name.substring(name.indexOf('x')+1,name.indexOf('x',3)));

        if (edit) {
          Firestore.instance
              .collection("userAttend").document("${element.id}")
              .collection("${months[DateTime
              .now()
              .month - 1]}").
          document("${day}").
          set(element.toMap()).then((value) {

          });

        }

        else {
          // Firestore.instance
          //    .collection("userAttend").document("${element.id}").update({'name':element.name,'id':element.id,'password':'123456'});

          Firestore.instance
              .collection("userAttend").document("${element.id}")
              .collection("${months[DateTime
              .now()
              .month - 1]}").
          document("${element.date!.substring(element.date!.indexOf('/')+1,element.date!.indexOf('/',3))}").
          set(element.toMap()).then((value) {});
        }
      });

      listModel.clear();
      attendList.clear();
      emit(AddAttendStateSuccess());
    }



  }
  int i=0;
  addPaySlip(context,{  String? moth, bool  fromdialog = false , int indexx =1}){
    i+=1;
    if(i>1&&fromdialog)  Navigator.pop(context);
  
    for( int index = fromdialog?indexx:1;index<=payListModel.length;index++){
      Firestore.instance
          .collection("userAttend").document("${payListModel[index-1].code}")
          .collection('payslip').
      document("${months[int.parse(moth!) - 1]}").
      set(payListModel[index-1].toMap()).then((value) {});
      if(index%200==0&&(payListModel.length-index)>0){
        showDialog(


            barrierDismissible: false,
            context: context, builder: (context) =>
            AlertDialog(

              title: Text('متابعة تحميل الرواتب'),
              content:Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'لقد تم رفع $index ومتبقي ${ payListModel.length - index}ويجب عليك الضغط علي تاكيد حتي يتم الانتهاء من التحميل   '
                  ,
                  locale: Locale('ar'),
                ),
              ),

              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                },
                    child: Text('Cancel',
                      style: TextStyle(color: Colors.red),)),
                TextButton(onPressed: () {
                  print('تاكيد');
                  addPaySlip( context ,moth: moth,indexx: index+1,fromdialog: true);

                }, child: Text('تاكيد')),

              ],

            ));
        break;
      }
      if(index==payListModel.length){
        payListModel.clear();
        paySlipList.clear();
        emit(AddAttendStateSuccess());
      }
      
    }
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
    insertPaySlipSql(){
      var url=Uri.parse('https://sjeg.seongji-eg.com/insertSlip.php');
      payListModel.forEach((element) {
        element.month=monthindex;
        http.post(url,headers: {'Accept':'application/json',} ,body:element.toMap() ).then((value) {
          //
          if (value.statusCode == 200 ) {
            var res=json.decode(value.body);
            if(res.length>0){




            }

            print(value.statusCode);

          } else {


            print('get failed: ${value.body}');

          }
        }).catchError((onError){
          //emit(LoginErrorState(error: "Login onError"));

          print('payslip onError: ${onError.toString()}');
          print(onError);
        });
      });
      // FirebaseFirestore.instance

    }
  
    void addUser({context, bool  fromdialog = false , int indexx =1}){

    i+=1;
    if(i>1&&fromdialog)  Navigator.pop(context);


    for( int index = fromdialog?indexx:1;index<=paySlipList.length;index++){

        Firestore.
        instance.
        collection("userAttend").document("${paySlipList[index-1][0]}").update({'id':"${paySlipList[index-1][0]}",'name':"${paySlipList[index-1][1]}",'depart':"${paySlipList[index-1][2]}",'controller':false})
            .then((value) {print(index.toString());}).catchError((onError){
              print(onError.toString()+" int = $index");
        });
           if(index%200==0&&(paySlipList.length-index)>0){

               showDialog(


                   barrierDismissible: false,
                   context: context, builder: (context) =>
                   AlertDialog(
                     content:Directionality(
                       textDirection: TextDirection.rtl,
                       child: Text(
                         'لقد تم رفع $index ومتبقي ${ paySlipList.length - index}ويجب عليك الضغط علي تاكيد حتي يتم الانتهاء من التحميل   '
                         ,
                         locale: Locale('ar'),
                       ),
                     ),


                     title: Text('test  $index   test $i'),

                     actions: [
                       TextButton(onPressed: () {
                         Navigator.pop(context);
                       },
                           child: Text('Cancel',
                             style: TextStyle(color: Colors.red),)),
                       TextButton(onPressed: () {
                         print('تاكيد');
                         addUser(context: context ,indexx: index+1,fromdialog: true);

                       }, child: Text('تاكيد')),

                     ],

                   ));



             break;
           }


    }
    }






  int totalAbsent=0;
  int totalPermission=0;
// List<String> listofDay=[];

  getAttendance({String id='',required bool isadmin,month}){
totalAbsent=0;
totalPermission=0;
    listOfAttendGl=[];
   // listofDay=[];
    emit(LoadingGetAttendStateSuccess());
    Firestore.instance
        .collection("userAttend").document(isadmin?id :"${CacheHelper.getData(key: 'myId')}")
        .collection("${months[month]}").orderBy('date').get().then((value)  {
     List x= List.generate(value.length, (index) => {'key':int.parse(value[index].id),'dec':value[index].map});

    x.sort((a, b) => a['key']!.compareTo(b['key']),);



          x.forEach((element) {
          //  listofDay.add(element.id);
            listOfAttendGl.add(AttendModel.fromJson(element['dec']));
          });

     getPermission();
          emit(GetAttendStateSuccess());


    });

  }
  PaySlipModel ?paySlipModel;
  getPaySlip(month){
    paySlipModel=null;
    var url=Uri.parse('https://sjeg.seongji-eg.com/getpayslip.php');
    // FirebaseFirestore.instance
    http.post(url,headers: {'Accept':'application/json',} ,body:{
      'code':CacheHelper.getData(key: 'myId'),
      'month':month
    } ).then((value) {
      //
      if (value.statusCode == 200 ) {
        var res=json.decode(value.body);

        if(res.length>0){
        //  print(res);
          paySlipModel= PaySlipModel.fromJson(res[0]);
         // print(paySlipModel!.toMap());

          emit(GetPaySlipStateSuccess());



        }

        print(value.statusCode);

      } else {


        print('get failed: ${value.body}');

      }
    }).catchError((onError){
      //emit(LoginErrorState(error: "Login onError"));

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

  void getPermission(){
    listOfAttendGl.forEach((element) {
      if(element.checkIn!.trim().isEmpty && element.checkOut!.trim().isEmpty) {
        totalAbsent += 1;


      }
      else if(element.checkOut!.isNotEmpty&&int.parse(element.checkOut!.substring(0,element.checkOut!.indexOf(':')))<=16)
      {
        totalPermission+=1;
      }
    });
    print("permission= "+totalPermission.toString());
    print("absent= "+totalAbsent.toString());
    emit(GetPermissionAttendState());
  }

  deleteAddend(day){
    listOfAttenduserGl.forEach((element) {
      Firestore.instance
          .collection("userAttend").document("${element['id']}")
          .collection("${months[DateTime.now().month-1]}").document(day).delete().then((value)  {

      });
    });

    emit(DeleteAttendStateSuccess());


  }
  void getEmit(){
   emit(EmitAttend() );
  }

  getAttendanceHistory({required String id,required String month}){
    totalAbsent=0;
    totalPermission=0;
    listOfAttendGl=[];
    // listofDay=[];
    emit(LoadingGetAttendStateSuccess());
    Firestore.instance
        .collection("userAttend").document(id)
        .collection("${months[int.parse(month)-1]}").get().then((value)  {
      List x= List.generate(value.length, (index) => {'key':int.parse(value[index].id),'dec':value[index].map});

      x.sort((a, b) => a['key']!.compareTo(b['key']),);



      x.forEach((element) {
        //  listofDay.add(element.id);
        listOfAttendGl.add(AttendModel.fromJson(element['dec']));
      });

      getPermission();
      emit(GetAttendStateSuccess());


    });






  }
  getAttendanceUser(){
    listOfAttenduserGl=[];
    Firestore.instance
        .collection("userAttend").get().then((value) {

          print('++++++++++++++++value her getAttendanceUser ++++++++++++++++++++++');
          print(value.length);
      print('++++++++++++++++value her getAttendanceUser ++++++++++++++++++++++');

      value.forEach((element) {
        listOfAttenduserGl.add(element.map);

      });
       print(listOfAttenduserGl);
      emit(GetAttendUserSuccess());
    }).catchError((onError){
      emit(GetAttendUserError());
      print(onError.toString());
    });}
  deletAttendanceUser(id){

    Firestore.instance
        .collection("userAttend").document(id).delete().then((value) {

      print('++++++++++++++++value her getAttendanceUser ++++++++++++++++++++++');




      emit(DeleteAttendStateSuccess());
    }).catchError((onError){
      emit(GetAttendUserError());
      print(onError.toString());
    });




  }

  bool isScure=true;
  IconData suffix = Icons.visibility_off;
  void passwordLogin(){

    isScure = !isScure;
    suffix= isScure?Icons.visibility_off :Icons.visibility;
    emit(LoginPasswordState());

  }
  getUserData(id){
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(id).get().then((value) {
    //
    //   CacheHelper.putData(key: 'admin', value: value.data()!['isAdmin']);
    //   if(value.data()!['requestAdmin']!=null) requestAdmin=value.data()!['requestAdmin'];
    //
    //   if(value.data()!['superAdmin']!=null) superAdmin=value.data()!['superAdmin'];
    //
    //
    //
    //   emit(LoginSuccessState( ));
    //
    //   print(value.data()!['name']);
    //
    // }).catchError((onError){
    //   emit(GetUserDataErrorState());
    // });
  }
  void login({
    required String password,
    required String email,

  }){
    emit(LoginLoadingState());

    if(Platform.isWindows){
      Firestore.instance.collection("userAttend")
          .document(email)
          .get().then((value) {
        if (value.map!= null) {
          if (value.map['id'] == email &&
              value.map['password'] == password) {
            CacheHelper.putData(key: 'isLogin', value: true);
            CacheHelper.putData(key: 'myId', value: value.map['id']);
            CacheHelper.putData(key: 'isAtt', value: true);
            CacheHelper.putData(key: 'myname', value: value.map['name']);
            if (value.map['controller'] != null) {
              CacheHelper.putData(key: 'control', value: true);
              CacheHelper.putData(
                  key: 'depart', value: value.map['depart']);
            } else
              CacheHelper.putData(key: 'control', value: false);

            emit(LoginSuccessState());
          } else
            emit(LoginErrorState(error: " Password Error"));
        }
      }).catchError((onError) {
        print('from error ====================' + onError.toString());
        emit(LoginErrorState(error: " Code Error Or Internet Error "));
      });

    }else {
      // FirebaseFirestore.instance.collection("userAttend")
      //     .doc(email)
      //     .get().then((value) {
      //   if (value.data() != null) {
      //     if (value.data()!['id'] == email &&
      //         value.data()!['password'] == password) {
      //       CacheHelper.putData(key: 'isLogin', value: true);
      //       CacheHelper.putData(key: 'myId', value: value.data()!['id']);
      //       CacheHelper.putData(key: 'isAtt', value: true);
      //       CacheHelper.putData(key: 'myname', value: value.data()!['name']);
      //       if (value.data()!['controller'] != null) {
      //         CacheHelper.putData(key: 'control', value: true);
      //         CacheHelper.putData(
      //             key: 'depart', value: value.data()!['depart']);
      //       } else
      //         CacheHelper.putData(key: 'control', value: false);
      //
      //       emit(LoginSuccessState());
      //     } else
      //       emit(LoginErrorState(error: " Password Error"));
      //   }
      // }).catchError((onError) {
      //   print('from error ====================' + onError.toString());
      //   emit(LoginErrorState(error: " Code Error Or Internet Error "));
      // });
    }
    // listofUsers.forEach((element) {
    //   if(element.line==email && element.password==password){
    //     CacheHelper.putData(key: 'isLogin', value: true);
    //     CacheHelper.putData(key: 'line', value: element.line);
    //     CacheHelper.putData(key: 'isAdmin', value: element.isAdmin);
    //     emit(LoginSuccessState());
    //
    //   }else{
    //
    //   }
    // });
    // listOfAttenduserGl.forEach((element) {
    //   if(element['id']==email && element['password']==password){
    //     CacheHelper.putData(key: 'isLogin', value: true);
    //     CacheHelper.putData(key: 'myId', value: element['id']);
    //     CacheHelper.putData(key: 'isAtt', value: true);
    //     CacheHelper.putData(key: 'myname', value: element['name']);
    //     if(element['controller']!= null) {
    //       CacheHelper.putData(key: 'control', value: true);
    //       CacheHelper.putData(key: 'depart', value: element['depart']);
    //     }else CacheHelper.putData(key: 'control', value: false);
    //
    //     emit(LoginAttendSuccessState());
    //
    //   }else{
    //    // emit(LoginErrorState(error: "UserName Or Password Error"));
    //
    //   }
    //
    //
    // });
    // if(  CacheHelper.getData(key: 'isLogin')==null)emit(LoginErrorState(error: "UserName Or Password Error"));


    // FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
    //  getUserData(value.user!.uid);
    //  uId=value.user!.uid;
    //   CacheHelper.putData(key: 'uId', value: value.user!.uid);
    //
    //   uId=value.user!.uid;
    //
    //
    //
    //
    //
    // }).catchError((error){
    //   print('error Login'+error.toString());
    //   emit(LoginErrorState(error: error.toString()));
    //
    // });


  }
  List<String>myDepartList=[];
  void getDepart(){
    //emit(LoginLoadingState());
    var url = Uri.parse('https://sjeg.seongji-eg.com/getdepart.php');// Replace with your PHP script URL

    http.post(url,headers: {'Accept':'application/json'} ,body: {
      'code': CacheHelper.getData(key: 'myId'),

    }).then((value) {
      myDepartList=[];
      //
      if (value.statusCode == 200 ) {
        var res=json.decode(value.body);
        if(res.length>0){
          print(res);
         res.forEach((element){
           myDepartList.add(element['depart']);
         });

         emit(GetDepartSQLSuccess());

        }

        print(value.statusCode);

      } else {


        print('Login failed: ${value.body}');

      }
    }).catchError((onError){
      emit(LoginErrorState(error: "Login onError"));

      print('Login onError: ${onError.toString()}');
      print(onError);
    });


  }
  loginSql(String username, String password)  {
    emit(LoginLoadingState());
    var url = Uri.parse('https://sjeg.seongji-eg.com/login.php');// Replace with your PHP script URL

    http.post(url,headers: {'Accept':'application/json'} ,body: {
      'code': username,
      'password': password,
    }).then((value) {
      //
      if (value.statusCode == 200 ) {
        var res=json.decode(value.body);
        if(res.length>0){
          print(res);
          CacheHelper.putData(key: 'isLogin', value: true);
          CacheHelper.putData(key: 'myId', value: res[0]['code']);
          CacheHelper.putData(key: 'password', value: res[0]['password']);
          CacheHelper.putData(key: 'isAtt', value: true);
          CacheHelper.putData(key: 'myname', value: res[0]['name']);
          CacheHelper.putData(key: 'depart', value: res[0]['depart']);
          if (res[0]['controller'] == 'true') {
            CacheHelper.putData(key: 'control', value: true);

          } else
            CacheHelper.putData(key: 'control', value: false);

          emit(LoginSuccessState());

        }

        print(value.statusCode);

      } else {
        emit(LoginErrorState(error: " Error !!!!!!!!! "));

        print('Login failed: ${value.body}');

      }
    }).catchError((onError){
      emit(LoginErrorState(error: "Login onError"));

      print('Login onError: ${onError.toString()}');
      print(onError);
    });


  }
  void changePassword({code, newPassword, context}){
    Firestore.instance
        .collection("userAttend").document("${code}").update({'password':"${newPassword}"})
        .then((value) {
      // AddPomCubit.get(context).getAttendanceUser();


      emit(ChangePasswordSuccessState());
      Navigator.pop(context);


    })
        .catchError((onError){});
  }

  changePasswordSql(String username, String password,context)  {
    var url = Uri.parse('https://sjeg.seongji-eg.com/updatepassword.php');// Replace with your PHP script URL

    http.post(url,headers: {'Accept':'application/json'} ,body: {
      'code': username,
      'password': password,
    }).then((value) {

      print(value.statusCode);
      if (value.statusCode == 200 && value.body.trim().contains("success" )) {
        
        emit(ChangePasswordSuccessState());
        CacheHelper.putData(key: 'password', value: password);
        Navigator.pop(context);
        // print(value.headers);
        print(value.body.trim()); // The response from PHP script
      } else {
        showToast(text: 'code error', state: ToastState.ERROR);
        print('Login failed: ${value.body.trim()}');

      }
    }).catchError((onError){
      print('Login onError: ${onError.toString()}');
      print(onError);
    });


  }
  registerSql(String username, String password,String code, String depart,String controller)  {
    var url = Uri.parse('https://sjeg.seongji-eg.com/register.php');// Replace with your PHP script URL

    http.post(url,headers: {'Accept':'application/json'} ,body: {
      'name': username,
      'code': code,
      'depart': depart,
      'password': password,
      'controller': controller,
    }).then((value) {

      print('=============done ========Ok======');

      //


      print(value.statusCode);
      if (value.statusCode == 200 ) {
        emit(RegisterSQLSuccessState());
        // print(value.headers);
        print(value.body.trim()); // The response from PHP script
      } else {
        print('Login failed: ${value.body}');

      }
    }).catchError((onError){
      print('Login onError: ${onError.toString()}');
      print(onError);
    });


  }
  testSql()async {

    var u=Uri.parse('https://sjeg.seongji-eg.com/getdata.php');

    var test= await http.get( u ,headers: {'Accept':'application/json'});
    var res=json.decode(test.body);
    print(res);
    return res;
  }


}