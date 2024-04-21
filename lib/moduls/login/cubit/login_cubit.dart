
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context){
    return BlocProvider.of(context);
  }

  bool isScure=true;
  IconData suffix = Icons.visibility_off;


  void passwordLogin(){

    isScure = !isScure;
    suffix= isScure?Icons.visibility_off :Icons.visibility;
    emit(LoginPasswordState());

  }



}