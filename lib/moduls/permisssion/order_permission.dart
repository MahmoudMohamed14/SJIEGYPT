import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
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

  @override
  Widget build(BuildContext context) {

    final dates = <Widget>[];

    for (int i = 0; i < 5; i++) {
      final date = _currentDate.add(Duration(days: i + 1));
      int pending=0;
      int accept=0;
      int notAccept=0;
      if(PermissionCubit.get(context).listofpermis.isNotEmpty) {
        PermissionCubit.get(context).listofpermis.forEach((element) {
         if( element.date=="${_dayFormatter.format(date)} ${_monthFormatter.format(date)}"&& element.id==CacheHelper.getData(key: 'myId')&&element.state=='pending') pending=1;
        else if( element.date=="${_dayFormatter.format(date)} ${_monthFormatter.format(date)}"&& element.id==CacheHelper.getData(key: 'myId')&&element.state=='Accept') accept=1;
         else if( element.date=="${_dayFormatter.format(date)} ${_monthFormatter.format(date)}"&& element.id==CacheHelper.getData(key: 'myId')&&element.state=='NotAccept') notAccept=1;
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
                      color: Colors.orangeAccent.withOpacity(.5)),
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
                                fontWeight: FontWeight.bold, fontSize: 20),),
                            Text(
                                "${_dayFormatter.format(date)} ${_monthFormatter
                                    .format(date)}"),

                          ],
                        ),
                        Spacer(),
                        Icon(Icons.watch_later_outlined),
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
                                    cubit.deletePermission(
                                        context,

                                        CacheHelper.getData(key: 'myId'),

                                        "${_dayFormatter.format(
                                            date)} ${_monthFormatter.format(
                                            date)}",

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
                var cubit = PermissionCubit.get(context);
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orangeAccent.withOpacity(.5)),
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
                                fontWeight: FontWeight.bold, fontSize: 20),),
                            Text(
                                "${_dayFormatter.format(date)} ${_monthFormatter
                                    .format(date)}"),

                          ],
                        ),
                        Spacer(),
                        Icon(Icons.done_outline,color: Colors.green,),
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
                                    cubit.deletePermission(
                                      context,

                                      CacheHelper.getData(key: 'myId'),

                                      "${_dayFormatter.format(
                                          date)} ${_monthFormatter.format(
                                          date)}",

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
        ));
        else if (notAccept==1) dates.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<PermissionCubit, PermissionStates>(
              listener: (context, state) {


              },
              builder: (context, state) {
                var cubit = PermissionCubit.get(context);
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orangeAccent.withOpacity(.5)),
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
                                fontWeight: FontWeight.bold, fontSize: 20),),
                            Text(
                                "${_dayFormatter.format(date)} ${_monthFormatter
                                    .format(date)}"),

                          ],
                        ),
                        Spacer(),
                        Icon(Icons.cancel_outlined,color: Colors.red,),
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
                                    cubit.deletePermission(
                                      context,

                                      CacheHelper.getData(key: 'myId'),

                                      "${_dayFormatter.format(
                                          date)} ${_monthFormatter.format(
                                          date)}",

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
                      color: Colors.orangeAccent.withOpacity(.5)),
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
                                fontWeight: FontWeight.bold, fontSize: 20),),
                            Text(
                                "${_dayFormatter.format(date)} ${_monthFormatter
                                    .format(date)}"),

                          ],
                        ),
                        Spacer(),
                         defaultButton(onPress: () {
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

                                                    items: List.generate(
                                                        PermissionCubit
                                                            .get(context)
                                                            .depart
                                                            .length, (index) =>
                                                        DropdownMenuItem<
                                                            String>(child: Text(
                                                            PermissionCubit
                                                                .get(context)
                                                                .depart[index],
                                                            style: getBoldStyle(
                                                              color: ColorManager
                                                                  .primary,)),
                                                          value: PermissionCubit
                                                              .get(context)
                                                              .depart[index],))
                                                ),
                                          ),

                                        ),
                                        SizedBox(height: 20,),
                                        defaultEditText(
                                            label: 'السبب', maxLine: 3)

                                      ],


                                    )
                                ),
                                actions: state is PermissionLoadingState ? [
                                  CircularProgressIndicator()
                                ] : [
                                  TextButton(onPressed: () {
                                    Navigator.pop(context);
                                  },
                                      child: Text('Cancel',
                                        style: TextStyle(color: Colors.red),)),
                                  TextButton(onPressed: () {
                                    cubit.orderPermission(
                                        context,
                                        _nameFormatter.format(date),
                                        'test',
                                        CacheHelper.getData(key: 'myId'),
                                        CacheHelper.getData(key: 'myname'),
                                        "${_dayFormatter.format(date)} ${_monthFormatter.format(date)}",
                                        cubit.valueofdepart,'done','pending');
                                  }, child: Text('تاكيد')),

                                ],

                              ));
                        }, name: 'طلب', width: 80, height: 30),

                      ],
                    ),
                  ),
                );
              }

          ),
        ));

      }else {
        dates.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<PermissionCubit, PermissionStates>(
              listener: (context, state) {

              },
              builder: (context, state) {
                var cubit = PermissionCubit.get(context);
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orangeAccent.withOpacity(.5)),
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
                                fontWeight: FontWeight.bold, fontSize: 20),),
                            Text(
                                "${_dayFormatter.format(date)} ${_monthFormatter
                                    .format(date)}"),

                          ],
                        ),
                        Spacer(),
                         defaultButton(onPress: () {
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

                                                    items: List.generate(
                                                        PermissionCubit
                                                            .get(context)
                                                            .depart
                                                            .length, (index) =>
                                                        DropdownMenuItem<
                                                            String>(child: Text(
                                                            PermissionCubit
                                                                .get(context)
                                                                .depart[index],
                                                            style: getBoldStyle(
                                                              color: ColorManager
                                                                  .primary,)),
                                                          value: PermissionCubit
                                                              .get(context)
                                                              .depart[index],))
                                                ),
                                          ),

                                        ),
                                        SizedBox(height: 20,),
                                        defaultEditText(
                                            label: 'السبب', maxLine: 3)

                                      ],


                                    )
                                ),
                                actions: state is PermissionLoadingState ? [
                                  CircularProgressIndicator()
                                ] : [
                                  TextButton(onPressed: () {
                                    Navigator.pop(context);
                                  },
                                      child: Text('Cancel',
                                        style: TextStyle(color: Colors.red),)),
                                  TextButton(onPressed: () {
                                    cubit.orderPermission(
                                        context,
                                        _nameFormatter.format(date),
                                        'test',
                                        CacheHelper.getData(key: 'myId'),
                                        CacheHelper.getData(key: 'myname'),
                                        "${_dayFormatter.format(
                                            date)} ${_monthFormatter.format(
                                            date)}",
                                        cubit.valueofdepart,'done','pending'
                                    );
                                  }, child: Text('تاكيد')),

                                ],

                              ));
                        }, name: 'طلب', width: 80, height: 30),

                      ],
                    ),
                  ),
                );
              }

          ),
        ));
      }
    }

    return BlocConsumer<PermissionCubit,PermissionStates>(
      listener: (context,state){
        if(state is PermissionGetSuccessState ) setState(() {
          print('ok rebuild');

        });
      },
      builder:(context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text('Holiday'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: dates.map((widget) => Expanded(child: widget)).toList(),
            ),
          ),
        );
      } ,

    );
  }
}

