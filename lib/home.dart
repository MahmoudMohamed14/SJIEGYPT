import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/moduls/attend/add_suddenNormal_screen.dart';
import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';


import 'shared/constant/color_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: 'myId')=='sji'?
    Padding(
      padding: const EdgeInsets.all(1),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Expanded(
              child:  GestureDetector(
                onTap: (){
                  // AttendCubit.get(context).getPayOrReview('pay');

                  navigateTo(context, UploadSuddenNormalScreen ());
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 200,

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorManager.primary,),
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
                          Text('المرتب',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),


            ),
            // Expanded(
            //
            //   child: GestureDetector(
            //     onTap: (){
            //       //PermissionCubit.get(context).getOrderPermission();
            //       if(CacheHelper.getData(key: 'control')){
            //         AttendCubit.get(context).getDepart();
            //         navigateTo(context,DepartScreen());
            //       }else{
            //         PermissionCubit.get(context).getOrderPermissionSQL();
            //         // if(CacheHelper.getData(key: 'control'))   navigateTo(context, LayoutPermission());else navigateTo(context,MyScreen());
            //         navigateTo(context,MyScreen());}
            //     },
            //
            //     child: Padding(
            //         padding: const EdgeInsets.all(10),
            //         child:Container(
            //           width: 200,
            //
            //
            //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorManager.primary,),
            //           child: Padding(
            //             padding: const EdgeInsets.all(10.0),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //
            //                 Expanded(
            //                   child: Image(image: AssetImage('assets/holiday.png'),
            //                     // height: 90,
            //                     // width: 90,
            //                   ),
            //                 ),
            //                 Text('اجازه',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
            //               ],
            //             ),
            //           ),
            //         )
            //     ),
            //   ),
            // ),
            // Expanded(
            //
            //   child: GestureDetector(
            //     onTap: (){
            //       AttendCubit.get(context).getPayOrReview('review');
            //
            //       navigateTo(context, MonthsAttend());
            //     },
            //
            //
            //     child: Padding(
            //         padding: const EdgeInsets.all(10),
            //         child:Container(
            //           width: 200,
            //
            //
            //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorManager.primary,),
            //           child: Padding(
            //             padding: const EdgeInsets.all(10.0),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //
            //                 Expanded(
            //                   child: Image(image: AssetImage('assets/review.png'),
            //                     // height: 90,
            //                     // width: 90,
            //                   ),
            //                 ),
            //                 Text('مراجعة الاجازات',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
            //               ],
            //             ),
            //           ),
            //         )
            //     ),
            //   ),
            // ),

            // Expanded(
            //
            //   child:
            //
            //
            //      GestureDetector(
            //
            //        onTap: ()async{
            //       //   PermissionCubit.get(context).getOrderPermission();
            //       //   navigateTo(context, LayoutPermission());
            //         // print(  await AttendCubit.get(context).testSql());
            //          //
            //        },
            //       child: Padding(
            //         padding: const EdgeInsets.all(10),
            //         child: Stack(
            //           alignment: AlignmentDirectional.center,
            //           children: [Container(
            //             width: 200,
            //
            //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.orangeAccent.withOpacity(.5),),
            //             child: Padding(
            //               padding: const EdgeInsets.all(10.0),
            //               child: Column(
            //
            //                 mainAxisSize: MainAxisSize.min,
            //
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Expanded(
            //                     child: Image(image: AssetImage('assets/permission.jpg'),
            //                       // height: 90,
            //                       // width: 90,
            //                     ),
            //                   ),
            //                   Text('اذن',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            //                 ],
            //               ),
            //             ),
            //           ),
            //             Container(
            //               width: 200,
            //
            //               decoration:  BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.black45.withOpacity(.5),),
            //
            //             ),
            //             Text('قريبا',style: TextStyle( fontSize: 50, color: Colors.white70 ), )
            //
            //           ]
            //         ),
            //       ),
            //     ),
            //
            //
            // ),





          ],
        ),
      ),
    ):  BlocConsumer<AttendCubit,AttendStates>(
      listener: (context,state){},
      builder:  (context,state){
        return  state is GetUserLoadingState?Center(child: CircularProgressIndicator()) :Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color:Colors.black,width: 1.5)

            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                itemInTable(label: 'الاسم',value: '${CacheHelper.getData(key: 'myname')??''}',),
                itemInTable(label: 'القسم',value: '${CacheHelper.getData(key: 'depart')??''}'),
                itemInTable(label: 'الكود',value: '${CacheHelper.getData(key: 'myId')??''}'),
                itemInTable(label: 'الاعتيادي',value: '${CacheHelper.getData(key: 'normal')??''}'),
                itemInTable(label: 'العارضه',value: '${CacheHelper.getData(key: 'sudden')??''}'),
              //  itemInTable(label: 'اجمالي الاجازات المتاحه',value: '${int.parse(CacheHelper.getData(key: 'sudden')==''?'0':CacheHelper.getData(key: 'sudden'))+int.parse(CacheHelper.getData(key: 'normal')==''?'0':CacheHelper.getData(key: 'normal'))}'),
              ],
            ),
          ),
        );
      },

    );
    // Center(
    //   child: Container(
    //     // decoration: BoxDecoration(
    //     //
    //     //     image:DecorationImage(image: AssetImage('assets/sjilogo.jpg'),opacity: .3,fit: BoxFit.contain) ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(20),
    //       child: Align(
    //
    //         alignment: Alignment.topCenter,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Row(children: [
    //               Text('Name : ',style: TextStyle(fontWeight: FontWeight.bold),),
    //               Expanded(child: Text('${CacheHelper.getData(key: 'myname')}',style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,)),
    //
    //             ],),
    //             SizedBox(height: 20,),
    //             Row(children: [
    //               Text('Depart : ',style: TextStyle(fontWeight: FontWeight.bold),),
    //               Text('${CacheHelper.getData(key: 'depart')}',style: TextStyle(fontWeight: FontWeight.bold),),
    //
    //             ],),
    //             SizedBox(height: 20,),
    //             Row(children: [
    //               Text('Code: ',style: TextStyle(fontWeight: FontWeight.bold),),
    //               Text('${CacheHelper.getData(key: 'myId')}',style: TextStyle(fontWeight: FontWeight.bold),),
    //
    //             ],),
    //
    //             SizedBox(height: 50,),
    //             LinearPercentIndicator(
    //               lineHeight: 45,
    //               //width: 100,
    //
    //               percent: int.parse(CacheHelper.getData(key: 'normal')??0)/15,
    //               center: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   Text("اعتيادي",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
    //                   //SizedBox(height: 5,),
    //
    //                   Text('${CacheHelper.getData(key: 'normal')}',style: TextStyle(color: Colors.white)),
    //                 ],
    //               ),
    //               progressColor:ColorManager.lightPrimary,
    //             ),
    //             SizedBox(height: 20,),
    //             LinearPercentIndicator(
    //               lineHeight: 45,
    //
    //               percent: int.parse(CacheHelper.getData(key: 'sudden')??0)/15,
    //               center: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   Text("عارضه",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
    //                  // SizedBox(height: 5,),
    //
    //                   Text('${CacheHelper.getData(key: 'sudden')}',style: TextStyle(color: Colors.white)),
    //                 ],
    //               ),
    //               progressColor:ColorManager.lightPrimary,
    //             ),
    //
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );



  }

  Widget  itemInTable({String label='',String value='0',Color colorRow=Colors.white,Color colorText=Colors.black,}){
    return Container(
      color: colorRow,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Center(child: Text(label,style: TextStyle(color: colorText),))),
              Expanded(child: Center(child: Text(value,style: TextStyle(color: colorText),))),
              SizedBox(width: 2,)
            ],
          ),
          SizedBox(height: 10,),
          Container(width: double.infinity,height: 2,color: Colors.black,),

        ],
      ),
    );
  }
}
// Padding(
//   padding: const EdgeInsets.all(1),
//   child: Center(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//
//         Expanded(
//           child:  GestureDetector(
//             onTap: (){
//               AttendCubit.get(context).getPayOrReview('pay');
//
//               navigateTo(context, MonthsAttend());
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Container(
//                 width: 200,
//
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorManager.primary,),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//
//                     children: [
//                       Expanded(
//                         child: Image(image: AssetImage('assets/slip.jpg'),
//
//                           // height: 90,
//                           // width: 90,
//                         ),
//                       ),
//                       Text('المرتب',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//
//         ),
//         Expanded(
//
//           child: GestureDetector(
//             onTap: (){
//               //PermissionCubit.get(context).getOrderPermission();
//               if(CacheHelper.getData(key: 'control')){
//                 AttendCubit.get(context).getDepart();
//                 navigateTo(context,DepartScreen());
//               }else{
//                 PermissionCubit.get(context).getOrderPermissionSQL();
//                 // if(CacheHelper.getData(key: 'control'))   navigateTo(context, LayoutPermission());else navigateTo(context,MyScreen());
//                 navigateTo(context,MyScreen());}
//             },
//
//             child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child:Container(
//                   width: 200,
//
//
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorManager.primary,),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//
//                         Expanded(
//                           child: Image(image: AssetImage('assets/holiday.png'),
//                             // height: 90,
//                             // width: 90,
//                           ),
//                         ),
//                         Text('اجازه',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
//                       ],
//                     ),
//                   ),
//                 )
//             ),
//           ),
//         ),
//         Expanded(
//
//           child: GestureDetector(
//             onTap: (){
//               AttendCubit.get(context).getPayOrReview('review');
//
//               navigateTo(context, MonthsAttend());
//             },
//
//
//             child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child:Container(
//                   width: 200,
//
//
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorManager.primary,),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//
//                         Expanded(
//                           child: Image(image: AssetImage('assets/review.png'),
//                             // height: 90,
//                             // width: 90,
//                           ),
//                         ),
//                         Text('مراجعة الاجازات',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
//                       ],
//                     ),
//                   ),
//                 )
//             ),
//           ),
//         ),
//
//         // Expanded(
//         //
//         //   child:
//         //
//         //
//         //      GestureDetector(
//         //
//         //        onTap: ()async{
//         //       //   PermissionCubit.get(context).getOrderPermission();
//         //       //   navigateTo(context, LayoutPermission());
//         //         // print(  await AttendCubit.get(context).testSql());
//         //          //
//         //        },
//         //       child: Padding(
//         //         padding: const EdgeInsets.all(10),
//         //         child: Stack(
//         //           alignment: AlignmentDirectional.center,
//         //           children: [Container(
//         //             width: 200,
//         //
//         //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.orangeAccent.withOpacity(.5),),
//         //             child: Padding(
//         //               padding: const EdgeInsets.all(10.0),
//         //               child: Column(
//         //
//         //                 mainAxisSize: MainAxisSize.min,
//         //
//         //                 mainAxisAlignment: MainAxisAlignment.center,
//         //                 children: [
//         //                   Expanded(
//         //                     child: Image(image: AssetImage('assets/permission.jpg'),
//         //                       // height: 90,
//         //                       // width: 90,
//         //                     ),
//         //                   ),
//         //                   Text('اذن',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
//         //                 ],
//         //               ),
//         //             ),
//         //           ),
//         //             Container(
//         //               width: 200,
//         //
//         //               decoration:  BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.black45.withOpacity(.5),),
//         //
//         //             ),
//         //             Text('قريبا',style: TextStyle( fontSize: 50, color: Colors.white70 ), )
//         //
//         //           ]
//         //         ),
//         //       ),
//         //     ),
//         //
//         //
//         // ),
//
//
//
//
//
//       ],
//     ),
//   ),
// );

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled/componant/componant.dart';
// import 'package:untitled/componant/local/cache_helper.dart';
// import 'package:untitled/moduls/addplan/getplan.dart';
// import 'package:untitled/moduls/kittingScreen/kitting_screen.dart';
// import 'package:untitled/shared/constant/color_manager.dart';
// import 'package:untitled/shared/constant/test_styles_manager.dart';
// import 'moduls/plan/cubit/cubit_plan.dart';
// import 'moduls/plan/cubit/state_plan.dart';
//
// class AddKitting extends StatelessWidget {
//
//   String? date;
//   String ?shift;
//   AddKitting({this.date,this.shift});
//
//   TextEditingController code=TextEditingController();
//   TextEditingController ordertype=TextEditingController();
//   TextEditingController bag=TextEditingController();
//   TextEditingController capa=TextEditingController();
//   var listOperator;
//
//   var listId;
//
//   @override
//   Widget build(BuildContext context) {
//
//     listOperator=["Manga","Yassmen","Shiamaa Shabaan","Diaa","A.Ashraf","M.Abd EL-Twab","Houda","Hamada","Rasha"];
//
//
//
//     return BlocConsumer<PlanCubit,PlanStates>(
//       listener: (context,state){
//         // if (state is OredrTypeState){
//         // //  ordertype.text=PlanCubit.get(context).ordertype!;
//         //   bag.text=PlanCubit.get(context).qtybox != null ? PlanCubit.get(context).qtybox! :" " ;
//         //  // capa.text=PlanCubit.get(context).capa!;
//         // }
//
//       },
//
//     builder:(context,state){
//         var cubit=PlanCubit.get(context);
//
//       return Scaffold(
//     appBar: AppBar(
//
//       title: Text("Control"),
//       actions: [
//         // IconButton(onPressed: (){
//         //    navigateTo(context, GetPlan  ());
//         //     }, icon:Icon(Icons.navigate_next_sharp)),
//         // TextButton(onPressed: (){
//         //  cubit.getKittingComponant(code:cubit.code ,date: date,shift:  cubit.shift);
//         //  cubit.show=false;
//         //   print("######listofKitting#############");
//         //   print(PlanCubit.get(context).listofkitting.length);
//         //   print("######listofKittinglenth#############");
//         //  cubit.anyChange=0;
//         //
//         //   navigateTo(context, KittingScreen(listpomModel: PlanCubit.get(context).listofkitting,date: date,));
//         // }, child: Text("KittingScreen",style: TextStyle(color: ColorManager.darkPrimary),))
//         //
//     ],
//     ),
//       body: Padding(
//       padding: const EdgeInsets.all(20),
//       child: Center(
//         child: Container(
//           height: 500,
//           width: 300,
//           child: Column(
//           children: [
//
//           //operator
//     // Container(
//     //   padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
//     //   width: double.infinity,
//     //   height: 60,
//     //   decoration: BoxDecoration(
//     //       borderRadius: BorderRadius.circular(10),
//     //       border: Border.all(color: ColorManager.primary)
//     //
//     //   ),
//     //   child: DropdownButton(
//     //
//     //       isExpanded: true,
//     //       iconSize: 40,
//     //
//     //
//     //       value: PlanCubit.get(context).opreator,
//     //
//     //
//     //       onChanged: ( String?value){
//     //
//     //         PlanCubit.get(context).radioButtonopreator(operatorv: value);
//     //
//     //       },
//     //
//     //       items:List.generate(listOperator.length, (index) =>   DropdownMenuItem<String>(child: Text(listOperator[index],style: getBoldStyle(color: ColorManager.primary,)),value: listOperator[index],))
//     //   ),
//     // ),
//     //   const SizedBox(height: 20,),
//      //line
//             Text('Line',style: getBoldStyle(color: ColorManager.lightPrimary,fontSize: 18),),
//     Container(
//           padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
//           width: double.infinity,
//           height: 60,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: ColorManager.primary)
//
//           ),
//           child: DropdownButton(
//
//               isExpanded: true,
//               iconSize: 40,
//
//
//               value: PlanCubit.get(context).line,
//
//
//               onChanged: ( String?value){
//
//                 PlanCubit.get(context).radioButtonLine(linev: value);
//                // PlanCubit.get(context).getCodeForLine(value: value,);
//
//               },
//
//               items:List.generate(cubit.listoflineName.length, (index) =>   DropdownMenuItem<String>(child: Text(cubit.listoflineName[index],style: getBoldStyle(color: ColorManager.primary,)),value: cubit.listoflineName[index],))
//           ),
//     ),
//     const SizedBox(height: 20,),
//             Text('Code',style: getBoldStyle(color: ColorManager.lightPrimary,fontSize: 18),),
//      //code
//     Container(
//           padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
//           width: double.infinity,
//           height: 60,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: ColorManager.primary)
//
//           ),
//           child: DropdownButton(
//             hint:const Text('code'),
//               isExpanded: true,
//               iconSize: 40,
//
//
//               value:PlanCubit.get(context).code,
//
//
//               onChanged: ( String?value){
//
//                PlanCubit.get(context).radioButtonID(idv: value);
//               // PlanCubit.get(context).orderType(code: value);
//
//
//               },
//
//               items: List.generate(PlanCubit.get(context).codefoechLine!.length, (index) =>   DropdownMenuItem<String>(child: Text(PlanCubit.get(context).codefoechLine![index],style: getBoldStyle(color: ColorManager.primary,)),value: PlanCubit.get(context).codefoechLine![index],))
//
//           ),
//     ),
//     const SizedBox(height: 20,),
//             Center(
//               child: ElevatedButton(
//                 child: const Text("Next Page"),
//                 onPressed:(){
//                   cubit.getKittingComponant(code:cubit.code ,date: date,shift:  cubit.shift);
//                   cubit.show=false;
//                   print("######listofKitting#############");
//                   print(PlanCubit.get(context).listofkitting.length);
//                   print("######listofKittinglenth#############");
//                   cubit.anyChange=0;
//
//                   navigateTo(context, KittingScreen(listpomModel: PlanCubit.get(context).listofkitting,date: date,emt: true,));
//
//
//
//
//
//
//                 },
//               ),
//             ),
//
//
//
//     // SizedBox(height: 20,),
//     // defaultEditText(control: code, label: "code", validat: (s){},onchange: (va){
//     //   PlanCubit.get(context).orderType(code: va);
//     //
//     // }),
//   //  const SizedBox(height: 10,),
//     // defaultEditText(control: ordertype, label: "OrderType", validat: (s){}),
//     // const SizedBox(height: 10,),
//     // defaultEditText(control:bag, label: "QTYBox", validat: (s){}),
//     // const SizedBox(height: 10,),
//     // defaultEditText(control:capa, label: "Capa", validat: (s){}),
//
//
//
//     ],
//     ),
//         ),
//       ),
//     ),
//     );
//     }
//
//     );
//
//
//   }
// }
//
//
//
//
