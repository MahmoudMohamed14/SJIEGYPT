import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/home.dart';
import 'package:untitled/moduls/login/login_screen.dart';
import 'package:untitled/moduls/monitor/monitor_screen.dart';
import 'package:untitled/moduls/plan/cubit/cubit_plan.dart';
import 'package:untitled/moduls/plan/cubit/state_plan.dart';
import 'package:untitled/shared/constant/color_manager.dart';
import 'package:untitled/shared/constant/test_styles_manager.dart';

class GetPlan extends StatelessWidget {

  TextEditingController date=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlanCubit,PlanStates>(

      listener: (context,state){
      if( state is GetSuccessPlan ){
        PlanCubit.get(context).getlistofLine();
        navigateTo(context, AddKitting(date: date.text,shift: PlanCubit.get(context).shift,));
        PlanCubit.get(context).radioButtonLine(linev: " ");

      }else if(state is GetKittingComponentListSuccess ){
        navigateTo(context, MonitorScreen());

      }
      },
      builder: (context,state){
        var cubit=  PlanCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            actions: [
            CacheHelper.getData(key: 'isAdmin')? SizedBox(): IconButton(onPressed: (){
              CacheHelper.removeWithKey(key: 'isLogin');
              CacheHelper.removeWithKey(key: 'line');
              CacheHelper.removeWithKey(key: 'isAdmin');
              navigateAndFinish(context, LoginScreen());

            }, icon: Icon(Icons.login_outlined),)],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  defaultEditText(control: date, label: "Date", validat:( validat){},onPress: (){
                    showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                  DateTime.now() , lastDate: CacheHelper.getData(key: 'isAdmin')? DateTime.parse('2023-12-31'): DateTime.now())
                        .then((value){
                      date.text=DateFormat.yMMMd().format(value!);

                      cubit.emitPlan();


                    }).catchError((error){
                      print('date error'+error.toString());
                    });
                  }),
                  const SizedBox(height: 20,),

                  //line
                  Container(
                    padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorManager.primary)

                    ),
                    child: DropdownButton(

                        isExpanded: true,
                        iconSize: 40,


                        value: cubit.shift,


                        onChanged: ( String?value){

                          cubit.radioButtonShift(sht: value);


                        },

                        items:List.generate(cubit.shiftList.length, (index) =>   DropdownMenuItem<String>(child: Text(cubit.shiftList[index],style: getBoldStyle(color: ColorManager.primary,)),value: cubit.shiftList[index],))
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text("Get Data"),
                        onPressed:(){
                      CacheHelper.getData(key: 'isAdmin') ? cubit.getMonitorCode(date: date.text,shift: cubit.shift):  cubit.getplan(date: date.text,shift: cubit.shift);


                        },
                      ),


                    ],
                  ),


                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
