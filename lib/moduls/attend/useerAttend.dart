
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/moduls/attend/attendCubit/add_paySlip.dart';


import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';
import 'package:untitled/moduls/attend/attend_Sceen.dart';
import 'package:untitled/moduls/login/login_screen.dart';
import 'package:untitled/shared/constant/color_manager.dart';

import '../../shared/constant/test_styles_manager.dart';

final pageBucket = PageStorageBucket();

class  UserAttendScreen extends StatelessWidget {
  int ?monthindex;

  UserAttendScreen({this.monthindex});


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AttendCubit,AttendStates>(

      listener: (context,state){},

      builder: (context,state){


        var cubit=  AttendCubit.get(context);
        return Scaffold(
            appBar: AppBar(


              title:  Text('SJI Attendance',
                  style: TextStyle(color:ColorManager.primary,
                    fontSize: 20.0,)
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(onPressed: (){
                    CacheHelper.removeWithKey(key: 'isLogin');
                    CacheHelper.removeWithKey(key: 'myId');
                    CacheHelper.removeWithKey(key: 'isAtt');
                    // CacheHelper.removeWithKey(key: 'isAdmin');
                    navigateAndFinish(context, LoginScreen());
                    //  cubit.pickFileAttend();
                  }, icon: Icon(Icons.login_outlined)),
                ),



              ],
            ),

            body:Padding(
              padding: const EdgeInsets.all(20),
              child:state  is LoadingGetAttendStateSuccess? Center(child: CircularProgressIndicator()):
              PageStorage(
                bucket:  pageBucket ,
                child: ListView.separated(
                  key:   PageStorageKey<String>('page'),

                    itemBuilder: (context,index){
                      return listOfAttenduserGl[index]['id']=='1308'|| listOfAttenduserGl[index]['id']=='sji' ?
                   SizedBox():GestureDetector(
                        onTap: (){
                          navigateTo(context, AttendScreen());

                          cubit.getAttendance(isadmin: true,id: listOfAttenduserGl[index]['id'],month: cubit.monthindex);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color:ColorManager.primary,//listOfAttendGl[index].checkIn!.isNotEmpty&& listOfAttendGl[index].checkOut!.isNotEmpty?Colors.greenAccent:listOfAttendGl[index].checkIn!.isNotEmpty||listOfAttendGl[index].checkOut!.isNotEmpty?ColorManager.primary:Colors.red,
                              borderRadius: BorderRadius.circular(50)

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                              Expanded(child: Column(
                                children: [
                                  Text('${listOfAttenduserGl[index]['name']}',style: getBoldStyle(color: Colors.white,fontSize: 20),),

                                  Text('${listOfAttenduserGl[index]['id']}',style: getSemiBoldStyle(color: Colors.white,fontSize: 18),),
                                 // Text('${listOfAttendGl[index].date}',style: getMediumStyle(color: Colors.white),),
                                ],
                              )),

                            ],),
                          ),
                        ),
                      );
                    }, separatorBuilder:(context,index)=>listOfAttenduserGl[index]['id']=='1308'|| listOfAttenduserGl[index]['id']=='sji'?const SizedBox():const SizedBox(height: 20,), itemCount: listOfAttenduserGl.length),
              )  ,

            )
        );
      } ,

    );

  }

}
