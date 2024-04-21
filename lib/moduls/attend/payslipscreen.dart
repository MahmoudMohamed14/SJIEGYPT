import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/shared/constant/color_manager.dart';



class  PaySlipScreen extends StatelessWidget {
late String month;

PaySlipScreen(this.month);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: AttendCubit.get(context).isPayORreview=='pay'?AttendCubit.get(context).getPaySlip(month):AttendCubit.get(context).getReview(month),
      builder: (context,snabshat){
        if(snabshat.hasData){
          print(snabshat.data);
          return SingleChildScrollView(

            child:AttendCubit.get(context).isPayORreview=='pay' ?AttendCubit.get(context).paySlipModel==null ? Center(child: Text('NO PaySlip')):Padding(
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
            ):AttendCubit.get(context).reviewModel==null ? Center(child: Text('Not Uploaded')):Padding(
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
                        // itemInTable(label: 'code',value: '${AttendCubit.get(context).reviewModel!.code??""}'),
                        // itemInTable(label: 'name',value: '${AttendCubit.get(context).reviewModel!.name??""}'),
                        itemInTable(label: '1 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_1??''}'),
                        itemInTable(label: '2 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_2??''}'),
                        itemInTable(label: '3 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_3??''}'),
                        itemInTable(label: '4 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_4??''}'),
                        itemInTable(label: '5 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_5??''}'),
                        itemInTable(label: '6 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_6??''}'),
                        itemInTable(label: '7 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_7??''}'),
                        itemInTable(label: '8 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_8??''}'),
                        itemInTable(label: '9 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_9??''}'),
                        itemInTable(label: '10 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_10??''}'),
                        itemInTable(label: '11 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_11??''}'),
                        itemInTable(label: '12 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_12??''}'),
                        itemInTable(label: '13 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_13??''}'),
                        itemInTable(label: '14 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_14??''}'),
                        itemInTable(label: '15 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_15??''}'),
                        itemInTable(label: '16 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_16??''}'),
                        itemInTable(label: '17 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_17??''}'),
                        itemInTable(label: '18 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_18??''}'),
                        itemInTable(label: '19 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_19??''}'),
                        itemInTable(label: '20 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_20??''}'),
                        itemInTable(label: '21 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_21??''}'),
                        itemInTable(label: '22 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_22??''}'),
                        itemInTable(label: '23 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_23??''}'),
                        itemInTable(label: '24 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_24??''}'),
                        itemInTable(label: '25 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_25??''}'),
                        itemInTable(label: '26 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_26??''}'),
                        itemInTable(label: '27 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_27??''}'),
                        itemInTable(label: '28 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_28??''}'),
                        itemInTable(label: '29 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_29??''}'),
                        itemInTable(label: '30 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_30??''}'),
                        itemInTable(label: '31 ${AttendCubit.get(context).reviewModel!.month??''}',value: '${AttendCubit.get(context).reviewModel!.month_31??''}'),
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
                  //       itemInTable(label: 'Basic اساسي',value: '${AttendCubit.get(context).paySlipModel!.basic}'),
                  //       // itemInTable(label: 'Variable ',value: '${AttendCubit.get(context).paySlipModel!.Variable}'),
                  //       // itemInTable(label: 'Clothing Allow',value: '${AttendCubit.get(context).paySlipModel!.Clothing_Allow}'),
                  //       itemInTable(label: 'Meal Allow وجبة',value: '${AttendCubit.get(context).paySlipModel!.Meal_Allow}'),
                  //       itemInTable(label: ' Transportation بدل مواصلات',value: '${AttendCubit.get(context).paySlipModel!.Transportation}'),
                  //       itemInTable(label: 'Productivity انتاجيه',value: '${AttendCubit.get(context).paySlipModel!.Productivity_Allow}'),
                  //       itemInTable(label: 'Att Bonus ح.انتظام',value: '${AttendCubit.get(context).paySlipModel!.Att_Bonus}'),
                  //       itemInTable(label: 'Activity Allow',value: '${AttendCubit.get(context).paySlipModel!.Activity_Allow}'),
                  //       itemInTable(label: 'Bonus',value: '${AttendCubit.get(context).paySlipModel!.Bonus}'),
                  //       itemInTable(label: 'Overtime الاضافي',value: '${AttendCubit.get(context).paySlipModel!.Overtime}'),
                  //       itemInTable(label: 'Vacation Balance',value: '${AttendCubit.get(context).paySlipModel!.Vacation_Balance}'),
                  //       itemInTable(label: ' Other Dues استحقاقات اخري',value: '${AttendCubit.get(context).paySlipModel!.Other_Dues}'),
                  //       itemInTable(label: 'Total Dues',value: '${AttendCubit.get(context).paySlipModel?.Total_Dues}'),
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
                  //       itemInTable(label: 'EmpSocial Ins تأمينات',value: '${AttendCubit.get(context).paySlipModel!.EmpSocial_Ins}'),
                  //       itemInTable(label: 'Tax ضرايب',value: '${AttendCubit.get(context).paySlipModel!.Tax}'),
                  //       itemInTable(label: 'Absent غياب',value: '${AttendCubit.get(context).paySlipModel?.Absent}'),
                  //       itemInTable(label: 'Penalty جزاءات',value: '${AttendCubit.get(context).paySlipModel!.Penalty}'),
                  //       itemInTable(label: 'Sick',value: '${AttendCubit.get(context).paySlipModel!.Sick}'),
                  //       itemInTable(label: 'WI',value: '${AttendCubit.get(context).paySlipModel!.WI}'),
                  //       itemInTable(label: 'Bonus Deduction خصم من الحافز',value: '${AttendCubit.get(context).paySlipModel?.Bonus_Deduction}'),
                  //       itemInTable(label: 'Other Deduction خصومات اخري',value: '${AttendCubit.get(context).paySlipModel?.Other_Deduction}'),
                  //       itemInTable(label: 'total Deduction',value: '${AttendCubit.get(context).paySlipModel!.total_Deduction}'),
                  //
                  //     ],
                  //   ),
                  // ),


                ],
              ),
            ),
          );
        }else{
          print(snabshat.error.toString());
          return Center(child: CircularProgressIndicator(),);
        }
      },

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
