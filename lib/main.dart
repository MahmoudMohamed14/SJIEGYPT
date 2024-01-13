import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/componant/remote/dioHelper.dart';
import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';
import 'package:untitled/moduls/hiring/process_hiring.dart';
import 'package:untitled/moduls/homeLayout/homeLayout.dart';
import 'package:untitled/moduls/login/login_screen.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';
import 'package:untitled/shared/constant/theme_manager.dart';
import 'package:upgrader/upgrader.dart';
import 'bloc_observer.dart';



void main()async  {

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Upgrader.clearSavedSettings();
 // FirebaseAuth.initialize(apiKey, VolatileStore());
  DioHelper.init();
  await CacheHelper.init();
  //getHttp();

   //if (Platform.isWindows){}
  //
  //   //Firestore.initialize(projectId);
  //   // await Firebase.initializeApp(
  //   //
  //   //
  //   //     options: FirebaseOptions(
  //   //       apiKey: "AIzaSyCH1ep_lNnDmSE0SJ8_WUOLD3IWMuF69I4",
  //   //       appId: '1:699991408348:android:77ea5bf9029055992a7e19',
  //   //       messagingSenderId: "699991408348",
  //   //       projectId: "seongjiproject-d3742",
  //   //     )
  //   // );
  // }else{
  //   // await Firebase.initializeApp(
  //   //
  //   //
  //   //     options: FirebaseOptions(
  //   //       apiKey: "AIzaSyCH1ep_lNnDmSE0SJ8_WUOLD3IWMuF69I4",
  //   //       appId: '1:699991408348:android:77ea5bf9029055992a7e19',
  //   //       messagingSenderId: "699991408348",
  //   //       projectId: "seongjiproject-d3742",
  //   //     )
  //   // );
  // }



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
        BlocProvider<AttendCubit>(create: (context)=>AttendCubit()..changeHomeButton(1, context)..loginSql(CacheHelper.getData(key: 'myId')??'', CacheHelper.getData(key: 'password')??'',notLogin: true)),
        BlocProvider<PermissionCubit>(create: (context)=>PermissionCubit()),
        BlocProvider<HiringCubit>(create: (context)=>HiringCubit()..getAllHiring())
     // CacheHelper.getData(key: 'isLogin')!=null? BlocProvider<PermissionCubit>(create: (context)=>PermissionCubit()..getOrderPermission()):BlocProvider<PermissionCubit>(create: (context)=>PermissionCubit()),
      ],



      child: BlocListener<AttendCubit,AttendStates>(

        listener: (context,state){
    //       if(  CacheHelper.getData(key: 'control')!=null){
    //         if(CacheHelper.getData(key: 'control')) AttendCubit.get(context).getDepart();
    //       }
    //
    // PermissionCubit.get(context).getEmit();
   },


          child:  LayoutBuilder(
            builder: (context,contrain){




              print(contrain.maxWidth.toString() + contrain.maxHeight.toString() );

              return MaterialApp(


             // title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: getApplicationTheme(context),
              home:  UpgradeAlert(
                upgrader:  Upgrader(
                 showIgnore: false,
                    showLater:  false,
                    dialogStyle: UpgradeDialogStyle.material),
                  child:launcherScreen(loginScreen: LoginScreen(),homeScreen:HomeLayout (),iscurrentuser: CacheHelper.getData(key: "isLogin")??false )),//ProcessHiring()),
            );
              },

          )


      ),
    );
  }
}

