
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
    TextEditingController? day=new TextEditingController();
    var keyForm=GlobalKey<FormState>();

    return Builder(
        builder: (context) {

          return BlocConsumer<AttendCubit,AttendStates>(
            listener: (context,state){},
            builder: (context,state){
              var cubit=  AttendCubit.get(context);
              return Form(
                key: keyForm ,
                child: Scaffold(
                    appBar: AppBar(


//               ),
                      title:Text(cubit.isPayORreview=='pay'?"upload Payslip count ${ cubit.paySlipList.length}":'Upload Review = ${PermissionCubit.get(context).reviewList.length}',
                          style: TextStyle(color:ColorManager.primary,
                            fontSize: 20.0,)
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IconButton(onPressed: (){
                           // cubit.pickFileusers();
                            cubit.isPayORreview=='pay'? cubit.pickFilePaySlip():PermissionCubit.get(context).pickFileReview();
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
                            cubit.paySlipList.isNotEmpty ? Column(
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

                                  child:  Text("Upload"),
                                  onPressed:() async {
                                   // cubit.registerSql('username',' password', 'code', 'depart', 'controller');
                                    await cubit.insertPaySlipSql();
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
                      ),
                    ):SizedBox():PermissionCubit.get(context).reviewList.isNotEmpty?SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [


                            ListView.builder(

                              physics: NeverScrollableScrollPhysics(),
                              itemCount: PermissionCubit.get(context).reviewList.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Center(child: Text("${PermissionCubit.get(context).reviewList[index][0]}"))),


                                        Expanded(child: Text("${PermissionCubit.get(context).reviewList[index][1]}")),

                                        Expanded(child: Center(child: Text("${PermissionCubit.get(context).reviewList[index][2]}"))),

                                        Expanded(child: Center(child: Text("${PermissionCubit.get(context).reviewList[index][3]}"))),
                                        Expanded(child: Center(child: Text("${PermissionCubit.get(context).reviewList[index][4]}"))),
                                        Expanded(child: Center(child: Text("${PermissionCubit.get(context).reviewList[index][5]}"))),


                                        Expanded(child: Text("${PermissionCubit.get(context).reviewList[index][6]}")),

                                        Expanded(child: Center(child: Text("${PermissionCubit.get(context).reviewList[index][7]}"))),

                                        Expanded(child: Center(child: Text("${PermissionCubit.get(context).reviewList[index][8]}"))),
                                        Expanded(child: Center(child: Text("${PermissionCubit.get(context).reviewList[index][9]}"))),
                                        Expanded(child: Center(child: Text("${PermissionCubit.get(context).reviewList[index][10]}"))),

                                        // Expanded(child: Center(child: Text("${PermissionCubit.get(context).reviewList[index][11]}"))),
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][12]}"))),
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][13]}"))),
                                        // Expanded(child: Text("${cubit.paySlipList[index][14]}")),
                                        //
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][15]}"))),
                                        //
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][16]}"))),
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][17]}"))),
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][18]}"))),
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][19]}"))),
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][20]}"))),
                                        //
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][21]}"))),
                                        //
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][22]}"))),
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][23]}"))),
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][24]}"))),
                                        //
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][25]}"))),
                                        //
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][26]}"))),
                                        // Expanded(child: Center(child: Text("${cubit.paySlipList[index][27]}"))),


                                      ],
                                    ),
                                    const  SizedBox(height: 10,),
                                  ],
                                );

                              },

                            ),
                            const  SizedBox(height: 20,),
                            PermissionCubit.get(context).reviewList.isNotEmpty ? Column(
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

                                  child:  Text("Upload"),
                                  onPressed:() async {
                                    // cubit.registerSql('username',' password', 'code', 'depart', 'controller');
                                    cubit.isPayORreview=='pay'? await cubit.insertPaySlipSql():await cubit.insertReviewSql(context: context);
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
                      ),
                    ):SizedBox()
                ),
              );
            } ,

          );
        }
    );

  }

}
