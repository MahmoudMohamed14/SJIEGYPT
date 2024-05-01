











import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/componant/remote/dioHelper.dart';
import 'package:untitled/componant/remote/notification.dart';
import 'package:untitled/firebase_options.dart';
import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';
import 'package:untitled/moduls/homeLayout/homeLayout.dart';
import 'package:untitled/moduls/login/login_screen.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';

import 'package:untitled/shared/constant/theme_manager.dart';
import 'package:upgrader/upgrader.dart';
import 'bloc_observer.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  if(! Platform.isWindows) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 0,
            icon: '@drawable/sjilogo',
            channelKey: 'basic_channel',
            title: notification.title,
            body: notification.body,

          )
      );
    }
  }


}

void main()async  {

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Upgrader.clearSavedSettings();

  DioHelper.init();

  await CacheHelper.init();
  if(! Platform.isWindows) {
    NotificationHelper.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // FirebaseAuth.initialize(apiKey, VolatileStore());
    AwesomeNotifications().initialize(
         'resource://drawable/sjilogo',
        [
          NotificationChannel(
            // channelGroupKey: 'basic_channel_group',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
             // icon: '@drawable/sjilogo',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: Color(0xFF9D50DD),
              playSound: true,
              enableLights: true,
              importance: NotificationImportance.High,


              enableVibration: true,
              ledColor: Colors.white)
        ],
        // Channel groups are only visual and are not required
        // channelGroups: [
        //   NotificationChannelGroup(
        //       channelGroupKey: 'basic_channel_group',
        //       channelGroupName: 'Basic group')
        // ],
        debug: true
    );
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          AwesomeNotifications().createNotification(

              content: NotificationContent(
                id: 0,
                icon: '@drawable/sjilogo',
                channelKey: 'basic_channel',
                title: notification.title,
                body: notification.body,

              )
          );
        }
      }
    });
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,

      // Required to display a heads up notification
      badge: true,
      sound: true,

    );


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;


      AndroidNotification? android = message.notification?.android;
      print(notification!.title.toString());
      AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 0,

            notificationLayout: NotificationLayout.BigPicture,
            bigPicture: 'asset://assets/sji',

           // icon: 'assets/sji.png',
            channelKey: 'basic_channel',
            title: notification.title,
            body: notification.body,

          )
      );
    

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.

    });
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }



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
        BlocProvider<AttendCubit>(
            create: (context)=>AttendCubit()..changeHomeButton(1, context)..loginSql(CacheHelper.getData(key: 'myId')??'', CacheHelper.getData(key: 'password')??'',notLogin: true),
         // lazy: false,

        ),

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


          child: MaterialApp(


            // title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: getApplicationTheme(context),
            home:  UpgradeAlert(
                showIgnore: false,
                showLater:  false,

                showReleaseNotes: true,

                dialogStyle: UpgradeDialogStyle.material,
                upgrader:  Upgrader(),
                child:launcherScreen(loginScreen: LoginScreen(),homeScreen:HomeLayout (),iscurrentuser: CacheHelper.getData(key: "isLogin")??false )),//ProcessHiring()),
          )


      ),
    );
  }
}

