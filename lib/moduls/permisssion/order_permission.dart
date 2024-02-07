import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/moduls/permisssion/AcceptRequest.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';
import 'package:untitled/moduls/permisssion/permission_status.dart';
import 'package:untitled/shared/constant/color_manager.dart';
import 'package:untitled/shared/constant/test_styles_manager.dart';

class MyScreen extends StatefulWidget {
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final _currentDate = DateTime.now();

  final _dayFormatter = DateFormat('d');

  final _monthFormatter = DateFormat('MMM');

  final _nameFormatter = DateFormat('EEEE');
  TextEditingController reasonControl= new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final dates = <Widget>[];

    for (int i = 0; i < 5; i++) {
      final date = _currentDate.add(Duration(days: i + 1));
      int pending=0;
      int accept=0;
      int notAccept=0;

        PermissionCubit.get(context).listofpermis.forEach((element) {
         if( element.date=="${_dayFormatter.format(date)} ${_monthFormatter.format(date)}"&& element.code==CacheHelper.getData(key: 'myId')&&element.state=='pending') pending=1;
        else if( element.date=="${_dayFormatter.format(date)} ${_monthFormatter.format(date)}"&& element.code==CacheHelper.getData(key: 'myId')&&element.state=='Accept') accept=1;
         else if( element.date=="${_dayFormatter.format(date)} ${_monthFormatter.format(date)}"&& element.code==CacheHelper.getData(key: 'myId')&&element.state=='NotAccept') notAccept=1;
        });

        if(pending==1) dates.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<PermissionCubit, PermissionStates>(
              listener: (context, state) {


              },
              builder: (context, state) {
                var cubit = PermissionCubit.get(context);
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.primary),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(


                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(_nameFormatter.format(date), style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,),),
                            Text(
                                "${_dayFormatter.format(date)} ${_monthFormatter
                                    .format(date)}",style: TextStyle( color: Colors.white,),),

                          ],
                        ),
                        Spacer(),
                        Icon(Icons.watch_later_outlined,color: Colors.white,),
                        SizedBox(width: 10,),
                        defaultButton(onPress: () {
                          showDialog(


                              barrierDismissible: false,
                              context: context, builder: (context) =>
                              AlertDialog(

                                title: Text('حذف طلب الاجازه'),

                                actions: [
                                  TextButton(onPressed: () {
                                    Navigator.pop(context);
                                  },
                                      child: Text('Cancel',
                                        style: TextStyle(color: Colors.red),)),
                                  TextButton(onPressed: () {
                                    cubit.deletePermissionSql(context, "${_dayFormatter.format(date)} ${_monthFormatter.format(date)}",

                                    );
                                  }, child: Text('تاكيد')),

                                ],

                              ));
                        }, name: 'حذف', width: 80, height: 30,color: Colors.red),

                      ],
                    ),
                  ),
                );
              }

          ),
        )) ;
        else if (accept==1) dates.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<PermissionCubit, PermissionStates>(
              listener: (context, state) {


              },
              builder: (context, state) {
              //  var cubit = PermissionCubit.get(context);
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  ColorManager.primary),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(


                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(_nameFormatter.format(date), style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,),),
                            Text(
                                "${_dayFormatter.format(date)} ${_monthFormatter
                                    .format(date)}",style: TextStyle( color: Colors.white,),),

                          ],
                        ),
                        Spacer(),
                        Icon(Icons.done_outline,color: Colors.green,),
                        // SizedBox(width: 10,),
                        // defaultButton(onPress: () {
                        //   showDialog(
                        //
                        //
                        //       barrierDismissible: false,
                        //       context: context, builder: (context) =>
                        //       AlertDialog(
                        //
                        //         title: Text('حذف طلب الاجازه'),
                        //
                        //         actions: [
                        //           TextButton(onPressed: () {
                        //             Navigator.pop(context);
                        //           },
                        //               child: Text('Cancel',
                        //                 style: TextStyle(color: Colors.red),)),
                        //           TextButton(onPressed: () {
                        //             cubit.deletePermissionSql(
                        //               context,
                        //
                        //
                        //
                        //               "${_dayFormatter.format(
                        //                   date)} ${_monthFormatter.format(
                        //                   date)}",
                        //
                        //             );
                        //           }, child: Text('تاكيد')),
                        //
                        //         ],
                        //
                        //       ));
                        // }, name: 'حذف', width: 80, height: 30,color: Colors.red),

                      ],
                    ),
                  ),
                );
              }

          ),
        ));
        else if (notAccept==1) dates.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<PermissionCubit, PermissionStates>(
              listener: (context, state) {


              },
              builder: (context, state) {
               // var cubit = PermissionCubit.get(context);
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  ColorManager.primary),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(


                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(_nameFormatter.format(date), style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,),),
                            Text(
                                "${_dayFormatter.format(date)} ${_monthFormatter
                                    .format(date)}",style: TextStyle( color: Colors.white,),),

                          ],
                        ),
                        Spacer(),
                        Icon(Icons.cancel_outlined,color: Colors.red,),
                        // SizedBox(width: 10,),
                        // defaultButton(onPress: () {
                        //   showDialog(
                        //
                        //
                        //       barrierDismissible: false,
                        //       context: context, builder: (context) =>
                        //       AlertDialog(
                        //
                        //         title: Text('حذف طلب الاجازه'),
                        //
                        //         actions: [
                        //           TextButton(onPressed: () {
                        //             Navigator.pop(context);
                        //           },
                        //               child: Text('Cancel',
                        //                 style: TextStyle(color: Colors.red),)),
                        //           TextButton(onPressed: () {
                        //             cubit.deletePermission(
                        //               context,
                        //
                        //               CacheHelper.getData(key: 'myId'),
                        //
                        //               "${_dayFormatter.format(
                        //                   date)} ${_monthFormatter.format(
                        //                   date)}",
                        //
                        //             );
                        //           }, child: Text('تاكيد')),
                        //
                        //         ],
                        //
                        //       ));
                        // }, name: 'حذف', width: 80, height: 30,color: Colors.red),

                      ],
                    ),
                  ),
                );
              }

          ),
        ));
        else dates.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<PermissionCubit, PermissionStates>(
              listener: (context, state) {

              },
              builder: (context, state) {
                var cubit = PermissionCubit.get(context);
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  ColorManager.primary),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(


                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(_nameFormatter.format(date), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,),),
                            Text("${_dayFormatter.format(date)} ${_monthFormatter.format(date)}",style: TextStyle( color: Colors.white,),),
                             ],
                        ),
                        Spacer(),
                        Visibility(
                          visible: DateTime.now().add(Duration(days: 1)).hour>14 && i==0,
                          child:const SizedBox.shrink() ,
                          replacement: defaultButton(onPress: () {
                       cubit.valueofdepart='';
                       showDialog(


                           barrierDismissible: false,
                           context: context, builder: (context) =>
                           AlertDialog(

                             title: Text('طلب اجازه'),
                             content: state is PermissionLoadingState
                                 ? CircularProgressIndicator()
                                 : Form(
                               // key: keyFormpassword,
                                 child: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   children: [
                                     Container(
                                       padding: const EdgeInsets.symmetric(
                                           horizontal: 12, vertical: 4),
                                       width: double.infinity,
                                       height: 60,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius
                                               .circular(10),
                                           border: Border.all(
                                               color: ColorManager.primary)

                                       ),
                                       child: BlocConsumer<
                                           PermissionCubit,
                                           PermissionStates>(
                                         listener: (context, state) {},
                                         builder: (context, state) =>
                                             DropdownButton(

                                                 isExpanded: true,
                                                 iconSize: 50,


                                                 value: PermissionCubit
                                                     .get(context)
                                                     .valueofdepart,
                                                 //cubit.shift,


                                                 onChanged: (String?value) {
                                                   PermissionCubit.get(
                                                       context)
                                                       .onChangeDepart(
                                                       value);

                                                   //cubit.radioButtonShift(sht: value);


                                                 },

                                                 items: i==0 || (i==2 && _nameFormatter.format(date)=='Sunday')?List.generate(
                                                     PermissionCubit
                                                         .get(context)
                                                         .Vaction
                                                         .length, (index) =>
                                                     DropdownMenuItem<
                                                         String>(child: Text(
                                                         PermissionCubit
                                                             .get(context)
                                                             .Vaction[index],
                                                         style: getBoldStyle(
                                                           color: ColorManager
                                                               .primary,)),
                                                       value: PermissionCubit
                                                           .get(context)
                                                           .Vaction[index],)):List.generate(
                                                     PermissionCubit
                                                         .get(context)
                                                         .allVaction
                                                         .length, (index) =>
                                                     DropdownMenuItem<
                                                         String>(child: Text(
                                                         PermissionCubit
                                                             .get(context)
                                                             .allVaction[index],
                                                         style: getBoldStyle(
                                                           color: ColorManager
                                                               .primary,)),
                                                       value: PermissionCubit
                                                           .get(context)
                                                           .allVaction[index],))

                                             ),
                                       ),

                                     ),
                                     SizedBox(height: 20,),
                                     defaultEditText(control: reasonControl,
                                         label: 'السبب', maxLine: 3)

                                   ],


                                 )
                             ),
                             actions:[
                               TextButton(onPressed: () {
                                 Navigator.pop(context);
                               },
                                   child: Text('Cancel',
                                     style: TextStyle(color: Colors.red),)),
                               TextButton(onPressed: () {
                                 if(cubit.valueofdepart.isEmpty){
                                   showToast(text: 'لم يتم اختيار نوع الاجازة', state: ToastState.ERROR);
                                 }
                                 else cubit.orderPermission(
                                     context,
                                     _nameFormatter.format(date),
                                     reasonControl.text ??'',

                                     CacheHelper.getData(key: 'myId'),
                                     CacheHelper.getData(key: 'myname'),
                                     "${_dayFormatter.format(date)} ${_monthFormatter.format(date)}",'pending',   cubit.valueofdepart);
                               }, child: Text('تاكيد')),

                             ],

                           ));
                     }, name: 'طلب', width: 80, height: 30),
                        )




                      ],
                    ),
                  ),
                );
              }

          ),
        ));


      // comment of  if(CacheHelper.getData(key: 'depart')!='HR')
      // else {
      //   dates.add(Padding(
      //     padding: const EdgeInsets.all(8),
      //     child: BlocConsumer<PermissionCubit, PermissionStates>(
      //         listener: (context, state) {
      //
      //         },
      //         builder: (context, state) {
      //           var cubit = PermissionCubit.get(context);
      //           return GestureDetector(
      //             onTap: (){
      //               cubit.getOrderPermissionSQLByDepartAndDate('${_dayFormatter.format(date)} ${_monthFormatter.format(date)}');
      //               navigateTo(context, LayoutPermission());
      //             },
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(12),
      //                   color:  ColorManager.primary),
      //               width: double.infinity,
      //               alignment: Alignment.centerLeft,
      //               child: Padding(
      //                   padding: const EdgeInsets.all(0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //
      //
      //                   children: [
      //                     Column(
      //                       mainAxisSize: MainAxisSize.min,
      //
      //                       crossAxisAlignment: CrossAxisAlignment.center,
      //
      //                       children: [
      //                         Expanded(
      //                           child: Text(_nameFormatter.format(date), style: TextStyle(
      //                             color: Colors.white,
      //                               fontWeight: FontWeight.bold, fontSize: 20),),
      //                         ),
      //
      //                      Expanded(
      //                        child: Text("${_dayFormatter.format(date)} ${_monthFormatter
      //                                   .format(date)}",style: TextStyle( color: Colors.white,),),
      //                      ),
      //
      //                       ],
      //                     ),
      //                    // Spacer(),
      //                     // defaultButton(onPress: () {
      //                     //   showDialog(
      //                     //
      //                     //
      //                     //       barrierDismissible: false,
      //                     //       context: context, builder: (context) =>
      //                     //       AlertDialog(
      //                     //
      //                     //         title: Text('طلب اجازه'),
      //                     //         content: state is PermissionLoadingState
      //                     //             ? CircularProgressIndicator()
      //                     //             : Form(
      //                     //           // key: keyFormpassword,
      //                     //             child: Column(
      //                     //               mainAxisSize: MainAxisSize.min,
      //                     //               children: [
      //                     //                 Container(
      //                     //                   padding: const EdgeInsets.symmetric(
      //                     //                       horizontal: 12, vertical: 4),
      //                     //                   width: double.infinity,
      //                     //                   height: 60,
      //                     //                   decoration: BoxDecoration(
      //                     //                       borderRadius: BorderRadius
      //                     //                           .circular(10),
      //                     //                       border: Border.all(
      //                     //                           color: ColorManager.primary)
      //                     //
      //                     //                   ),
      //                     //                   child: BlocConsumer<
      //                     //                       PermissionCubit,
      //                     //                       PermissionStates>(
      //                     //                     listener: (context, state) {},
      //                     //                     builder: (context, state) =>
      //                     //                         DropdownButton(
      //                     //
      //                     //                             isExpanded: true,
      //                     //                             iconSize: 50,
      //                     //
      //                     //
      //                     //                             value: PermissionCubit
      //                     //                                 .get(context)
      //                     //                                 .valueofdepart,
      //                     //                             //cubit.shift,
      //                     //
      //                     //
      //                     //                             onChanged: (String?value) {
      //                     //                               PermissionCubit.get(
      //                     //                                   context)
      //                     //                                   .onChangeDepart(
      //                     //                                   value);
      //                     //
      //                     //                               //cubit.radioButtonShift(sht: value);
      //                     //
      //                     //
      //                     //                             },
      //                     //
      //                     //                             items: i==0 || (i==2 && _nameFormatter.format(date)=='Sunday')?List.generate(
      //                     //                                 PermissionCubit
      //                     //                                     .get(context)
      //                     //                                     .Vaction
      //                     //                                     .length, (index) =>
      //                     //                                 DropdownMenuItem<
      //                     //                                     String>(child: Text(
      //                     //                                     PermissionCubit
      //                     //                                         .get(context)
      //                     //                                         .Vaction[index],
      //                     //                                     style: getBoldStyle(
      //                     //                                       color: ColorManager
      //                     //                                           .primary,)),
      //                     //                                   value: PermissionCubit
      //                     //                                       .get(context)
      //                     //                                       .Vaction[index],)):List.generate(
      //                     //                                 PermissionCubit
      //                     //                                     .get(context)
      //                     //                                     .allVaction
      //                     //                                     .length, (index) =>
      //                     //                                 DropdownMenuItem<
      //                     //                                     String>(child: Text(
      //                     //                                     PermissionCubit
      //                     //                                         .get(context)
      //                     //                                         .allVaction[index],
      //                     //                                     style: getBoldStyle(
      //                     //                                       color: ColorManager
      //                     //                                           .primary,)),
      //                     //                                   value: PermissionCubit
      //                     //                                       .get(context)
      //                     //                                       .allVaction[index],))
      //                     //
      //                     //                         ),
      //                     //                   ),
      //                     //
      //                     //                 ),
      //                     //                 SizedBox(height: 20,),
      //                     //                 defaultEditText(
      //                     //                     label: 'السبب', maxLine: 3)
      //                     //
      //                     //               ],
      //                     //
      //                     //
      //                     //             )
      //                     //         ),
      //                     //         actions:[
      //                     //           TextButton(onPressed: () {
      //                     //             Navigator.pop(context);
      //                     //           },
      //                     //               child: Text('Cancel',
      //                     //                 style: TextStyle(color: Colors.red),)),
      //                     //           TextButton(onPressed: () {
      //                     //             if(cubit.valueofdepart.isEmpty){
      //                     //               showToast(text: 'لم يتم اختيار نوع الاجازة', state: ToastState.ERROR);
      //                     //             }
      //                     //             else cubit.orderPermission(
      //                     //                 context,
      //                     //                 _nameFormatter.format(date),
      //                     //                 cubit.valueofdepart,
      //                     //                 CacheHelper.getData(key: 'myId'),
      //                     //                 CacheHelper.getData(key: 'myname'),
      //                     //                 "${_dayFormatter.format(date)} ${_monthFormatter.format(date)}",'pending');
      //                     //           }, child: Text('تاكيد')),
      //                     //
      //                     //         ],
      //                     //
      //                     //       ));
      //                     // }, name: 'طلب', width: 80, height: 30),
      //
      //                  ],
      //                 ),
      //               ),
      //             ),
      //           );
      //         }
      //
      //     ),
      //   ));
      // }

    }

    return BlocConsumer<PermissionCubit,PermissionStates>(
      listener: (context,state){
        if(state is PermissionGetSuccessState ||state is PermissionErrorState) setState(() {
          print('ok rebuild');

        });
      },
      builder:(context,state){
        return  Builder(
          builder: (context) {
            if(CacheHelper.getData(key: 'control')) return Scaffold(
              appBar: AppBar(
                title: Text('Holiday'),

              ),
              body:Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: dates.map((widget) => Expanded(child: widget)).toList(),
                ),
              ),
            );
            else return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: dates.map((widget) => Expanded(child: widget)).toList(),
              ),
            );

          }
        );

      } ,

    );
  }

}

