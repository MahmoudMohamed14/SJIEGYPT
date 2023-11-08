
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';


import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';
import 'package:untitled/shared/constant/color_manager.dart';


class  UploadSuddenNormalScreen extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    //TextEditingController? day=new TextEditingController();

    return Builder(
      builder: (context) {

        return BlocConsumer<AttendCubit,AttendStates>(
          listener: (context,state){},
          builder: (context,state){
            var cubit=  AttendCubit.get(context);
            return Scaffold(
                appBar: AppBar(

                  title: Text("Upload Sudden And Normal   ${cubit.valuepross.toInt()}",
                      style: TextStyle(color:ColorManager.darkPrimary,
                        fontSize: 20.0,)
                  ),
                  actions:[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(onPressed: (){
                        cubit.pickFileSuddenNormal();
                      }, icon: Icon(Icons.file_upload_outlined)),
                    )
                  ],
                ),
                body:  cubit.suddenNormalList.isNotEmpty?RefreshIndicator(
                  onRefresh:  () async{
                 RefreshProgressIndicator();
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [


                          ListView.builder(

                            physics: NeverScrollableScrollPhysics(),
                            itemCount: cubit.suddenNormalList.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Center(child: Text("${cubit.suddenNormalList[index][0]}"))),


                                      Expanded(child: Text("${cubit.suddenNormalList[index][1]}")),

                                      Expanded(child: Center(child: Text("${cubit.suddenNormalList[index][2]}"))),


                                    ],
                                  ),
                                  const  SizedBox(height: 10,),
                                ],
                              );

                            },

                          ),
                          const  SizedBox(height: 20,),
                       cubit.suddenNormalList.isNotEmpty ? Column(
                            children: [


                              const SizedBox(height: 20,),




                              ElevatedButton(
                                child:  Text("Upload"),
                                onPressed:(){

                                  cubit.UpdateSuddenNormalSql();




                                },
                              ),

                            ],
                          ): const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ):SizedBox()
            );
          } ,

        );
      }
    );

  }

}
