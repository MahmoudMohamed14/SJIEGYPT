
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';


import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';

import 'package:untitled/moduls/homeLayout/homeLayout.dart';

import 'package:untitled/shared/constant/color_manager.dart';

import '../attend/attendCubit/statusAttend.dart';


class LoginScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    TextEditingController? email= new TextEditingController();
    TextEditingController? password=new TextEditingController();
    TextEditingController? codeControl= new TextEditingController();
    TextEditingController? newPasswordControl=new TextEditingController();
    TextEditingController? oldPassword=new TextEditingController();
    var keyForm=GlobalKey<FormState>();
    var keyFormpassword=GlobalKey<FormState>();


    // if(state is LoginSuccessState){
    //
    //   // CubitLayout.get(context).getUserData();
    //   // CubitLayout.get(context).init();
    //   //
    //   if(CacheHelper.getData(key: 'isAdmin')!=null) {
    //     if (CacheHelper.getData(key: 'isAdmin'))
    //       navigateAndFinish(context, HomeLayout());
    //     else
    //       navigateAndFinish(context, GetPlan());
    //     // CubitApp.get(context).init();
    //
    //   }
    //
    //
    // }
    // else if(state is LoginAttendSuccessState)
    // {
    //   if(CacheHelper.getData(key: 'myId')=='sji'){
    //     navigateAndFinish(context, UserAttendScreen());
    //   }else{
    //     AttendCubit.get(context).getAttendance(isadmin: false);
    //     navigateAndFinish(context, AttendScreen());
    //     print ('hello world');}
    //   // showToast( state: ToastState.ERROR, text: state.error!);
    // }


    return BlocConsumer<AttendCubit,AttendStates>(
        listener: (context,state){
          if(state is LoginSuccessState){
            navigateAndFinish(context, HomeLayout());

            // CubitLayout.get(context).getUserData();
            // CubitLayout.get(context).init();
            //
            // if(CacheHelper.getData(key: 'isAdmin')!=null) {
            //   if (CacheHelper.getData(key: 'isAdmin'))
            //     navigateAndFinish(context, HomeLayout());
            //   else
            //     navigateAndFinish(context, GetPlan());
            //   // CubitApp.get(context).init();
            //
            // }


          }else if(state is LoginErrorState){
            showToast( state: ToastState.ERROR, text: state.error!);

          }
          // else if(state is LoginAttendSuccessState)
          // {
          //
          //   // AttendCubit.get(context).getAttendance(isadmin: false);
          //   navigateAndFinish(context, HomeLayout());
          //   print ('hello world');
          //   // showToast( state: ToastState.ERROR, text: state.error!);
          // }
        },
        builder: (context,state){
         var cubit=AttendCubit.get(context);
          return Scaffold(

            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: keyForm,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(width: 150,
                            height: 150,
                            image: AssetImage('assets/sjilog.jpeg')
                        ),
                        SizedBox(height: 20,),

                        //  Text('${getLang(context, "login_name")}', style:Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),),
                        //  SizedBox(height: 10,),
                        // Text('login now to ', style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black54,fontSize: 18),),

                        defaultEditText(
                            control: email,
                            validat: ( s){
                              if(s!.isEmpty){
                                return"Code is empty";
                              }
                              return null;
                            },
                            label: "Code",
                            prefIcon: Icons.email_outlined,
                            textType: TextInputType.text
                        ),

                        SizedBox(height: 20,),
                        defaultEditText(control: password,
                            validat: ( s){
                              if(s.isEmpty){
                                return "password empty";
                              }
                              return null;
                            },
                            textType:TextInputType.visiblePassword,
                            enable: cubit.isScure,

                            sufIcon: cubit.suffix,
                            label:  "password",

                            prefIcon:Icons.password,//Icons.lock,
                            onPressSuffix: (){
                             cubit.passwordLogin();

                            }
                        ),
                        SizedBox(height: 30,),
                        //  state is LoginLoadingState?Center(child: CircularProgressIndicator()) :


                        defaultButton(
                            onPress: (){
                              if(keyForm.currentState!.validate()){

                                cubit.loginSql(email.text, password.text);



                                //here you code


                              }else{
                              }
                            },
                            name:  "login"),

                        // SizedBox(height: 15,),
                        //change Password
                        // Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     TextButton(onPressed: (){
                        //       AttendCubit.get(context).getAttendanceUser();
                        //       showDialog(
                        //
                        //
                        //           barrierDismissible: false,
                        //           context: context, builder:(context )=>AlertDialog(
                        //
                        //         title: Text('Change Password'),
                        //         content: Form(
                        //           key: keyFormpassword,
                        //           child: Column(
                        //             mainAxisSize: MainAxisSize.min,
                        //             children: [
                        //               defaultEditText(
                        //                   control:codeControl,
                        //                   validat: ( s){
                        //                     if(s!.isEmpty){
                        //                       return" code is empty";
                        //                     }
                        //                     return null;
                        //                   },
                        //                   label: "code",
                        //                   prefIcon: Icons.text_fields,
                        //                   textType: TextInputType.number
                        //               ),
                        //               SizedBox(height: 20,),
                        //               defaultEditText(
                        //                 control: oldPassword,
                        //
                        //
                        //                 textType:TextInputType.visiblePassword,
                        //
                        //
                        //
                        //
                        //                 validat: ( s){
                        //                   bool isTrue=false;
                        //
                        //                   if(s!.isEmpty){
                        //                     return"Empty";
                        //                   }else{
                        //                     listOfAttenduserGl.forEach((element) {
                        //                       if(element['id']==codeControl.text && element['password']==oldPassword.text){
                        //                         isTrue=true;
                        //                       }
                        //
                        //                     });
                        //                     if(!isTrue) return 'password Wrong';
                        //
                        //                   }
                        //                   return null;
                        //                 },
                        //                 label: "Old Password",
                        //                 prefIcon: Icons.password,
                        //
                        //               ),
                        //               SizedBox(height: 20,),
                        //               defaultEditText(
                        //                 control: newPasswordControl,
                        //
                        //
                        //                   textType:TextInputType.visiblePassword,
                        //
                        //
                        //
                        //
                        //                   validat: ( s){
                        //                     if(s!.isEmpty){
                        //                       return"Empty";
                        //                     }
                        //                     return null;
                        //                   },
                        //                   label: "New Password",
                        //                   prefIcon: Icons.password,
                        //
                        //               ),
                        //             ],
                        //
                        //
                        //           ),
                        //         ),
                        //         actions: [
                        //           TextButton(onPressed: (){
                        //             Navigator.pop(context);
                        //             newPasswordControl.clear();
                        //             codeControl.clear();
                        //           }, child: Text('Cancel',style: TextStyle(color: Colors.red),)),
                        //           TextButton(onPressed: (){
                        //         if(keyFormpassword.currentState!.validate()){
                        //           cubit.changePassword(
                        //               code: codeControl.text,
                        //               newPassword: newPasswordControl.text,
                        //               context: context
                        //           );
                        //           newPasswordControl.clear();
                        //           oldPassword.clear();
                        //           codeControl.clear();
                        //         }
                        //
                        //
                        //           }, child: Text('change')),
                        //
                        //         ],
                        //
                        //       ));
                        //     }, child: Text('Change password?',style: TextStyle(color: ColorManager.darkPrimary),)),
                        //   ],
                        //
                        // )
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text("noHaveAccount_name"),
                        //     defaultTextButton(onPress: (){
                        //
                        //       //  cubit.getClassName();
                        //      //  navigateTo(context, Register());
                        //
                        //
                        //
                        //
                        //     }, name: '${getLang(context, "register_name")}')
                        //   ],),



                      ],),
                  ),
                ),
              ),
            ),
          );
        },

      )
    ;



  }
}