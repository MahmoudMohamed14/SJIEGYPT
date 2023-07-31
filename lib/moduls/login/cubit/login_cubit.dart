
import 'package:bloc/bloc.dart';
import 'package:firedart/firestore/firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/moduls/addPom/cubit/addPomCubit.dart';


import 'login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  bool isScure=true;
  IconData suffix = Icons.visibility_off;
  static LoginCubit get(context){
    return BlocProvider.of(context);
  }

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
    Firestore.instance
        .collection("userAttend")
        .document(email)
        .get().then((value) {
          if(value.map['id']==email && value.map['password']==password){
            CacheHelper.putData(key: 'isLogin', value: true);
            CacheHelper.putData(key: 'myId', value: value.map['id']);
            CacheHelper.putData(key: 'isAtt', value: true);
            CacheHelper.putData(key: 'myname', value: value.map['name']);
            if(value.map['controller']!= null) {
              CacheHelper.putData(key: 'control', value: true);
              CacheHelper.putData(key: 'depart', value: value.map['depart']);
            }else CacheHelper.putData(key: 'control', value: false);

            emit(LoginSuccessState());

          }else emit(LoginErrorState(error: " Password Error"));

    }).catchError((onError){
      print('from error');
      emit(LoginErrorState(error: " Code Error Or Internet Error "));
    });
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


}