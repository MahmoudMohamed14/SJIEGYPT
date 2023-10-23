
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';


import 'package:untitled/moduls/attend/attendCubit/cubitAttend.dart';
import 'package:untitled/moduls/attend/attendCubit/statusAttend.dart';


class  UploadAttendScreen extends StatelessWidget {


 bool isEdi;
 bool delet;
UploadAttendScreen({required this.isEdi,required this.delet});

  @override
  Widget build(BuildContext context) {
    TextEditingController? day=new TextEditingController();

    return Builder(
      builder: (context) {

        return BlocConsumer<AttendCubit,AttendStates>(
          listener: (context,state){},
          builder: (context,state){
            var cubit=  AttendCubit.get(context);
            return Scaffold(
                appBar: AppBar(

//               systemOverlayStyle: const SystemUiOverlayStyle(
// // Status bar color
//                 statusBarColor: Colors.white,
// // Status bar brightness (optional)
//                 statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//                 statusBarBrightness: Brightness.light, // For iOS (dark icons)
//               ),
                  title: delet ? const Text("Delete Attend",
                      style: TextStyle(color:Colors.amberAccent,
                        fontSize: 20.0,)
                  ):isEdi? const Text("upload CheckOut Attend",
                      style: TextStyle(color:Colors.amberAccent,
                        fontSize: 20.0,)
                  ):const Text("upload Attend",
                      style: TextStyle(color:Colors.amberAccent,
                        fontSize: 20.0,)
                  ),
                  actions:delet?null: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(onPressed: (){
                        // cubit.pickFileAttend();
                      }, icon: Icon(Icons.file_upload_outlined)),
                    )
                  ],
                ),
                body:  delet? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [


                      const SizedBox(height: 20,),



                      isEdi || delet?   defaultEditText(label: 'day',control: day):SizedBox(),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                        child:  Text(delet ?"Delete":"Upload"),
                        onPressed:(){

                      //    cubit.addAttendance(edit: isEdi,day: day.text,del: delet);




                        },
                      ),

                    ],
                  ),
                ): cubit.attendList.isNotEmpty?RefreshIndicator(
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
                            itemCount: cubit.attendList.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Center(child: Text("${cubit.attendList[index][0]}"))),


                                      Expanded(child: Text("${cubit.attendList[index][1]}")),

                                      Expanded(child: Center(child: Text("${cubit.attendList[index][2]}"))),

                                      Expanded(child: Center(child: Text("${cubit.attendList[index][3]}"))),
                                      Expanded(child: Center(child: Text("${cubit.attendList[index][4]}"))),
                                      Center(child: Text("${cubit.attendList[index][5]}")),
                                    ],
                                  ),
                                  const  SizedBox(height: 10,),
                                ],
                              );

                            },

                          ),
                          const  SizedBox(height: 20,),
                       cubit.attendList.isNotEmpty ? Column(
                            children: [


                              const SizedBox(height: 20,),



                           isEdi || delet?   defaultEditText(label: 'day',control: day):SizedBox(),
                              const SizedBox(height: 20,),
                              ElevatedButton(
                                child:  Text(delet ?"Delete":"Upload"),
                                onPressed:(){

                              //    cubit.addAttendance(edit: isEdi,day: day.text,del: delet);




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
