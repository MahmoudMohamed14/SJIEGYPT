import 'package:flutter/material.dart';
import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/shared/constant/color_manager.dart';

class PaySlipScreen extends StatelessWidget {

 // const PaySlipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
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
                itemInTable(label: 'Net Salary',value: '${AttendCubit.get(context).paySlipModel?.net_salary}',colorRow: ColorManager.lightPrimary,colorText: Colors.white),
                itemInTable(label: 'Total Dues',value: '${AttendCubit.get(context).paySlipModel?.Total_Dues}'),
                itemInTable(label: 'total Deduction',value: '${AttendCubit.get(context).paySlipModel!.total_Deduction}'),
                itemInTable(label: 'Job Position',value: '${AttendCubit.get(context).paySlipModel!.job_position}'),
                itemInTable(label: 'اعتيادي',value: '${AttendCubit.get(context).paySlipModel!.regular}'),
                itemInTable(label: 'عارضة',value: '${AttendCubit.get(context).paySlipModel?.casual}'),
                itemInTable(label: ' الغياب',value: '${AttendCubit.get(context).paySlipModel?.day_absent}'),
                itemInTable(label: 'ايام الشغل ',value: '${AttendCubit.get(context).paySlipModel?.day_Work}'),



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
                itemInTable(label: 'Basic اساسي',value: '${AttendCubit.get(context).paySlipModel!.basic}'),
                // itemInTable(label: 'Variable ',value: '${AttendCubit.get(context).paySlipModel!.Variable}'),
                // itemInTable(label: 'Clothing Allow',value: '${AttendCubit.get(context).paySlipModel!.Clothing_Allow}'),
                itemInTable(label: 'Meal Allow وجبة',value: '${AttendCubit.get(context).paySlipModel!.Meal_Allow}'),
                itemInTable(label: ' Transportation بدل مواصلات',value: '${AttendCubit.get(context).paySlipModel!.Transportation}'),
                itemInTable(label: 'Productivity انتاجيه',value: '${AttendCubit.get(context).paySlipModel!.Productivity_Allow}'),
                itemInTable(label: 'Att Bonus ح.انتظام',value: '${AttendCubit.get(context).paySlipModel!.Att_Bonus}'),
                itemInTable(label: 'Activity Allow',value: '${AttendCubit.get(context).paySlipModel!.Activity_Allow}'),
                itemInTable(label: 'Bonus',value: '${AttendCubit.get(context).paySlipModel!.Bonus}'),
                itemInTable(label: 'Overtime الاضافي',value: '${AttendCubit.get(context).paySlipModel!.Overtime}'),
                itemInTable(label: 'Vacation Balance',value: '${AttendCubit.get(context).paySlipModel!.Vacation_Balance}'),
                itemInTable(label: ' Other Dues استحقاقات اخري',value: '${AttendCubit.get(context).paySlipModel!.Other_Dues}'),
                itemInTable(label: 'Total Dues',value: '${AttendCubit.get(context).paySlipModel?.Total_Dues}'),
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
                itemInTable(label: 'EmpSocial Ins تأمينات',value: '${AttendCubit.get(context).paySlipModel!.EmpSocial_Ins}'),
                itemInTable(label: 'Tax ضرايب',value: '${AttendCubit.get(context).paySlipModel!.Tax}'),
                itemInTable(label: 'Absent غياب',value: '${AttendCubit.get(context).paySlipModel?.Absent}'),
                itemInTable(label: 'Penalty جزاءات',value: '${AttendCubit.get(context).paySlipModel!.Penalty}'),
                itemInTable(label: 'Sick',value: '${AttendCubit.get(context).paySlipModel!.Sick}'),
                itemInTable(label: 'WI',value: '${AttendCubit.get(context).paySlipModel!.WI}'),
                itemInTable(label: 'Bonus Deduction خصم من الحافز',value: '${AttendCubit.get(context).paySlipModel?.Bonus_Deduction}'),
                itemInTable(label: 'Other Deduction خصومات اخري',value: '${AttendCubit.get(context).paySlipModel?.Other_Deduction}'),
                itemInTable(label: 'total Deduction',value: '${AttendCubit.get(context).paySlipModel!.total_Deduction}'),

              ],
            ),
          ),


        ],
      ),
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
