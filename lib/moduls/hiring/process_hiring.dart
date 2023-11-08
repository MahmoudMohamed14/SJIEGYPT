
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

class ProcessHiring extends StatelessWidget {
  const ProcessHiring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? search=new TextEditingController();
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
                        TextButton(onPressed: (){
                          search.text='';
                          cubit.statusOfList='';
                          cubit.onSelectAll(false);
                          cubit.getMyList();
                        }, child:Text('Hiring List',style: TextStyle(color:  cubit.statusOfList==''?ColorManager.primary:ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 20),)),
                        SizedBox(width: 20,),
                        TextButton(onPressed: (){
                          search.text='';
                          cubit.statusOfList='true';
                          cubit.onSelectAll(false);
                          cubit.getMyList();
                        }, child:Text('Confirmed',style: TextStyle(color:  cubit.statusOfList=='true'?ColorManager.primary:ColorManager.grey2,fontWeight: FontWeight.bold,fontSize: 20))),
                        SizedBox(width: 20,),
                        TextButton(onPressed: (){
                          search.text='';
                          cubit.statusOfList='false';
                          cubit.onSelectAll(false);
                          cubit.getMyList();
                        }, child:Text('Rejected',style: TextStyle(color:  cubit.statusOfList=='false'?ColorManager.primary:ColorManager.grey2,fontWeight: FontWeight.bold,fontSize: 20))),
                        Spacer(),
                        SizedBox(
                          width:200,
                          height: 40,
                          child: defaultEditText(prefIcon: Icons.search,label: 'search',control: search,onchange: (s){
                            cubit.search(s);
                          }),
                        ),
                        Visibility(
                          visible: cubit.statusOfList=='true',
                          child: Row(
                            children: [
                              TextButton(onPressed: (){
                                if(!cubit.isSearch){
                                  cubit.searchByValue(true, 'callOk');
                                }else{cubit.searchByValue(false, '');}
                              }, child:Column(
                                children: [
                                  Text('CallOk',style: TextStyle(color:  cubit.isSearch&&cubit.typeSearch=='callOk'?ColorManager.primary:ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                  Text('${cubit.countCallok}',style: TextStyle(color:  ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 14),),

                                ],
                              )),
                              TextButton(onPressed: (){
                                if(!cubit.isSearch){
                                  cubit.searchByValue(true,'callNo');
                                }else{cubit.searchByValue(false, '');}
                              }, child:Column(
                                children: [
                                  Text('CallNo',style: TextStyle(color:  cubit.isSearch&&cubit.typeSearch=='callNo'?ColorManager.primary:ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                  Text('${cubit.countCallno}',style: TextStyle(color:  ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 14),),

                                ],
                              )),
                              TextButton(onPressed: (){
                                if(!cubit.isSearch){
                                  cubit.searchByValue(true,'documentOk');
                                }else{cubit.searchByValue(false, '');}
                              }, child:Column(
                                children: [
                                  Text('DocumentOk',style: TextStyle(color:  cubit.isSearch&&cubit.typeSearch=='documentOk'?ColorManager.primary:ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                  Text('${cubit.countdocumentok}',style: TextStyle(color:  ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 14),),

                                ],
                              )),
                              TextButton(onPressed: (){
                                if(!cubit.isSearch){
                                  cubit.searchByValue(true,'documentNo');
                                }else{cubit.searchByValue(false, '');}
                              }, child:Column(
                                children: [
                                  Text('DocumentNo',style: TextStyle(color:  cubit.isSearch&&cubit.typeSearch=='documentNo'?ColorManager.primary:ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                  Text('${cubit.countdocumentno}',style: TextStyle(color:  ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 14),),

                                ],
                              )),
                            ],
                          ),
                        ),
                        

                        SizedBox(width: 20,),
                        TextButton(onPressed: (){
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
                         
                        }, child:Row(
                          children: [
                            Icon(Icons.logout_outlined,color:ColorManager.error ,),
                            SizedBox(width: 5,),
                            Text('Logout',style: TextStyle(color: ColorManager.error,fontWeight: FontWeight.bold,fontSize: 16),),

                            //Text('${cubit.countCallok}',style: TextStyle(color:  ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 14),),

                          ],
                        )),
                        


                      ],
                    ),

                  ),
                  //  Container(height: double.infinity,width: 1,color: Colors.grey,),
                  SizedBox(height: 20,),

                  Visibility(child: Row(
                    children: [
                      Visibility(


                        child: defaultButton(height: 25,width: 100,onPress: () async {
                          await cubit.confirmAndCancelSql(true) ;


                        }, name:'confirm'),
                        visible:cubit.statusOfList!='true' ,
                      ),
                      Visibility(
                        visible: cubit.statusOfList!='false',
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            defaultButton(color: Colors.blueGrey,height: 25,width: 100,onPress: () async {
                              cubit.confirmAndCancelSql(false).then((value) {

                              }) ;


                            }, name:'Reject'),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: cubit.statusOfList=='true',
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 20,),
                            defaultButton(height: 25,width: 100,onPress: () async {
                              cubit.callYesSql(true).then((value) {}) ;


                            }, name:'CallOK'),
                            SizedBox(width: 20,),
                            defaultButton(color: Colors.blueGrey,height: 25,width: 100,onPress: () async {
                              cubit.callYesSql(false).then((value) {}) ;


                            }, name:'NOT Answer'),
                            SizedBox(width: 20,),
                            defaultButton(height: 25,width: 120,onPress: () async {
                              cubit.documentOKSql().then((value) {}) ;


                            }, name:'Document ok'),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      defaultButton(color: Colors.red,height: 25,width: 100,onPress: () async {
                        cubit.deleteHiringSql();


                      }, name:'Delete'),
                      SizedBox(width: 20,),
                      defaultButton(color: Colors.blueGrey,height: 25,width: 100,onPress: () async {
                        cubit.createExcel();


                      }, name:'Export'),
                    ],
                  ),visible: cubit.selectedNID.isNotEmpty?true:false),
                  SizedBox(height: 20,),
                  search.text.isNotEmpty?dataTable(context,cubit.listOfSearch)
                      :cubit.listModelHiring.isNotEmpty? dataTable(context,cubit.listModelHiring)
                      :Column(
                    children: [
                      SizedBox(height: 200,),
                      Text('EMPTY!',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 30),),
                    ],
                  ),
                ],),
            ) ,
            floatingActionButton: FloatingActionButton(onPressed:() async {

              cubit.statusOfList='';
              cubit.getMyList();
              navigateTo(context, InsetInfoHiring());
            },child: Icon(Icons.add),),
          );
        }


    );
  }
}
