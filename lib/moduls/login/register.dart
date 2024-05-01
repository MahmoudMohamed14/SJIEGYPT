
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';


import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';

import 'package:untitled/moduls/homeLayout/homeLayout.dart';

import 'package:untitled/shared/constant/color_manager.dart';

import '../attend/attendCubit/statusAttend.dart';


class RegisterScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    TextEditingController? codeControl= new TextEditingController();
    TextEditingController? passwordControl=new TextEditingController();
    TextEditingController? confirmPasswordControl=new TextEditingController();
    TextEditingController? nameControl=new TextEditingController();

    var keyForm=GlobalKey<FormState>();




    return BlocConsumer<AttendCubit,AttendStates>(
      listener: (context,state){
        if(state is LoginSuccessState){

            navigateAndFinish(context, HomeLayout());
            AttendCubit.get(context).changeHomeButton(1, context);



        }else if (state is LoginErrorState){
          showToast( state: ToastState.ERROR, text: state.error!);

        }

      },
      builder: (context,state){
        var cubit=AttendCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          // backgroundColor: ColorManager.primary,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: keyForm,
                  child: Column(
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(20)
                      //   ),
                      //   child: Image(
                      //
                      //       width: 150,
                      //       height: 150,
                      //       image: AssetImage('assets/sjilogo.jpg')
                      //   ),
                      // ),
                      SizedBox(height: 20,),
                      Text('Register SJI',style: TextStyle(color: ColorManager.primary,fontWeight: FontWeight.w900,fontSize: 25),),
                      SizedBox(height: 30,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,

                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              SizedBox(height: 20,),

                              //  Text('${getLang(context, "login_name")}', style:Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),),
                              //  SizedBox(height: 10,),
                              // Text('login now to ', style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black54,fontSize: 18),),

                              defaultEditText(
                                  control: codeControl,
                                  validat: ( s){
                                    if(s!.isEmpty){
                                      return"Code is empty";
                                    }
                                    return null;
                                  },
                                  label: "الكود",
                                  prefIcon: Icons.email_outlined,
                                  textType: TextInputType.text
                              ),
                              SizedBox(height: 20,),
                              defaultEditText(
                                  control: nameControl,
                                  validat: ( s){
                                    if(s!.isEmpty){
                                      return"Code is empty";
                                    }
                                    return null;
                                  },
                                  label: "الاسم",
                                  prefIcon: Icons.email_outlined,
                                  textType: TextInputType.text
                              ),

                              SizedBox(height: 20,),
                              defaultEditText(isSuffix: true,control: passwordControl,
                                  validat: ( s){
                                    if(s.isEmpty){
                                      return "password empty";
                                    }
                                    return null;
                                  },
                                  textType:TextInputType.visiblePassword,
                                 // enable: cubit.isScure,

                                //  sufIcon: cubit.suffix,
                                  label:  "الباسورد",

                                  prefIcon:Icons.password,//Icons.lock,
                                  // onPressSuffix: (){
                                  //   cubit.passwordLogin();
                                  //
                                  // }
                              ),
                              SizedBox(height: 30,)
                              , defaultEditText(isSuffix: true,control: confirmPasswordControl,
                                  validat: ( s){
                                    if(s.isEmpty){
                                      return "password empty";
                                    }
                                    if(s !=passwordControl.text){
                                      return "كلمة السر غير متطابقة";
                                    }
                                    return null;
                                  },
                                  textType:TextInputType.visiblePassword,
                                 // enable: cubit.isScure,

                                 // sufIcon: cubit.suffix,
                                  label:  "تاكيد الباسورد",

                                  prefIcon:Icons.password,//Icons.lock,
                                  // onPressSuffix: (){
                                  //   cubit.passwordLogin();
                                  //
                                  // }
                              ),
                              SizedBox(height: 20,),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorManager.lightPrimary),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: DropdownButton(

                                    isExpanded: true,
                                    iconSize: 40,


                                    value: cubit.dropValue,


                                    onChanged: ( String?value){

                                      cubit.dropButtonChange(vlu: value);


                                    },

                                    items:List.generate(cubit.dropValueList.length, (index) =>   DropdownMenuItem<String>(child: Text(cubit.dropValueList[index],),value: cubit.dropValueList[index],))
                                ),
                              ),
                              SizedBox(height: 20,),
                              state is LoginLoadingState?Center(child: CircularProgressIndicator()) :


                              defaultButton(
                                  onPress: () async {
                                    if(keyForm.currentState!.validate()){

                                      await cubit.registerSql(codeControl.text, nameControl.text, passwordControl.text, cubit.dropValue);



                                      //here you code


                                    }else{
                                    }
                                  },
                                  name:  "تسجيل"),
                            //  SizedBox(height: 20,),

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
                    ],
                  ),
                ),
              ),
            ),
          ),);
      },

    );



  }
}