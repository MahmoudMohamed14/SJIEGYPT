



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/componant/remote/dioHelper.dart';
import 'package:untitled/model/permissionModel.dart';
import 'package:untitled/moduls/permisssion/permission_status.dart';

import '../../componant/local/cache_helper.dart';

class PermissionCubit extends Cubit< PermissionStates> {
  PermissionCubit () : super( PermissionInitState());

  static PermissionCubit  get(context) {
    return BlocProvider.of(context);
  }

  bool holidayByCalendar=false;

  List<String> allVaction=['','اعتيادية'];
  List<String> Vaction=['','عارضة'];
  String valueofdepart='';
  void onChangeDepart(value){
    valueofdepart=value;
    emit(ChangeDepartState());
  }

  void orderPermission(context,String day,String reason,  String id,
  String  name,
  String date,

      String state,type){
    emit( PermissionLoadingState());
    // var url = Uri.parse('https://sjeg.seongji-eg.com/addHoliday.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  PermissionModel(day:day
    //         ,date: date
    //         ,code: id
    //         ,name: name
    //         ,depart: CacheHelper.getData(key: 'depart')??'NoDepart'
    //         ,reason: reason
    //         ,state: state
    //     ).toMap())
        DioHelper.dio.post('addHoliday.php',queryParameters: PermissionModel(day:day
            ,date: date
            ,code: id
            ,name: name
            ,depart: CacheHelper.getData(key: 'depart')??'NoDepart'
            ,reason: reason
            ,state: state,
            location: CacheHelper.getData(key: 'location'),
            dateAccept: '',
            type: type
        ).toMap() ).then((value) {
      if (value.statusCode == 200 ) {
        emit(PermissionSuccessState());
        Navigator.pop(context);
        getOrderPermissionSQL();

        print(value.data.trim()); // The response from PHP script
      }else  {print(value.data.trim());
      emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });


  }

  void deletePermissionSql(context, String date,){
    emit( PermissionDeleteLoadingState());

    // var url = Uri.parse('https://sjeg.seongji-eg.com/deleteholiday.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'code':CacheHelper.getData(key: 'myId'),"date":date})
    DioHelper.dio.post('deleteholiday.php',queryParameters:{'code':CacheHelper.getData(key: 'myId'),"date":date} ).then((value) {
      // emit(PermissionDeleteSuccessState());
      // Navigator.pop(context);
      // getOrderPermissionSQL();

      if (value.statusCode == 200 ) {
        emit(PermissionDeleteSuccessState());
        Navigator.pop(context);
        getOrderPermissionSQL();



        print(value.data.trim()); // The response from PHP script
      }else  {print(value.data.trim());
      emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionDeleteErrorState());
      print(onError.toString().trim());
    });
    // Firestore.instance
    //     .collection("Permission").document(id+date).delete().then((value) {
    //   emit(PermissionDeleteSuccessState());
    //   getOrderPermission();
    //
    //   Navigator.pop(context);
    // }).catchError((onError){
    //   emit( PermissionDeleteErrorState());
    // });

  }
  List<PermissionModel>listofpermis=[];
  List<PermissionModel>listOfPermisPending=[];
  List<PermissionModel>listOfPermisAccept=[];
  List<PermissionModel>listOfPermisNotAccept=[];
  getOrderPermissionSQL(){
    listOfPermisPending=[];
    listOfPermisAccept=[];
    listOfPermisNotAccept=[];

    // var url = Uri.parse('https://sjeg.seongji-eg.com/getholidybycode.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'code':CacheHelper.getData(key: 'myId')})
        DioHelper.dio.post('getholidybycode.php',queryParameters:{'code':CacheHelper.getData(key: 'myId')} ).then((value) {

      // if (value.statusCode == 200 ) {
      //   print('code= '+CacheHelper.getData(key: 'myId'));
      //
      //   listofpermis=[];
      //   var res=json.decode(value.data);
      //   print(res);
      //   print(value.data);
      //   print(res.length);
      //   if(res.length>0){
      //     res.forEach((element){
      //       listofpermis.add(PermissionModel.fromJson(element));
      //
      //     });
      //   }
      //   emit(PermissionGetSuccessState());
      //
      //  // The response from PHP script
      // }
      if (value.statusCode == 200 ) {
        print(value.data);
        var res=json.decode(value.data);
        if(res.length>0){
          res.forEach((element){
            listofpermis.add(PermissionModel.fromJson(element));

            if(element['state']=='pending'){
              listOfPermisPending.add(PermissionModel.fromJson(element));
            }else if(element['state']=='NotAccept'){
              listOfPermisNotAccept.add(PermissionModel.fromJson(element));
            }
            else if(element['state']=='Accept'){
              listOfPermisAccept.add(PermissionModel.fromJson(element));
            }




          });
          emit(PermissionGetSuccessState());
        }
        emit(PermissionGetSuccessState());
        print(res.length); // The response from PHP script
      }
      else  {print(value.data.trim());


     // emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });


  }
  getOrderPermissionSQLByDepart(depart){
         listOfPermisPending=[];
         listOfPermisAccept=[];
         listOfPermisNotAccept=[];
    // var url = Uri.parse('https://sjeg.seongji-eg.com/getallholidays.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'depart':depart})
        DioHelper.dio.post('getallholidays.php',queryParameters: {'depart':depart}).then((value) {

      if (value.statusCode == 200 ) {
print(value.data);
        var res=json.decode(value.data);
        if(res.length>0){
          res.forEach((element){

            if(element['state']=='pending'){
              listOfPermisPending.add(PermissionModel.fromJson(element));
            }else if(element['state']=='NotAccept'){
              listOfPermisNotAccept.add(PermissionModel.fromJson(element));
            }
            else if(element['state']=='Accept'){
              listOfPermisAccept.add(PermissionModel.fromJson(element));
            }




          });
        }
        emit(PermissionGetSuccessState());
        print(res.length); // The response from PHP script
      }else  {
        print(value.data.trim());
      emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });


  }
  getOrderPermissionSQLByLocation(depart){
    listOfPermisPending=[];
    listOfPermisAccept=[];
    listOfPermisNotAccept=[];
    // var url = Uri.parse('https://sjeg.seongji-eg.com/getallholidays.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'depart':depart})
    DioHelper.dio.post('getholidaybylocation.php',queryParameters: {'location':depart}).then((value) {

      if (value.statusCode == 200 ) {

        var res=json.decode(value.data);
        if(res.length>0){
          res.forEach((element){

            if(element['state']=='pending'){
              listOfPermisPending.add(PermissionModel.fromJson(element));
            }else if(element['state']=='NotAccept'){
              listOfPermisNotAccept.add(PermissionModel.fromJson(element));
            }
            else if(element['state']=='Accept'){
              listOfPermisAccept.add(PermissionModel.fromJson(element));
            }




          });
        }
        emit(PermissionGetSuccessState());
        print(res.length); // The response from PHP script
      }else  {
        print(value.data.trim());
        emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });


  }
  getOrderPermissionSQLByDepartAndDate(date){
    listOfPermisPending=[];
    listOfPermisAccept=[];
    listOfPermisNotAccept=[];
    // var url = Uri.parse('https://sjeg.seongji-eg.com/getholidays_depart_date.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'depart':departvar,"date":date})
    DioHelper.dio.post('getholidays_depart_date.php',queryParameters: {'depart':departvar,"date":date} )  .then((value) {

      if (value.statusCode == 200 ) {


        var res=json.decode(value.data);
        if(res.length>0){
          res.forEach((element){

            if(element['state']=='pending'){
              listOfPermisPending.add(PermissionModel.fromJson(element));
            }else if(element['state']=='NotAccept'){
              listOfPermisNotAccept.add(PermissionModel.fromJson(element));
            }
            else if(element['state']=='Accept'){
              listOfPermisAccept.add(PermissionModel.fromJson(element));
            }




          });
        }
        emit(PermissionGetSuccessState());
        print(res.length); // The response from PHP script
      }else  {
        print(value.data.trim());
        emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });


  }
  getOrderPermissionSQLByLocationAndDate(date){
    listOfPermisPending=[];
    listOfPermisAccept=[];
    listOfPermisNotAccept=[];
    // var url = Uri.parse('https://sjeg.seongji-eg.com/getholidays_depart_date.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'depart':departvar,"date":date})
    DioHelper.dio.post('getholidaybylocationanddate.php',queryParameters: {'location':departvar,"date":date} )  .then((value) {

      if (value.statusCode == 200 ) {


        var res=json.decode(value.data);
        if(res.length>0){
          res.forEach((element){

            if(element['state']=='pending'){
              listOfPermisPending.add(PermissionModel.fromJson(element));
            }else if(element['state']=='NotAccept'){
              listOfPermisNotAccept.add(PermissionModel.fromJson(element));
            }
            else if(element['state']=='Accept'){
              listOfPermisAccept.add(PermissionModel.fromJson(element));
            }




          });
        }
        emit(PermissionGetSuccessState());
        print(res.length); // The response from PHP script
      }else  {
        print(value.data.trim());
        emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });


  }
  getOrderPermissionSQLByCode(){
    listOfPermisPending=[];
    listOfPermisAccept=[];
    listOfPermisNotAccept=[];
    // var url = Uri.parse('https://sjeg.seongji-eg.com/getholidays_depart_date.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'depart':departvar,"date":date})
    DioHelper.dio.post('getholidaybycode.php',queryParameters: {'code':CacheHelper.getData(key: 'myId')})  .then((value) {

      if (value.statusCode == 200 ) {


        var res=json.decode(value.data);
        if(res.length>0){
          res.forEach((element){

            if(element['state']=='pending'){
              listOfPermisPending.add(PermissionModel.fromJson(element));
            }else if(element['state']=='NotAccept'){
              listOfPermisNotAccept.add(PermissionModel.fromJson(element));
            }
            else if(element['state']=='Accept'){
              listOfPermisAccept.add(PermissionModel.fromJson(element));
            }




          });
        }
        emit(PermissionGetSuccessState());
        print(res.length); // The response from PHP script
      }else  {
        print(value.data.trim());
        emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });


  }

  void getOrderPermission(){
    listofpermis=[];
    listOfPermisNotAccept=[];
    listOfPermisAccept=[];
    listOfPermisPending=[];
    // Firestore.instance
    //     .collection("Permission").orderBy('date').get().then((value) {
    //       print(value);
    //
    //       value.forEach((element) {
    //
    //      listofpermis.add(PermissionModel.fromJson(element.map));
    //      if(CacheHelper.getData(key: 'control')){
    //        // print(CacheHelper.getData(key: 'control'));
    //        // print(CacheHelper.getData(key: 'depart'));
    //      if(element.map['state']=='pending'&&element.map['depart']==CacheHelper.getData(key: 'depart')){
    //        listOfPermisPending.add(PermissionModel.fromJson(element.map));
    //
    //      }else if(element.map['state']=='Accept'&&element.map['depart']==CacheHelper.getData(key: 'depart')){
    //        listOfPermisAccept.add(PermissionModel.fromJson(element.map));
    //      }else if(element.map['state']=='NotAccept'&& element.map['depart']==CacheHelper.getData(key: 'depart')){
    //        listOfPermisNotAccept.add(PermissionModel.fromJson(element.map));
    //      }}
    //       });
    //
    //       emit(PermissionGetSuccessState());
    //       print(listofpermis[0].toMap());
    //
    //
    // }).catchError((onError){
    //   emit(PermissionGetErrorState());
    //
    // });

  }
  String departvar='';
  getDepart(val){
    departvar=val;
    getEmit();
  }
  void getEmit(){
    emit(EmitPermission() );
  }
  void EditPermissionSql(context,String code,String date,String state){
    // var url = Uri.parse('https://sjeg.seongji-eg.com/updateholiday.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'code':code,"date":date,"state":state})
    DioHelper.dio.post('updateholiday.php',queryParameters: {'code':code,"date":date,"state":state,'dateAccept':DateTime.now().toString()}).then((value) {

      if (value.statusCode == 200 ) {
        emit(PermissionUpdateSuccessState());
        getOrderPermissionSQLByDepart(departvar);
        //getOrderPermissionSQL();
       // Navigator.pop(context);

        print('**********EditPermissionSql***********'); // The response from PHP script
      }else  {print(value.data.trim());
      emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionUpdateErrorState());
      print(onError.toString().trim());
    });
    // Firestore.instance
    //     .collection("Permission").document(id+date).update({'state':state.toString()}).then((value) {
    //  // emit(PermissionUpdateSuccessState());
    //   getOrderPermission();
    //
    //  // Navigator.pop(context);
    // }).catchError((onError){
    //   emit( PermissionUpdateErrorState());
    // });

  }
}