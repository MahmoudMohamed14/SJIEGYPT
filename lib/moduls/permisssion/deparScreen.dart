

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';
import 'package:untitled/moduls/permisssion/AcceptRequest.dart';
import 'package:untitled/moduls/permisssion/order_permission.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';
import 'package:untitled/shared/constant/color_manager.dart';

import '../../shared/constant/test_styles_manager.dart';

class  DepartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Builder(
        builder: (context) {

          return BlocConsumer<AttendCubit,AttendStates>(
            listener: (context,state){},
            builder: (context,state){
              var cubit=  AttendCubit.get(context);

              return  Builder(
                builder: (context) {
                  if(CacheHelper.getData(key: 'control')) {
                  //  AttendCubit.get(context).getDepart();
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.separated( separatorBuilder:(context,index)=>SizedBox(height: 20,),
                        itemCount: cubit.myDepartList.length ,
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              PermissionCubit.get(context).getDepart(cubit.myDepartList[index]);
                              if(CacheHelper.getData(key: 'depart')=='HR'){

                                navigateTo(context, MyScreen());
                              }else{
                                PermissionCubit.get(context).getOrderPermissionSQLByDepart(cubit.myDepartList[index]);
                                navigateTo(context, LayoutPermission());
                              }



                              // cubit.getmonthindex(index);
                              // if(CacheHelper.getData(key: 'myId')=='sji'){
                              //   navigateTo(context,UploadPaySlipScreen());
                              //
                              // }else{
                              //   cubit.getPaySlip(cubit.listOfNameMonth[index]);
                              //
                              //   navigateTo(context, AttendAndPayScreen());
                              //
                              //
                              // }
                              //     // print ('hello world');
                            },

                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:  ColorManager.primary,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('${cubit.myDepartList[index]}',style: getBoldStyle(color: Colors.white,fontSize: 20),),
                                    // SizedBox(height: 5,),
                                    // Text('${cubit.listOfNameMonthArabic[index]}',style: getBoldStyle(color: Colors.black,fontSize: 17),),
                                    //
                                  ],
                                ),
                              ),
                            ),
                          );
                        },

                      )
                    // return index <=3? SizedBox(): GestureDetector(
                    //
                    //   onTap: (){
                    //    if(CacheHelper.getData(key: 'myId')=='sji'){
                    //      cubit.getmonthindex(index);
                    //     navigateTo(context, UserAttendScreen());
                    //     }else{
                    //      cubit.getmonthindex(index);
                    //       cubit.getPaySlip();
                    //     // cubit.changeBottomNav(index: 0);
                    //      // navigateTo(context, PaySlipScreen());
                    //    // AttendCubit.get(context).getAttendance(isadmin: false,month: index);
                    //     navigateTo(context, AttendAndPayScreen());
                    //     // print ('hello world');
                    //    }
                    //   },
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color:ColorManager.primary,//listOfAttendGl[index].checkIn!.isNotEmpty&& listOfAttendGl[index].checkOut!.isNotEmpty?Colors.greenAccent:listOfAttendGl[index].checkIn!.isNotEmpty||listOfAttendGl[index].checkOut!.isNotEmpty?ColorManager.primary:Colors.red,
                    //         borderRadius: BorderRadius.circular(50)
                    //
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(20),
                    //       child: Row(
                    //         children: [
                    //           Expanded(child: Column(
                    //             children: [
                    //               Text(' month ${index+1}',style: getBoldStyle(color: Colors.white,fontSize: 20),),
                    //
                    //              // Text('${listOfAttenduserGl[index]['id']}',style: getSemiBoldStyle(color: Colors.white,fontSize: 18),),
                    //               // Text('${listOfAttendGl[index].date}',style: getMediumStyle(color: Colors.white),),
                    //             ],
                    //           )),
                    //
                    //         ],),
                    //     ),
                    //   ),
                    // );


                  );}
                  else{
                   // PermissionCubit.get(context).getOrderPermissionSQL();
                    return  MyScreen();
                  }
                }
              );
            } ,

          );
        }
    );

  }

}