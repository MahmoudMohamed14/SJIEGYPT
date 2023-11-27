import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';
import 'package:untitled/moduls/hiring/design.dart';
import 'package:untitled/moduls/hiring/insertInformation.dart';
import 'package:untitled/moduls/login/login_screen.dart';
import 'package:untitled/shared/constant/color_manager.dart';
class SafetyScreen extends StatelessWidget {
  const SafetyScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? search=new TextEditingController();
    TextEditingController? shoesSizeControl=new TextEditingController();
    return  BlocConsumer<HiringCubit,HiringStates>(
        listener: (context,state){
          if(state is HiringDeleteLoadingState||state is HiringConfirmAndRejectLoadingState ||state is HiringCallLoadingState ){
            showDialog(

                barrierDismissible: false,
                context: context,
                builder:(context )=>AlertDialog(
                  backgroundColor:Colors.grey,
                  title: Text('Loading!!!',style: TextStyle(color: Colors.white),),
                  content:  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(child: CircularProgressIndicator()),
                      // state is HiringAddErrorState? Text('تم الفحص الكود من قبل !!',style: TextStyle(color: Colors.white)):SizedBox(),
                    ],
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      //emit(FinishSCanStateSuccess());
                      // duplicated=false;
                      // emitState();

                      Navigator.of(context).pop(true);

                    }, child: Text('Cancel',style: TextStyle(color: Colors.white),)),
                  ],

                ));
          }
          if(state is HiringCallSuccessState|| state is HiringDeleteSuccessState||state is HiringConfirmAndRejectSuccessState){Navigator.of(context).pop(true);}
        },
        builder:  (context,state){
          var cubit=HiringCubit.get(context);
          return  Scaffold(
            appBar: AppBar(),


            //   backgroundColor: Colors.white70.withOpacity(.9),


            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                //  mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey.withOpacity(.1),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width:200,
                          height: 40,
                          child: defaultEditText(prefIcon: Icons.search,label: 'search',control: search,onchange: (s){
                            cubit.search(s);
                          }),
                        ),


                     Spacer(),
                       CacheHelper.getData(key: 'controller') =='safety'?TextButton(onPressed: (){
                          signOut( context);

                        }, child:Row(
                          children: [
                            Icon(Icons.logout_outlined,color:ColorManager.error ,),
                            SizedBox(width: 5,),
                            Text('Logout',style: TextStyle(color: ColorManager.error,fontWeight: FontWeight.bold,fontSize: 16),),

                            //Text('${cubit.countCallok}',style: TextStyle(color:  ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 14),),

                          ],
                        )):SizedBox(),



                      ],
                    ),

                  ),
                  //  Container(height: double.infinity,width: 1,color: Colors.grey,),
                  SizedBox(height: 20,),

                  Visibility(child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        defaultButton(color:  Colors.blueGrey,height: 25,width: 120,onPress: () async {
                          await cubit.updateValueSql('vest',value: "Received") ;


                        }, name:'Received Vest'),
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            defaultButton(color: Colors.blueGrey,height: 25,width: 130,onPress: () async {
                              showDialog(

                                  barrierDismissible: false,
                                  context: context,
                                  builder:(context )=>AlertDialog(
                                    backgroundColor:Colors.grey,
                                    title: Text('Set Shoes Size',style: TextStyle(color: Colors.white),),
                                    content:  Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        defaultEditText(label: 'Shoes Size',control: shoesSizeControl),
                                        //Center(child: CircularProgressIndicator()),
                                        // state is HiringAddErrorState? Text('تم الفحص الكود من قبل !!',style: TextStyle(color: Colors.white)):SizedBox(),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(onPressed: (){
                                        //emit(FinishSCanStateSuccess());
                                        // duplicated=false;
                                        // emitState();

                                        Navigator.of(context).pop(true);

                                      }, child: Text('Cancel',style: TextStyle(color: Colors.white),)),
                                      TextButton(onPressed: () async {
                                        await cubit.updateValueSql('shoes_size',value: shoesSizeControl.text.trim()).then((value) {

                                        }) ;

                                      }, child: Text('Confirm',style: TextStyle(color: ColorManager.darkPrimary),)),
                                    ],

                                  ));



                            }, name:'Set Shoes Size'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 15,),
                            defaultButton(color:  Colors.blueGrey,height: 25,width: 180,onPress: () async {
                              cubit.updateValueSql('safety_soes',value: 'Received').then((value) {}) ;


                            }, name:'Received Safety Shoes'),
                            SizedBox(width:15,),
                            defaultButton(color: Colors.blueGrey,height: 25,width: 120,onPress: () async {
                              cubit.updateValueSql('crocs',value: 'Received').then((value) {}) ;
                            }, name:'Received Crocs'),
                            SizedBox(width: 15,),
                            defaultButton(color:  Colors.blueGrey,height: 25,width: 180,onPress: () async {
                                cubit.updateValueSql('safety_helmet',value:'Received' );


                            }, name:'Received Safety Helmet'),
                          ],
                        ),
                        SizedBox(width: 15,),
                        defaultButton(color: Colors.blueGrey,height: 25,width: 150,onPress: () async {
                          cubit.updateValueSql('ear_blug',value:'Received' );


                        }, name:'Received Ear blug'),
                        SizedBox(width: 15,),
                        defaultButton(color: Colors.blueGrey ,height: 25,width: 120,onPress: () async {
                          cubit.updateValueSql('cutter',value:'Received' );


                        }, name:'Received Cutter '),

                        SizedBox(width: 15,),
                        defaultButton(color: Colors.blueGrey,height: 25,width: 80,onPress: () async {
                          cubit.createExcel();


                        }, name:'Export'),
                      ],
                    ),
                  ),visible: cubit.selectedNID.isNotEmpty?true:false),
                  SizedBox(height: 20,),
                  search.text.isNotEmpty?dataTableSafety(context,cubit.listOfSearch)
                      :cubit.listModelHiring.isNotEmpty? dataTableSafety(context,cubit.listModelHiring)
                      :Column(
                    children: [
                      SizedBox(height: 200,),
                      Text('EMPTY!',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 30),),
                    ],
                  ),
                ],),
            ) ,

          );
        }


    );
  }
}