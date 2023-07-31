
import 'package:flutter/material.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/moduls/attend/getHistory.dart';
import 'package:untitled/moduls/login/login_screen.dart';
import 'package:untitled/moduls/permisssion/AcceptRequest.dart';
import 'package:untitled/moduls/permisssion/order_permission.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';




class HomeLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SJI EGYPT'),
        centerTitle: true,
        actions: [



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(onPressed: (){
              CacheHelper.removeWithKey(key: 'isLogin');
              CacheHelper.removeWithKey(key: 'myId');
              CacheHelper.removeWithKey(key: 'isAtt');
               CacheHelper.removeWithKey(key: 'isAdmin');
              CacheHelper.removeWithKey(key: 'myname');
              if(CacheHelper.getData(key: 'control')){
                CacheHelper.removeWithKey(key: 'control');
                CacheHelper.removeWithKey(key: 'depart');
              }else CacheHelper.removeWithKey(key: 'control');

              navigateAndFinish(context, LoginScreen());
              //  cubit.pickFileAttend();
            }, icon: Icon(Icons.login_outlined)),
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(
                child:  GestureDetector(
                  onTap: (){
                    navigateTo(context, MonthsAttend());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 200,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.orangeAccent.withOpacity(.5),),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Expanded(
                              child: Image(image: AssetImage('assets/slip.jpg'),

                                // height: 90,
                                // width: 90,
                              ),
                            ),
                            Text('المرتب',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


              ),

              Expanded(

                child:


                   GestureDetector(

                    // onTap: (){
                    //   PermissionCubit.get(context).getOrderPermission();
                    //   navigateTo(context, LayoutPermission());
                    //
                    // },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [Container(
                          width: 200,

                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.orangeAccent.withOpacity(.5),),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(

                              mainAxisSize: MainAxisSize.min,

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image(image: AssetImage('assets/permission.jpg'),
                                    // height: 90,
                                    // width: 90,
                                  ),
                                ),
                                Text('اذن',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                          Container(
                            width: 200,

                            decoration:  BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.black45.withOpacity(.5),),

                          ),
                          Text('قريبا',style: TextStyle( fontSize: 50, color: Colors.white70 ), )

                        ]
                      ),
                    ),
                  ),


              ),

              Expanded(

                child: GestureDetector(
                  // onTap: (){
                  //   PermissionCubit.get(context).getOrderPermission();
                  // if(CacheHelper.getData(key: 'control'))   navigateTo(context, LayoutPermission());else navigateTo(context,MyScreen());
                  // },

                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children:  [Container(
                         width: 200,


                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.orangeAccent.withOpacity(.5),),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Expanded(
                                child: Image(image: AssetImage('assets/holiday.png'),
                                  // height: 90,
                                  // width: 90,
                                ),
                              ),
                              Text('اجازه',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ),
                        Container(
                          width: 200,

                          decoration:  BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.black45.withOpacity(.5),),

                        ),
                        Text('قريبا',style: TextStyle( fontSize: 50, color: Colors.white70 ), )
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import 'package:untitled/componant/componant.dart';
// import 'package:untitled/componant/local/cache_helper.dart';
// import 'package:untitled/moduls/addCodeBox/addCodeBox.dart';
//
// import 'package:untitled/moduls/addPom/addPomScreen.dart';
// import 'package:untitled/moduls/addPom/cubit/addCodeScreen.dart';
// import 'package:untitled/moduls/addplan/addPlanScreen.dart';
// import 'package:untitled/moduls/addplan/getplan.dart';
// import 'package:untitled/moduls/attend/add_attend_screen.dart';
// import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
// import 'package:untitled/moduls/login/login_screen.dart';
// import 'package:untitled/shared/constant/color_manager.dart';
//
// import '../attend/attendCubit/add_paySlip.dart';
//
//
// class HomeLayout extends StatelessWidget {
//   const HomeLayout({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(),
//      body: Column(
//        children: [
//          Expanded(
//            child: Row(
//              width: double.infinity,
//
//              children: [
//                Expanded(
//                  child: Container(
//                    height: 100,
//
//                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                  ),
//                ),
//                Expanded(
//                  child: Container(
//                    height: 100,
//                    width: double.infinity,
//                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                  ),
//                )
//              ],
//            ),
//          )
//        ],
//      ),
//      //  appBar: AppBar(
//      //    actions: [IconButton(onPressed: (){
//      //      CacheHelper.removeWithKey(key: 'isLogin');
//      //      CacheHelper.removeWithKey(key: 'line');
//      //      CacheHelper.removeWithKey(key: 'isAdmin');
//      //      navigateAndFinish(context, LoginScreen());
//      //
//      //    }, icon: Icon(Icons.login_outlined),)],
//      //
//      //
//      //  ),
//      //
//      // body: SingleChildScrollView(
//      //   physics: BouncingScrollPhysics(),
//      //   scrollDirection: Axis.horizontal,
//      //   child: SingleChildScrollView(
//      //     physics: BouncingScrollPhysics(),
//      //     scrollDirection: Axis.vertical,
//      //     child: Container(
//      //       alignment: AlignmentDirectional.center,
//      //       height: 500,
//      //       width: 500,
//      //       color: ColorManager.white,
//      //       child: Column(
//      //         mainAxisAlignment: MainAxisAlignment.center,
//      //
//      //
//      //
//      //          children: [
//      //           Row(
//      //
//      //             children: [
//      //               GestureDetector(
//      //
//      //                 onTap: (){
//      //                   navigateTo(context,UploadPomScreen());
//      //                 },
//      //                 child: Card(child: Container(
//      //                   color:ColorManager.darkPrimary ,
//      //                   height: 100,
//      //                   width: 200,
//      //                   child: Center(child: const Text('Add BOM',style:TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold) ,)),)),
//      //               ),
//      //               GestureDetector(
//      //
//      //                 onTap: (){
//      //                   navigateTo(context,UploalPlan());
//      //                 },
//      //                 child: Card(child: Container(
//      //                   color:ColorManager.darkPrimary ,
//      //                   height: 100,
//      //                   width: 200,
//      //                   child: Center(child: const Text('AddPlan',style:TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold) ,)),)),
//      //               ),
//      //
//      //             ],
//      //           ),
//      //
//      //            Row(
//      //              children: [
//      //                GestureDetector(
//      //                  onTap: (){
//      //                    navigateTo(context,AddCodeBox());
//      //                  },
//      //                  child: Card(child: Container(
//      //                    color:ColorManager.darkPrimary ,
//      //                    height: 100,
//      //                    width: 200,
//      //                    child: Center(child: const Text('AddCodeBox',style:TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold) ,)),)),
//      //                ),
//      //                GestureDetector(
//      //                  onTap: (){
//      //                    navigateTo(context,UploadCodeScreen ());
//      //                  },
//      //                  child: Card(child: Container(
//      //                    color:ColorManager.darkPrimary ,
//      //                    height: 100,
//      //                    width: 200,
//      //                    child: Center(child: const Text('AddCode',style:TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold) ,)),)),
//      //                ),
//      //
//      //              ],
//      //            ),
//      //
//      //            Row(
//      //              children: [
//      //                GestureDetector(
//      //                  onTap: (){
//      //                  //  navigateTo(context,GetPlan());
//      //
//      //                    navigateTo(context,UploadPaySlipScreen());
//      //                  },
//      //                  child: Card(child: Container(
//      //                    color:ColorManager.darkPrimary ,
//      //                    height: 100,
//      //                    width: 200,//410,
//      //                    child: Center(child: const Text('Monitor',style:TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold) ,)),)),
//      //                ),
//      //                GestureDetector(
//      //
//      //                  onTap: (){
//      //                    navigateTo(context,UploadAttendScreen(isEdi: false,delet: false,));
//      //                  },
//      //                  child: Card(child: Container(
//      //                    color:ColorManager.darkPrimary ,
//      //                    height: 100,
//      //                    width:200, //410,
//      //                    child: Center(child: const Text('Attendance',style:TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold) ,)),)),
//      //                ),
//      //              ],
//      //            ),
//      //            Row(
//      //              children: [
//      //
//      //                GestureDetector(
//      //
//      //                  onTap: (){
//      //                    navigateTo(context,UploadAttendScreen(isEdi: true,delet: false,));
//      //                  },
//      //                  child: Card(child: Container(
//      //                    color:ColorManager.darkPrimary ,
//      //                    height: 100,
//      //                    width:200, //410,
//      //                    child: Center(child: const Text('upload CheckOut',style:TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold) ,)),)),
//      //                ),
//      //                GestureDetector(
//      //
//      //                  onTap: (){
//      //                    navigateTo(context,UploadAttendScreen(isEdi: true,delet: true,));
//      //                  },
//      //                  child: Card(child: Container(
//      //                    color:ColorManager.darkPrimary ,
//      //                    height: 100,
//      //                    width:200, //410,
//      //                    child: Center(child: const Text('Delete Attend',style:TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold) ,)),)),
//      //                ),
//      //              ],
//      //            ),
//      //
//      //          ],
//      //        ),
//      //     ),
//      //   ),
//      // ),
//     );
//   }
// }
