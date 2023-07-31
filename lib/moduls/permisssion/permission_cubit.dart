import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/model/permissionModel.dart';
import 'package:untitled/moduls/permisssion/permission_status.dart';

class PermissionCubit extends Cubit< PermissionStates> {
  PermissionCubit () : super( PermissionInitState());

  static PermissionCubit  get(context) {
    return BlocProvider.of(context);
  }
  List<String> depart=['','Accessory','Harness','QcFayoum','QcSilo','MMFayoum','mmSilo','Jog'];
  String valueofdepart='';
  void onChangeDepart(value){
    valueofdepart=value;
    emit(ChangeDepartState());
  }
  void orderPermission(context,String day,String reason,  String id,
  String  name,
  String date,
  String depart,String done,
      String state,){
    emit( PermissionLoadingState());

    Firestore.instance
        .collection("Permission").document(id+date).set(
      PermissionModel(day:day,date: date,id: id,name: name,depart: depart,reason: reason,done: done,state: state ).toMap()
    ).then((value) {
      emit(PermissionSuccessState());
      getOrderPermission();

      Navigator.pop(context);
    }).catchError((onError){
      emit( PermissionErrorState());
    });

  }
  void deletePermission(context,  String id,

      String date,

      ){
    emit( PermissionDeleteLoadingState());
    Firestore.instance
        .collection("Permission").document(id+date).delete().then((value) {
      emit(PermissionDeleteSuccessState());
      getOrderPermission();

      Navigator.pop(context);
    }).catchError((onError){
      emit( PermissionDeleteErrorState());
    });

  }
  List<PermissionModel>listofpermis=[];
  List<PermissionModel>listOfPermisPending=[];
  List<PermissionModel>listOfPermisAccept=[];
  List<PermissionModel>listOfPermisNotAccept=[];
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
           print(CacheHelper.getData(key: 'control'));
           print(CacheHelper.getData(key: 'depart'));
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
  void getEmit(){
    emit(EmitPermission() );
  }
  void EditPermission(context,  String id,

      String date,String state

      ){
  // emit( PermissionUpdateLoadingState());
    Firestore.instance
        .collection("Permission").document(id+date).update({'state':state.toString()}).then((value) {
     // emit(PermissionUpdateSuccessState());
      getOrderPermission();

     // Navigator.pop(context);
    }).catchError((onError){
      emit( PermissionUpdateErrorState());
    });

  }
}