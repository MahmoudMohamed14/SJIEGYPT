import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/moduls/plan/cubit/cubit_plan.dart';

import '../plan/cubit/state_plan.dart';

class MonitorScreen extends StatelessWidget {

  const MonitorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlanCubit,PlanStates>(
      listener: (context,state){},
      builder: (context,state){

          var cubit=PlanCubit.get(context);

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
                itemBuilder: (context,index)=>designMonitor(
                    context: context,
                    index: index,
                    check1: cubit.listMonitorCode[index].check1,
                    check2:cubit.listMonitorCode[index].check2 ,
                  stime: cubit.listMonitorCode[index].startTime,
                  etime: cubit.listMonitorCode[index].endTime
                ),

                separatorBuilder: (context,index)=>SizedBox(height: 10,),
                itemCount: cubit.liststringcodeMonitor.length
            ),
          ),
        );

      },


    );
  }
  Widget designMonitor({context,index,check1,check2,stime,etime}){
    var cubit=PlanCubit.get(context);
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Column(

              children: [
                Text('Code'),
                Text(cubit.liststringcodeMonitor[index]),
              ],
            ),
          ),
          SizedBox(width: 50,),
          Expanded(
            child: Column(
              children: [
                Text('Line:   '),
                Text(cubit.liststringlineMonitor[index]),
              ],
            ),
          ),

          SizedBox(width: 50,),
          Expanded(
            child: Column(
              children: [
                Text('Status:  '),
         check1 && check2?const Text("Complete",style: TextStyle(color: Colors.green),):check1?const Text("Run",style: TextStyle(color: Colors.orange),):const Text("Not Start",),
              ],
            ),
          ),
          SizedBox(width: 50,),
          Expanded(

            child: Column(
              children: [
                Text('StartTime:   '),
                Text(stime),
              ],
            ),
          ),
          SizedBox(width: 50,),
          Expanded(
            child: Column(
              children: [
                Text('EndTime:   '),
                Text(etime),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
