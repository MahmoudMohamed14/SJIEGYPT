
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/moduls/attend/attendCubit/add_paySlip.dart';
import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';
import 'package:untitled/moduls/attend/attendAndPayScreen.dart';
import 'package:untitled/moduls/permisssion/order_permission.dart';


import '../../componant/local/cache_helper.dart';
import '../../shared/constant/color_manager.dart';
import '../../shared/constant/test_styles_manager.dart';


class  MonthsAttend extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Builder(
        builder: (context) {

          return BlocConsumer<AttendCubit,AttendStates>(
            listener: (context,state){},
            builder: (context,state){
              var cubit=  AttendCubit.get(context);
              return  Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20
                    ),
                    itemCount: 12 ,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          cubit.getmonthindex(index);
                          if(CacheHelper.getData(key: 'myId')=='sji'){
                            navigateTo(context,UploadPaySlipScreen());

                          }else{
                            cubit.isPayORreview=='pay'?cubit.getPaySlip(cubit.listOfNameMonth[index]):cubit.getReview(cubit.listOfNameMonth[index]);

                            navigateTo(context, AttendAndPayScreen());


                          }
                          //     // print ('hello world');
                        },

                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color:  ColorManager.primary,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${cubit.listOfNameMonth[index]}',style: getBoldStyle(color: Colors.white,fontSize: 20),),
                              SizedBox(height: 5,),
                              Text('${cubit.listOfNameMonthArabic[index]}',style: getBoldStyle(color: Colors.white,fontSize: 17),),
                            ],
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


              );
            } ,

          );
        }
    );

  }

}
