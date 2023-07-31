
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';


import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';
import 'package:untitled/moduls/login/login_screen.dart';
import 'package:untitled/shared/constant/color_manager.dart';
import 'package:untitled/shared/constant/test_styles_manager.dart';


final pageBucket = PageStorageBucket();

class  AttendScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AttendCubit,AttendStates>(
      listener: (context,state){},

      builder: (context,state){


        var cubit=  AttendCubit.get(context);
        return CacheHelper.getData(key: 'myId')=='sji'? Scaffold(
          appBar: AppBar(


            title:  Column(
              children: [
                listOfAttendGl.isNotEmpty?Text('${listOfAttendGl[0].name}',
                    style: TextStyle(color:ColorManager.primary,
                      fontSize: 20.0,)
                ):SizedBox(),
                listOfAttendGl.isNotEmpty? Text('${listOfAttendGl[0].id}',
                    style: TextStyle(color:ColorManager.primary,
                      fontSize: 20.0,)
                ):SizedBox(),
              ],
            ),
            actions:CacheHelper.getData(key: 'myId')=='sji'?null:[



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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child:state  is LoadingGetAttendStateSuccess? Center(child: CircularProgressIndicator()):
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text('غياب',style: getBoldStyle(color: Colors.black,fontSize: 20)),
                          Text('${cubit.totalAbsent}',style: getMediumStyle(color: Colors.black,fontSize: 20)),
                        ],
                      ),
                    ),

                    Expanded(

                      child: Column(
                        children: [
                          Text('اذن',style: getBoldStyle(color: Colors.black,fontSize: 20)),
                          Text('${cubit.totalPermission}',style: getMediumStyle(color: Colors.black,fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context,index){
                        return Container(
                          decoration: BoxDecoration(
                              color:listOfAttendGl[index].checkIn!.isNotEmpty && listOfAttendGl[index].checkOut!.isNotEmpty && int.parse(listOfAttendGl[index].checkOut!.substring(0,listOfAttendGl[index].checkOut!.indexOf(':'))) >=15 ?Colors.green:
                              listOfAttendGl[index].checkOut!.isNotEmpty &&  int.parse(listOfAttendGl[index].checkOut!.substring(0,listOfAttendGl[index].checkOut!.indexOf(':'))) < 15  ?ColorManager.primary: listOfAttendGl[index].checkIn!.isEmpty && listOfAttendGl[index].checkOut!.isEmpty ?Colors.red: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(20)

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row( children: [
                              Expanded(child: Column(
                                children: [
                                  Text('Day',style: getMediumStyle(color: Colors.white),),
                                  Text('${listOfAttendGl[index].date}',style: getMediumStyle(color: Colors.white),),
                                ],
                              )),
                              Expanded(child: Column(
                                children: [
                                  Text('checkIn',style: getRegularStyle(color: Colors.white),),
                                  listOfAttendGl[index].checkIn!.isNotEmpty? Text('${listOfAttendGl[index].checkIn}',style: getRegularStyle(color: Colors.white),):Icon(Icons.cancel_outlined,color: Colors.red,),      ],
                              )),
                              Expanded(child: Column(
                                children: [
                                  Text('checkOut',style: getRegularStyle(color: Colors.white),),
                                  listOfAttendGl[index].checkOut!.isNotEmpty? Text('${listOfAttendGl[index].checkOut}',style: getRegularStyle(color: Colors.white),):Icon(Icons.cancel_outlined,color: Colors.red,),
                                ],
                              )),
                            ],),
                          ),
                        );
                      }, separatorBuilder:(context,index)=>const SizedBox(height: 20,), itemCount: listOfAttendGl.length),
                ),
              ],
            )  ,
          ),
        ): Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child:state  is LoadingGetAttendStateSuccess? Center(child: CircularProgressIndicator()):
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('غياب',style: getBoldStyle(color: Colors.black,fontSize: 20)),
                        Text('${cubit.totalAbsent}',style: getMediumStyle(color: Colors.black,fontSize: 20)),
                      ],
                    ),
                  ),

                  Expanded(

                    child: Column(
                      children: [
                        Text('اذن',style: getBoldStyle(color: Colors.black,fontSize: 20)),
                        Text('${cubit.totalPermission}',style: getMediumStyle(color: Colors.black,fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context,index){
                      return Container(
                        decoration: BoxDecoration(
                            color:listOfAttendGl[index].checkIn!.isNotEmpty && listOfAttendGl[index].checkOut!.isNotEmpty && int.parse(listOfAttendGl[index].checkOut!.substring(0,listOfAttendGl[index].checkOut!.indexOf(':'))) >=15 ?Colors.green:
                            listOfAttendGl[index].checkOut!.isNotEmpty &&  int.parse(listOfAttendGl[index].checkOut!.substring(0,listOfAttendGl[index].checkOut!.indexOf(':'))) < 15  ?ColorManager.primary: listOfAttendGl[index].checkIn!.isEmpty && listOfAttendGl[index].checkOut!.isEmpty ?Colors.red: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20)

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row( children: [
                            Expanded(child: Column(
                              children: [
                                Text('Day',style: getMediumStyle(color: Colors.white),),
                                Text('${listOfAttendGl[index].date}',style: getMediumStyle(color: Colors.white),),
                              ],
                            )),
                            Expanded(child: Column(
                              children: [
                                Text('checkIn',style: getRegularStyle(color: Colors.white),),
                                listOfAttendGl[index].checkIn!.isNotEmpty? Text('${listOfAttendGl[index].checkIn}',style: getRegularStyle(color: Colors.white),):Icon(Icons.cancel_outlined,color: Colors.red,),      ],
                            )),
                            Expanded(child: Column(
                              children: [
                                Text('checkOut',style: getRegularStyle(color: Colors.white),),
                                listOfAttendGl[index].checkOut!.isNotEmpty? Text('${listOfAttendGl[index].checkOut}',style: getRegularStyle(color: Colors.white),):Icon(Icons.cancel_outlined,color: Colors.red,),
                              ],
                            )),
                          ],),
                        ),
                      );
                    }, separatorBuilder:(context,index)=>const SizedBox(height: 20,), itemCount: listOfAttendGl.length),
              ),
            ],
          )  ,
        );
      } ,

    );

  }

}
