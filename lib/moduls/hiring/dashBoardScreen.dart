import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/moduls/hiring/allDataBaseScreen.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';
import 'package:untitled/moduls/hiring/design.dart';
import 'package:untitled/moduls/hiring/documentScreen.dart';
import 'package:untitled/moduls/hiring/process_hiring.dart';
import 'package:untitled/moduls/hiring/safetyScrean.dart';
import 'package:untitled/shared/constant/color_manager.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TextEditingController? search=new TextEditingController();
    // TextEditingController? shoesSizeControl=new TextEditingController();
    return  BlocConsumer<HiringCubit,HiringStates>(
        listener: (context,state){},
        builder:  (context,state){
          var cubit=HiringCubit.get(context);
          return  Scaffold(



            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Expanded(
                  child: Stack(
                    
                    children: [

                      Container(



                        decoration: BoxDecoration(

                           // color: ColorManager.primary,
                           // borderRadius:BorderRadius.circular(20)
                          // shape: BoxShape.circle
                        ),
                        height: 100,
                        child:Center(
                          child: Row(
                            //mainAxisSize: MainAxisSize,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10,left: 10,bottom: 20,right: 20),
                                child: Image(

                                  //width: 150,
                                    height: 80,
                                    image: AssetImage('assets/sji.png')
                                ),
                              ),
                             // SizedBox(width: ,),
                              Center(child: Text('Dashboard SJI HR',style: TextStyle(fontWeight: FontWeight.bold,color: ColorManager.primary,fontSize: 30),)),
                             Spacer(),
                              TextButton(onPressed: (){
                                signOut( context);

                              },
                                  child:Row(
                                    children: [
                                      Icon(Icons.logout_outlined,color:ColorManager.error ,),
                                      SizedBox(width: 5,),
                                      Text('Logout',style: TextStyle(color: ColorManager.error,fontWeight: FontWeight.bold,fontSize: 16),),

                                      //Text('${cubit.countCallok}',style: TextStyle(color:  ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ))
                              //Text('$count',style: TextStyle(fontWeight: FontWeight.bold,color: ColorManager.white),)
                            ],
                          ),
                        ) ,
                      ),



                    ],
                  ),
                ),



                Expanded(
                  child: Row(
                    children: [
                      counterDashBoard("DataBase All Worker ",cubit.numOfWork),
                      SizedBox(width: 10,),
                      counterDashBoard("Out Of Service",cubit.numOfEndWork),
                      SizedBox(width: 10,),
                      counterDashBoard("New Hiring ",cubit.numOfWait),
                      SizedBox(width: 10,),
                      counterDashBoard("Confirm List ",cubit.numOfConfirm),
                      SizedBox(width: 10,),
                      counterDashBoard("Reject ",cubit.numOfReject),
                    ],
                  ),
                ),
             


                Expanded(
                  child: Row(
                    children: [
                     Expanded(
                       child: GestureDetector(

                         onTap: (){

                           cubit.onSelectAll(false);
                             cubit.typeOfAccountHiring='workdata';
                             cubit.getMyList();
                             navigateTo(context, AllDataBaseScreen());


                         },
                         child: navigationDashBoard("DataBase  "),
                       ),
                     ),
                     SizedBox(width: 10,),
                      Expanded(child: GestureDetector(
                          onTap: (){

                            cubit.onSelectAll(false);
                            cubit.typeOfAccountHiring='endwork';
                            cubit.getMyList();
                            navigateTo(context, AllDataBaseScreen());


                          }
                        ,
                          child: navigationDashBoard("Out Of Service"))),

                     SizedBox(width: 10,),
                      Expanded(
                        child: GestureDetector(onTap: (){
                          cubit.onSelectAll(false);
                          cubit.typeOfAccountHiring='hiring';
                          cubit.getMyList();
                          navigateTo(context, ProcessHiring());
                        },child: navigationDashBoard("Hiring")),
                      ),
                      SizedBox(width: 10,),
                      Expanded(child: GestureDetector(onTap: (){
                        cubit.onSelectAll(false);
                        cubit.typeOfAccountHiring='document';
                        cubit.getMyList();
                        navigateTo(context, DocumentScreen());
                      },child: navigationDashBoard("Document "))),

                    SizedBox(width: 10,),
                      Expanded(child: GestureDetector(onTap: (){
                        cubit.onSelectAll(false);
                        cubit.typeOfAccountHiring='safety';
                        cubit.getMyList();
                        navigateTo(context, SafetyScreen());
                      },
                      child: navigationDashBoard("Safety"))),



                    ],
                  ),
                ),
                

              ],),
            ),

          );
        }


    );
  }
}


