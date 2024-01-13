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
        child:SingleChildScrollView(

          child:cubit.isPayORreview=='pay' ?state is LoadPaySlipStateSuccess? Center(child: CircularProgressIndicator()):cubit.paySlipModel==null ? Center(child: Text('NO PaySlip')):Column(
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
          ):state is LoadReviewStateSuccess? Center(child: CircularProgressIndicator()):cubit.reviewModel==null ? Center(child: Text('Not Uploaded')):Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.black,width: 1.5)

                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    // itemInTable(label: 'code',value: '${cubit.reviewModel!.code??""}'),
                    // itemInTable(label: 'name',value: '${cubit.reviewModel!.name??""}'),
                    itemInTable(label: '1 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_1??''}'),
                    itemInTable(label: '2 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_2??''}'),
                    itemInTable(label: '3 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_3??''}'),
                    itemInTable(label: '4 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_4??''}'),
                    itemInTable(label: '5 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_5??''}'),
                    itemInTable(label: '6 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_6??''}'),
                    itemInTable(label: '7 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_7??''}'),
                    itemInTable(label: '8 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_8??''}'),
                    itemInTable(label: '9 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_9??''}'),
                    itemInTable(label: '10 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_10??''}'),
                    itemInTable(label: '11 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_11??''}'),
                    itemInTable(label: '12 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_12??''}'),
                    itemInTable(label: '13 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_13??''}'),
                    itemInTable(label: '14 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_14??''}'),
                    itemInTable(label: '15 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_15??''}'),
                    itemInTable(label: '16 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_16??''}'),
                    itemInTable(label: '17 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_17??''}'),
                    itemInTable(label: '18 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_18??''}'),
                    itemInTable(label: '19 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_19??''}'),
                    itemInTable(label: '20 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_20??''}'),
                    itemInTable(label: '21 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_21??''}'),
                    itemInTable(label: '22 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_22??''}'),
                    itemInTable(label: '23 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_23??''}'),
                    itemInTable(label: '24 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_24??''}'),
                    itemInTable(label: '25 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_25??''}'),
                    itemInTable(label: '26 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_26??''}'),
                    itemInTable(label: '27 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_27??''}'),
                    itemInTable(label: '28 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_28??''}'),
                    itemInTable(label: '29 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_29??''}'),
                    itemInTable(label: '30 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_30??''}'),
                    itemInTable(label: '31 ${cubit.reviewModel!.month??''}',value: '${cubit.reviewModel!.month_31??''}'),
                  ],
                ),
              ),
              // SizedBox(height: 20,),
              // Container(
              //   decoration: BoxDecoration(
              //       border: Border.all(color:Colors.black,width: 1.5)
              //
              //   ),
              //   child: Column(
              //     // mainAxisSize: MainAxisSize.min,
              //     children: [
              //       itemInTable(label: 'Basic اساسي',value: '${cubit.paySlipModel!.basic}'),
              //       // itemInTable(label: 'Variable ',value: '${cubit.paySlipModel!.Variable}'),
              //       // itemInTable(label: 'Clothing Allow',value: '${cubit.paySlipModel!.Clothing_Allow}'),
              //       itemInTable(label: 'Meal Allow وجبة',value: '${cubit.paySlipModel!.Meal_Allow}'),
              //       itemInTable(label: ' Transportation بدل مواصلات',value: '${cubit.paySlipModel!.Transportation}'),
              //       itemInTable(label: 'Productivity انتاجيه',value: '${cubit.paySlipModel!.Productivity_Allow}'),
              //       itemInTable(label: 'Att Bonus ح.انتظام',value: '${cubit.paySlipModel!.Att_Bonus}'),
              //       itemInTable(label: 'Activity Allow',value: '${cubit.paySlipModel!.Activity_Allow}'),
              //       itemInTable(label: 'Bonus',value: '${cubit.paySlipModel!.Bonus}'),
              //       itemInTable(label: 'Overtime الاضافي',value: '${cubit.paySlipModel!.Overtime}'),
              //       itemInTable(label: 'Vacation Balance',value: '${cubit.paySlipModel!.Vacation_Balance}'),
              //       itemInTable(label: ' Other Dues استحقاقات اخري',value: '${cubit.paySlipModel!.Other_Dues}'),
              //       itemInTable(label: 'Total Dues',value: '${cubit.paySlipModel?.Total_Dues}'),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 20,),
              // Container(
              //   decoration: BoxDecoration(
              //       border: Border.all(color:Colors.black,width: 1.5)
              //
              //   ),
              //   child: Column(
              //     // mainAxisSize: MainAxisSize.min,
              //     children: [
              //       itemInTable(label: 'EmpSocial Ins تأمينات',value: '${cubit.paySlipModel!.EmpSocial_Ins}'),
              //       itemInTable(label: 'Tax ضرايب',value: '${cubit.paySlipModel!.Tax}'),
              //       itemInTable(label: 'Absent غياب',value: '${cubit.paySlipModel?.Absent}'),
              //       itemInTable(label: 'Penalty جزاءات',value: '${cubit.paySlipModel!.Penalty}'),
              //       itemInTable(label: 'Sick',value: '${cubit.paySlipModel!.Sick}'),
              //       itemInTable(label: 'WI',value: '${cubit.paySlipModel!.WI}'),
              //       itemInTable(label: 'Bonus Deduction خصم من الحافز',value: '${cubit.paySlipModel?.Bonus_Deduction}'),
              //       itemInTable(label: 'Other Deduction خصومات اخري',value: '${cubit.paySlipModel?.Other_Deduction}'),
              //       itemInTable(label: 'total Deduction',value: '${cubit.paySlipModel!.total_Deduction}'),
              //
              //     ],
              //   ),
              // ),


            ],
          ),
        ),
      );
        }
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
