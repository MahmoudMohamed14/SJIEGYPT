import 'dart:convert';

import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/model/permissionModel.dart';
import 'package:untitled/moduls/permisssion/permission_status.dart';
import 'package:http/http.dart' as http;

class PermissionCubit extends Cubit< PermissionStates> {
  PermissionCubit () : super( PermissionInitState());

  static PermissionCubit  get(context) {
    return BlocProvider.of(context);
  }
  List<String> allVaction=['','عارضة','اعتيادية'];
  List<String> Vaction=['','عارضة'];
  String valueofdepart='';
  void onChangeDepart(value){
    valueofdepart=value;
    emit(ChangeDepartState());
  }
  void orderPermission(context,String day,String reason,  String id,
  String  name,
  String date,

      String state,){
    emit( PermissionLoadingState());
    var url = Uri.parse('https://sjeg.seongji-eg.com/addHoliday.php');// Replace with your PHP script URL

    http.post(url,headers: {'Accept':'application/json'} ,
        body:  PermissionModel(day:day
            ,date: date
            ,code: id
            ,name: name
            ,depart: CacheHelper.getData(key: 'depart')??'NoDepart'
            ,reason: reason
            ,state: state
        ).toMap()).then((value) {
      if (value.statusCode == 200 ) {
        emit(PermissionSuccessState());
        Navigator.pop(context);
        getOrderPermissionSQL();

        print(value.body.trim()); // The response from PHP script
      }else  {print(value.body.trim());
      emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });

    // Firestore.instance
    //     .collection("Permission").document(id+date).set(
    //   PermissionModel(day:day,date: date,code: id,name: name,depart: depart,reason: reason,state: state ).toMap()
    // ).then((value) {
    //   emit(PermissionSuccessState());
    //   getOrderPermission();
    //
    //   Navigator.pop(context);
    // }).catchError((onError){
    //   emit( PermissionErrorState());
    // });

  }

  void deletePermissionSql(context, String date,){
    emit( PermissionDeleteLoadingState());

    var url = Uri.parse('https://sjeg.seongji-eg.com/deleteholiday.php');// Replace with your PHP script URL

    http.post(url,headers: {'Accept':'application/json'} ,
        body:  {'code':CacheHelper.getData(key: 'myId'),"date":date}).then((value) {

      if (value.statusCode == 200 ) {
        emit(PermissionDeleteSuccessState());
        getOrderPermissionSQL();
        Navigator.pop(context);

        print(value.body.trim()); // The response from PHP script
      }else  {print(value.body.trim());
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
    listofpermis=[];
    var url = Uri.parse('https://sjeg.seongji-eg.com/getholidybycode.php');// Replace with your PHP script URL

    http.post(url,headers: {'Accept':'application/json'} ,
        body:  {'code':CacheHelper.getData(key: 'myId')}).then((value) {

      if (value.statusCode == 200 ) {

        emit(PermissionGetSuccessState());
        var res=json.decode(value.body);
        if(res.length>0){
          res.forEach((element){
            listofpermis.add(PermissionModel.fromJson(element));

          });
        }

        print(value.body.trim()); // The response from PHP script
      }else  {print(value.body.trim());
      emit( PermissionErrorState());
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
    var url = Uri.parse('https://sjeg.seongji-eg.com/getallholidays.php');// Replace with your PHP script URL

    http.post(url,headers: {'Accept':'application/json'} ,
        body:  {'depart':depart}).then((value) {

      if (value.statusCode == 200 ) {


        var res=json.decode(value.body);
        if(res.length>0){
          res.forEach((element){
            emit(PermissionGetSuccessState());
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
        print(value.body.trim()); // The response from PHP script
      }else  {
        print(value.body.trim());
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
    var url = Uri.parse('https://sjeg.seongji-eg.com/getholidays_depart_date.php');// Replace with your PHP script URL

    http.post(url,headers: {'Accept':'application/json'} ,
        body:  {'depart':departvar,"date":date}).then((value) {

      if (value.statusCode == 200 ) {


        var res=json.decode(value.body);
        if(res.length>0){
          res.forEach((element){
            emit(PermissionGetSuccessState());
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
        print(value.body.trim()); // The response from PHP script
      }else  {
        print(value.body.trim());
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
    Firestore.instance
        .collection("Permission").orderBy('date').get().then((value) {
          print(value);

          value.forEach((element) {

         listofpermis.add(PermissionModel.fromJson(element.map));
         if(CacheHelper.getData(key: 'control')){
           // print(CacheHelper.getData(key: 'control'));
           // print(CacheHelper.getData(key: 'depart'));
         if(element.map['state']=='pending'&&element.map['depart']==CacheHelper.getData(key: 'depart')){
           listOfPermisPending.add(PermissionModel.fromJson(element.map));

         }else if(element.map['state']=='Accept'&&element.map['depart']==CacheHelper.getData(key: 'depart')){
           listOfPermisAccept.add(PermissionModel.fromJson(element.map));
         }else if(element.map['state']=='NotAccept'&& element.map['depart']==CacheHelper.getData(key: 'depart')){
           listOfPermisNotAccept.add(PermissionModel.fromJson(element.map));
         }}
          });

          emit(PermissionGetSuccessState());
          print(listofpermis[0].toMap());


    }).catchError((onError){
      emit(PermissionGetErrorState());

    });

  }
  String departvar='';
  getDepart(val){
    departvar=val;
    getEmit();
  }
  void getEmit(){
    emit(EmitPermission() );
  }
  void EditPermissionSql(context,String code,

      String date,String state

      ){
    var url = Uri.parse('https://sjeg.seongji-eg.com/updateholiday.php');// Replace with your PHP script URL

    http.post(url,headers: {'Accept':'application/json'} ,
        body:  {'code':code,"date":date,"state":state}).then((value) {

      if (value.statusCode == 200 ) {
        emit(PermissionDeleteSuccessState());
        getOrderPermissionSQLByDepart(departvar);
        //getOrderPermissionSQL();
       // Navigator.pop(context);

        print(value.body.trim()); // The response from PHP script
      }else  {print(value.body.trim());
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