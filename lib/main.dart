

import 'package:bloc/bloc.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';

import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';

import 'package:untitled/moduls/homeLayout/homeLayout.dart';
import 'package:untitled/moduls/login/login_screen.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';

import 'package:untitled/shared/constant/theme_manager.dart';


import 'bloc_observer.dart';



void main()async  {


  WidgetsFlutterBinding.ensureInitialized();

 // FirebaseAuth.initialize(apiKey, VolatileStore());
  Firestore.initialize(projectId);
  await CacheHelper.init();



  Bloc.observer = MyBlocObserver();
      runApp(MyApp(),);

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(
      providers: [
       // CacheHelper.getData(key: 'isAtt')==null? BlocProvider<AddPomCubit>(create: (context)=>AddPomCubit()..getPom()..getUsers()..getcode()..getBox()..getAttendanceUser()):BlocProvider<AddPomCubit>(create: (context)=>AddPomCubit()..getAttendanceUser()..getUsers()),
      //  BlocProvider<AddPomCubit>(create: (context)=>AddPomCubit()..getAttendanceUser()),
      //  BlocProvider<PlanCubit>(create: (context)=>PlanCubit()),
        BlocProvider<AttendCubit>(create: (context)=>AttendCubit()),
      CacheHelper.getData(key: 'isLogin')!=null? BlocProvider<PermissionCubit>(create: (context)=>PermissionCubit()..getOrderPermission()):BlocProvider<PermissionCubit>(create: (context)=>PermissionCubit()),
      ],


      child: BlocListener<AttendCubit,AttendStates>(

        listener: (context,state){

      CacheHelper.getData(key: 'isLogin')!=null? PermissionCubit.get(context).getEmit():PermissionCubit.get(context).getEmit();





        },


          child:  LayoutBuilder(
            builder: (context,contrain){


              print(contrain.maxWidth.toString() + contrain.maxHeight.toString() );

              return MaterialApp(


             // title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: getApplicationTheme(context),

              home:  launcherScreen(loginScreen: LoginScreen(),homeScreen:HomeLayout (),iscurrentuser: CacheHelper.getData(key: "isLogin")??false ),//const MyHomePage(title: 'Flutter Demo Home Page'),
            );
              },

          )


      ),
    );
  }
}

