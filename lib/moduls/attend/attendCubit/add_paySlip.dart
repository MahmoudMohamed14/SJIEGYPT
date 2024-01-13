
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';


import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';
import 'package:untitled/shared/constant/color_manager.dart';


class  UploadPaySlipScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    TextEditingController? locatControl=new TextEditingController();
    var keyForm=GlobalKey<FormState>();

    return Builder(
        builder: (context) {

          return BlocConsumer<AttendCubit,AttendStates>(
            listener: (context,state){
              if(state  is AddPaySlipLoadState){
                showDialog(


                    barrierDismissible: false,
                    context: context, builder: (context) =>
                    AlertDialog(

                      title: Text(' تحميل الرواتب'),
                      content:Text("Upload ${AttendCubit.get(context).valuepross}...",
                        //locale: Locale('ar'),
                      ),

                      actions: [
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        },
                            child: Text('Cancel',
                              style: TextStyle(color: Colors.red),)),

                      ],

                    ));
              }
              if(state is AddPaySlipStateSuccess) Navigator.pop(context);
            },
            builder: (context,state){
              var cubit=  AttendCubit.get(context);
              return Form(
                key: keyForm ,
                child: Scaffold(
                    appBar: AppBar(


//               ),
                      title:Text(cubit.isPayORreview=='pay'?"upload Payslip count ${ cubit.paySlipList.length}      ${cubit.valuepross.toInt()}%":'Upload Review = ${cubit.reviewList.length }     ${cubit.valuepross.toInt()}%',
                          style: TextStyle(color:ColorManager.primary,
                            fontSize: 20.0,)
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IconButton(onPressed: (){
                           // cubit.pickFileusers();
                            cubit.isPayORreview=='pay'? cubit.pickFilePaySlip():cubit.pickFileReview();
                          }, icon: Icon(Icons.file_upload_outlined)),
                        )
                      ],
                    ),
                    body: cubit.isPayORreview=='pay'? cubit.paySlipList.isNotEmpty?SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [


                            ListView.builder(

                              physics: NeverScrollableScrollPhysics(),
                              itemCount: cubit.paySlipList.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][0]}"))),


                                        Expanded(child: Text("${cubit.paySlipList[index][1]}")),

                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][2]}"))),

                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][3]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][4]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][5]}"))),


                                        Expanded(child: Text("${cubit.paySlipList[index][6]}")),

                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][7]}"))),

                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][8]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][9]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][10]}"))),

                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][11]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][12]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][13]}"))),
                                       Expanded(child: Text("${cubit.paySlipList[index][14]}")),

                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][15]}"))),

                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][16]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][17]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][18]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][19]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][20]}"))),

                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][21]}"))),

                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][22]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][23]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][24]}"))),

                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][25]}"))),

                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][26]}"))),
                                        Expanded(child: Center(child: Text("${cubit.paySlipList[index][27]}"))),


                                      ],
                                    ),
                                    const  SizedBox(height: 10,),
                                  ],
                                );

                              },

                            ),
                            const  SizedBox(height: 20,),


                            cubit.paySlipList.isNotEmpty ? ElevatedButton(

                              child:  Text("Upload"),
                              onPressed:() async {
                             // await cubit.registerSql();
                                await cubit.insertPaySlipSql();

                              },
                            ): const SizedBox(),
                          ],
                        ),
                      ),
                    ):SizedBox():cubit.reviewList.isNotEmpty?SingleChildScrollView(child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [


                            ListView.builder(

                              physics: NeverScrollableScrollPhysics(),
                              itemCount: cubit.reviewList.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Center(child: Text("${cubit.reviewList[index][0]}"))),


                                        Expanded(child: Text("${cubit.reviewList[index][1]}")),

                                        Expanded(child: Center(child: Text("${cubit.reviewList[index][2]}"))),

                                        Expanded(child: Center(child: Text("${cubit.reviewList[index][3]}"))),
                                        Expanded(child: Center(child: Text("${cubit.reviewList[index][4]}"))),
                                        Expanded(child: Center(child: Text("${cubit.reviewList[index][5]}"))),


                                        Expanded(child: Text("${cubit.reviewList[index][6]}")),

                                        Expanded(child: Center(child: Text("${cubit.reviewList[index][7]}"))),

                                        Expanded(child: Center(child: Text("${cubit.reviewList[index][8]}"))),
                                        Expanded(child: Center(child: Text("${cubit.reviewList[index][9]}"))),
                                        Expanded(child: Center(child: Text("${cubit.reviewList[index][10]}"))),




                                      ],
                                    ),
                                    const  SizedBox(height: 10,),
                                  ],
                                );

                              },

                            ),
                            const  SizedBox(height: 20,),
                            cubit.reviewList.isNotEmpty ? Column(
                              children: [


                                const SizedBox(height: 20,),



                                //           defaultEditText(label: 'Month',control: day,validat: ( s){
                                // if(s!.isEmpty){
                                // return"Empty";
                                // }
                                // return null;
                                // }),
                                //             const SizedBox(height: 20,),
                                ElevatedButton(

                                  child:  Text(cubit.editReview?"Edit":"Upload"),
                                  onPressed:() async {

                                    cubit.editReview?await cubit.updateReviewSql(context: context):await cubit.insertReviewSql(context: context);
                                    // if(keyForm.currentState!.validate()){
                                    //  cubit.addPaySlip(context,moth: day.text);
                                    //
                                    // // cubit.addUser(context: context);
                                    //
                                    // }




                                  },
                                ),

                              ],
                            ): const SizedBox(),
                          ],
                        ),
                      ),):SizedBox()
                ),
              );
            } ,

          );
        }
    );

  }

}
