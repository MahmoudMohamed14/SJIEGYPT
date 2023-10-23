
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';
import 'package:untitled/moduls/attend/getHistory.dart';
import 'package:untitled/moduls/login/login_screen.dart';
import 'package:untitled/moduls/permisssion/AcceptRequest.dart';
import 'package:untitled/moduls/permisssion/deparScreen.dart';
import 'package:untitled/moduls/permisssion/order_permission.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';
import 'package:untitled/shared/constant/color_manager.dart';
import 'package:untitled/shared/constant/icon_broken.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var keyFormpassword=GlobalKey<FormState>();
    TextEditingController? codeControl= new TextEditingController();
    TextEditingController? newPasswordControl=new TextEditingController();
    TextEditingController? oldPassword=new TextEditingController();
    return BlocConsumer<AttendCubit,AttendStates>(
        listener: (context,state){},
      builder:(context,state){
        var cubit=AttendCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: cubit.listTitleHome[cubit.indexHomeButton],//Text('SJI EGYPT',),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PopupMenuButton<String>(itemBuilder: (context)=>[
                    PopupMenuItem(child: Text('Change Password'),value: 'password',),
                    PopupMenuItem(child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.login_outlined,color: Colors.red,),
                        SizedBox(width: 20,),
                        Text('Sign Out',style: TextStyle(color: Colors.red),),
                      ],
                    ),value: 'out',),


                  ],
                      onSelected: (String value){
                        if(value=='password'){
                          showDialog(


                              barrierDismissible: false,
                              context: context, builder:(context )=>AlertDialog(

                            title: Text('Change Password'),
                            content: Form(
                              key: keyFormpassword,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultEditText(
                                      control:codeControl,
                                      validat: ( s){
                                        bool isTrue=false;

                                        if(s!.isEmpty){
                                          return" code is empty";
                                        }if(CacheHelper.getData(key: 'myId')!= codeControl.text) isTrue=true;
                                        if(isTrue)  return "Code Not True!!!";

                                        return null;
                                      },
                                      label: "code",
                                      prefIcon: Icons.text_fields,
                                      textType: TextInputType.number
                                  ),
                                  SizedBox(height: 20,),
                                  defaultEditText(
                                    control: oldPassword,


                                    textType:TextInputType.visiblePassword,




                                    validat: ( s){
                                      bool isTrue=false;

                                      if(s!.isEmpty){
                                        return"Empty";
                                      }if(CacheHelper.getData(key: 'password')!= oldPassword.text) isTrue=true;
                                      if(isTrue)  return "Old Password Not True!!!";

                                      return null;
                                    },
                                    label: "Old Password",
                                    prefIcon: Icons.password,

                                  ),
                                  SizedBox(height: 20,),
                                  defaultEditText(
                                    control: newPasswordControl,


                                    textType:TextInputType.visiblePassword,




                                    validat: ( s){
                                      if(s!.isEmpty){
                                        return"Empty";
                                      }
                                      return null;
                                    },
                                    label: "New Password",
                                    prefIcon: Icons.password,

                                  ),
                                ],


                              ),
                            ),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                                newPasswordControl.clear();
                                codeControl.clear();
                                oldPassword.clear();
                              }, child: Text('Cancel',style: TextStyle(color: Colors.red),)),
                              TextButton(onPressed: (){
                                print(CacheHelper.getData(key: 'password'));
                                if(keyFormpassword.currentState!.validate()){
                                  AttendCubit.get(context).changePasswordSql(codeControl.text.trim(),newPasswordControl.text.trim(),context);

                                  // cubit.changePassword(
                                  //     code: codeControl.text,
                                  //     newPassword: newPasswordControl.text,
                                  //     context: context
                                  // );
                                  newPasswordControl.clear();
                                  oldPassword.clear();
                                  codeControl.clear();
                                }


                              }, child: Text('change')),

                            ],

                          ));
                          print('password done');
                        } else if(value=='out'){
                          CacheHelper.removeWithKey(key: 'isLogin');
                          CacheHelper.removeWithKey(key: 'myId');
                          CacheHelper.removeWithKey(key: 'isAtt');
                          CacheHelper.removeWithKey(key: 'isAdmin');
                          CacheHelper.removeWithKey(key: 'password');
                          CacheHelper.removeWithKey(key: 'myname');
                          CacheHelper.removeWithKey(key: 'depart');
                          CacheHelper.removeWithKey(key: 'normal');
                          CacheHelper.removeWithKey(key: 'sudden');
                          CacheHelper.removeWithKey(key: 'control');

                          navigateAndFinish(context, LoginScreen());
                        }
                      },


                      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: Colors.orange.withOpacity(.5)))
                  ),
                ),



                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10),
                //   child: IconButton(onPressed: (){
                //     CacheHelper.removeWithKey(key: 'isLogin');
                //     CacheHelper.removeWithKey(key: 'myId');
                //     CacheHelper.removeWithKey(key: 'isAtt');
                //      CacheHelper.removeWithKey(key: 'isAdmin');
                //     CacheHelper.removeWithKey(key: 'myname');
                //     if(CacheHelper.getData(key: 'control')){
                //       CacheHelper.removeWithKey(key: 'control');
                //       CacheHelper.removeWithKey(key: 'depart');
                //     }else CacheHelper.removeWithKey(key: 'control');
                //
                //     navigateAndFinish(context, LoginScreen());
                //     //  cubit.pickFileAttend();
                //   }, icon: Icon(Icons.login_outlined)),
                // ),

              ],
            ),
            body: cubit.listScreenHome[cubit.indexHomeButton],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,



              items:   <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.monetization_on_outlined,),label: 'المرتبات'),
                BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'home'),
                BottomNavigationBarItem(icon: Icon(Icons.rate_review_outlined,),label: 'مراجعة الحضور'),
                BottomNavigationBarItem(icon: Icon(Icons.holiday_village_outlined,),label: 'طلب الاجازة'),


              ],
              onTap: (index){

                cubit.changeHomeButton(index,context);
              },
              currentIndex: cubit.indexHomeButton,

            ),
          );
    } ,

    );
  }
}
