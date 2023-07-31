import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/constant/color_manager.dart';

import 'attendCubit/cubitAttend.dart';
import 'attendCubit/statusAttend.dart';

class  PaySlipScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendCubit,AttendStates>(
        listener: (context,state){},

        builder: (context,state){
          var cubit=  AttendCubit.get(context);
      return Padding(

        padding: const EdgeInsets.all(20),
        child:cubit.paySlipModel==null? Center(child: Text('NO PaySlip')) :SingleChildScrollView(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.black,width: 1.5)

                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    itemInTable(label: 'Net Salary',value: '${cubit.paySlipModel?.net_salary}',colorRow: ColorManager.lightPrimary,colorText: Colors.white),
                    itemInTable(label: 'Total Dues',value: '${cubit.paySlipModel?.Total_Dues}'),
                    itemInTable(label: 'total Deduction',value: '${cubit.paySlipModel!.total_Deduction}'),
                    itemInTable(label: 'Job Position',value: '${cubit.paySlipModel!.job_position}'),
                    itemInTable(label: 'اعتيادي',value: '${cubit.paySlipModel!.regular}'),
                    itemInTable(label: 'عارضة',value: '${cubit.paySlipModel?.casual}'),
                    itemInTable(label: ' الغياب',value: '${cubit.paySlipModel?.day_absent}'),
                    itemInTable(label: 'ايام الشغل ',value: '${cubit.paySlipModel?.day_Work}'),



                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.black,width: 1.5)

                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    itemInTable(label: 'Basic اساسي',value: '${cubit.paySlipModel!.basic}'),
                   // itemInTable(label: 'Variable ',value: '${cubit.paySlipModel!.Variable}'),
                   // itemInTable(label: 'Clothing Allow',value: '${cubit.paySlipModel!.Clothing_Allow}'),
                    itemInTable(label: 'Meal Allow وجبة',value: '${cubit.paySlipModel!.Meal_Allow}'),
                    itemInTable(label: ' Transportation بدل مواصلات',value: '${cubit.paySlipModel!.Transportation}'),
                    itemInTable(label: 'Productivity انتاجيه',value: '${cubit.paySlipModel!.Productivity_Allow}'),
                    itemInTable(label: 'Att Bonus ح.انتظام',value: '${cubit.paySlipModel!.Att_Bonus}'),
                    itemInTable(label: 'Activity Allow',value: '${cubit.paySlipModel!.Activity_Allow}'),
                    itemInTable(label: 'Bonus',value: '${cubit.paySlipModel!.Bonus}'),
                    itemInTable(label: 'Overtime الاضافي',value: '${cubit.paySlipModel!.Overtime}'),
                    itemInTable(label: 'Vacation Balance',value: '${cubit.paySlipModel!.Vacation_Balance}'),
                    itemInTable(label: ' Other Dues استحقاقات اخري',value: '${cubit.paySlipModel!.Other_Dues}'),
                    itemInTable(label: 'Total Dues',value: '${cubit.paySlipModel?.Total_Dues}'),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.black,width: 1.5)

                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    itemInTable(label: 'EmpSocial Ins تأمينات',value: '${cubit.paySlipModel!.EmpSocial_Ins}'),
                    itemInTable(label: 'Tax ضرايب',value: '${cubit.paySlipModel!.Tax}'),
                    itemInTable(label: 'Absent غياب',value: '${cubit.paySlipModel?.Absent}'),
                    itemInTable(label: 'Penalty جزاءات',value: '${cubit.paySlipModel!.Penalty}'),
                    itemInTable(label: 'Sick',value: '${cubit.paySlipModel!.Sick}'),
                    itemInTable(label: 'WI',value: '${cubit.paySlipModel!.WI}'),
                    itemInTable(label: 'Bonus Deduction خصم من الحافز',value: '${cubit.paySlipModel?.Bonus_Deduction}'),
                    itemInTable(label: 'Other Deduction خصومات اخري',value: '${cubit.paySlipModel?.Other_Deduction}'),
                    itemInTable(label: 'total Deduction',value: '${cubit.paySlipModel!.total_Deduction}'),

                  ],
                ),
              ),


            ],
          ),
        ),
      );}
    );
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
            ],
          ),
          SizedBox(height: 10,),
          Container(width: double.infinity,height: 2,color: Colors.black,),

        ],
      ),
    );
  }
}
