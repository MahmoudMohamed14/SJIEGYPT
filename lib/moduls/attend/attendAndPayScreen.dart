import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/moduls/attend/payslipscreen.dart';

import '../../shared/constant/color_manager.dart';
import 'attendCubit/cubitAttend.dart';
import 'attendCubit/statusAttend.dart';


class AttendAndPayScreen extends StatelessWidget {
  late String month;
   AttendAndPayScreen ({Key? key,required this. month}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendCubit,AttendStates>(
        listener: (context,state){},

        builder: (context,state){
          var cubit=  AttendCubit.get(context);
      return Scaffold(
        appBar: AppBar(


          title:  Column(
            children: [
         Text('${CacheHelper.getData(key: 'myname')}',
                  style: TextStyle(color:ColorManager.primary,
                    fontSize: 20.0,)
              ),
               Text('${CacheHelper.getData(key: 'myId')}',
                  style: TextStyle(color:ColorManager.primary,
                    fontSize: 20.0,)
              )
            ],
          ),
          // actions:CacheHelper.getData(key: 'myId')=='sji'?null:[
          //
          //
          //
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 10),
          //     child: IconButton(onPressed: (){
          //       CacheHelper.removeWithKey(key: 'isLogin');
          //       CacheHelper.removeWithKey(key: 'myId');
          //       CacheHelper.removeWithKey(key: 'isAtt');
          //       // CacheHelper.removeWithKey(key: 'isAdmin');
          //       navigateAndFinish(context, LoginScreen());
          //       //  cubit.pickFileAttend();
          //     }, icon: Icon(Icons.login_outlined)),
          //   ),
          //
          // ],
        ),
        body:PaySlipScreen(month) //cubit.listBody[0],
          // bottomNavigationBar:
          // BottomNavigationBar(items:[
          //   BottomNavigationBarItem(icon:Icon(IconBroken.User,),label: 'Attendance'),
          //   BottomNavigationBarItem(icon: Icon(IconBroken.Wallet,),label: 'PaySlip'),
          // ],onTap: (index){
          //   if(index==1)cubit.getPaySlip();
          //   cubit.changeBottomNav(index: index);
          // },currentIndex: cubit.indexBotten,),
      );
        }
    );
  }

}
