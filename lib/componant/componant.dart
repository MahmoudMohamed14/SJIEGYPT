

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/moduls/hiring/dashBoardScreen.dart';

import 'package:untitled/moduls/hiring/safetyScrean.dart';
import 'package:untitled/moduls/login/login_screen.dart';
import '../model/payroll.dart';

import '../shared/constant/color_manager.dart';
import '../shared/constant/test_styles_manager.dart';

String apikey='AIzaSyBUv5SPo412q980FOIc-i-HxJdl4jVYCi0';
String projectId="seongjiproject-d3742";
List months = ['jan', 'feb', 'mar', 'apr', 'may','jun','jul','aug','sep','oct','nov','dec'];

List<PaySlipModel> listOfPaySlipGl=[];
List<Map<String,dynamic>> listOfAttenduserGl=[];


Widget defaultButton(
    {
      required Function onPress,
      required String name,
      double width=double.infinity,
      double height=50,
      Color color = const Color(0xff002d61)





    }
    )=>Container(
  decoration:BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: color



  ) ,


  height: height,
  width:width ,
  child: MaterialButton(


    onPressed: () {
      onPress();

    },
    child: Text(
      name.toUpperCase(),
      style: getBoldStyle(color: ColorManager.white),
    ),),
);
Widget defaultEditText(
    {
      bool isSuffix=false,
      String? textDirection='',
      TextEditingController?   control,
      required String label,
      IconData? prefIcon,
      Function ?onPressSuffix,
      Function()?onPress,
      Function(String s)?onsubmitted,
      Function(String s)?onchange,
      IconData? sufIcon,
      int ?maxLine=1,

      FormFieldValidator? validat,
      bool enable=false,
      bool enableText=true,
      TextInputType ?textType,
      int?maxlength
    }
    )
{

  return TextFormField(
maxLength:maxlength ,
      textDirection: textDirection!.isEmpty ?TextDirection.ltr:TextDirection.rtl,

      validator: validat,
      obscureText: enable,
      controller: control,
      keyboardType:textType ,
      autocorrect: false,
      cursorColor: ColorManager.primary,
      decoration:InputDecoration(

          errorStyle: TextStyle(color: Colors.red),

          enabledBorder: OutlineInputBorder(


              borderSide: BorderSide(color: ColorManager.primary),

              borderRadius:BorderRadius.circular(10)),
          focusedBorder:OutlineInputBorder(


              borderSide: BorderSide(color: ColorManager.primary),

              borderRadius:BorderRadius.circular(10)) ,

          errorBorder:OutlineInputBorder(


              borderSide: BorderSide(color: Colors.red),

              borderRadius:BorderRadius.circular(10)) ,
          focusedErrorBorder: OutlineInputBorder(


              borderSide: BorderSide(color: Colors.red),

              borderRadius:BorderRadius.circular(10)),

          labelStyle: TextStyle(color: ColorManager.primary),
          labelText: label,
          prefixIcon: Icon(prefIcon,color: ColorManager.primary,),

          suffixIcon: isSuffix?IconButton(onPressed:(){

            if(onPressSuffix!=null){
              onPressSuffix();
            }
          },icon: Icon(sufIcon,),):null


      ) ,
      onTap: (){

        if(onPress!=null){
          onPress();
        }

      },
      onChanged: ( s){
        if(onchange!=null){
          onchange(s);
        }
      },
     onFieldSubmitted: (s){
       if(onsubmitted!=null){
         onsubmitted(s);
       }
     },
      enabled: enableText,
      maxLines:maxLine

  );

}
Widget defaultTextButton({
  required Function onPress,
  required String name,})=> TextButton(child: Text(name.toUpperCase(),style: getBoldStyle(color: ColorManager.primary),),onPressed: (){onPress();},);
void navigateTo(context,widget ){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}
void navigateAndFinish(context,widget ){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>widget),(route)=>false);
}
enum ToastState{SUCCESS,ERROR,WARNING}
void showToast({ required String text,required ToastState state}){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: toastColor(state: state),
      textColor: Colors.white,
      fontSize: 16.0
  );


}
Color toastColor({
  required ToastState state
}){
  late Color color;
  switch(state){
    case ToastState.SUCCESS:
      color= Colors.green;
      break;
    case ToastState.ERROR:
      color= Colors.red;
      break;
    case ToastState.WARNING:
      color= Colors.yellow;
      break;

  }
  return color;
}

void signOut( context) {


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
  CacheHelper.removeWithKey(key: 'controller');
  CacheHelper.removeWithKey(key: 'location');
  CacheHelper.removeWithKey(key: 'token');

  navigateAndFinish(context, LoginScreen());



}
Widget launcherScreen({bool? iscurrentuser,required Widget loginScreen ,required Widget homeScreen }){
  Widget launch=loginScreen;
  if(iscurrentuser!){
  if(CacheHelper.getData(key: 'depart')!=null)  {

        if (CacheHelper.getData(key: 'depart')!='ehiring')
          launch = homeScreen;
        else
          launch =  CacheHelper.getData(key: 'controller')=='safety'?SafetyScreen():DashBoardScreen();


    }else {
  // CacheHelper.getData(key: 'myId')=='sji'? launch = UserAttendScreen():launch = AttendScreen();
    launch = homeScreen;
  }
  }else {
    launch=loginScreen;
  }
  return launch;
}