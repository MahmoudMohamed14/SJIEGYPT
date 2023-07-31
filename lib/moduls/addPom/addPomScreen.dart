
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled/moduls/addPom/cubit/addPomCubit.dart';
import 'package:untitled/moduls/addPom/cubit/addPomStates.dart';


class  UploadPomScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AddPomCubit,AddPomStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=  AddPomCubit.get(context);
        return Scaffold(
            appBar: AppBar(

//               systemOverlayStyle: const SystemUiOverlayStyle(
// // Status bar color
//                 statusBarColor: Colors.white,
// // Status bar brightness (optional)
//                 statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//                 statusBarBrightness: Brightness.light, // For iOS (dark icons)
//               ),
              title: const Text("upload Pom",
                  style: TextStyle(color:Colors.amberAccent,
                    fontSize: 20.0,)
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(onPressed: (){
                    // cubit.pickFile();
                  }, icon: Icon(Icons.file_upload_outlined)),
                )
              ],
            ),
            body: cubit.pomList.isNotEmpty?SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [


                    ListView.builder(
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cubit.pomList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: Center(child: Text("${cubit.pomList[index][0]}"))),


                                Expanded(child: Text("${cubit.pomList[index][1]}")),

                                Expanded(child: Center(child: Text("${cubit.pomList[index][2]}"))),

                                Expanded(child: Center(child: Text("${cubit.pomList[index][3]}"))),
                                Center(child: Text("${cubit.pomList[index][4]}")),
                              ],
                            ),
                            const  SizedBox(height: 10,),
                          ],
                        );

                      },

                    ),
                    const  SizedBox(height: 20,),
                    cubit.pomList.isNotEmpty ? Column(
                      children: [

                        // defaultEditText(control: date, label: "Date", validat:( validat){},onPress: (){
                        //   showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                        //   DateTime.now() , lastDate: DateTime.parse('2023-12-31'))
                        //       .then((value){
                        //     date.text=DateFormat.yMMMd().format(value!);
                        //     cubit.emitstate();
                        //
                        //
                        //   }).catchError((error){
                        //     print('date error'+error.toString());
                        //   });
                        // }),
                        const SizedBox(height: 20,),

                        //line
                        // Container(
                        //   padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                        //   width: double.infinity,
                        //   height: 60,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       border: Border.all(color: ColorManager.primary)
                        //
                        //   ),
                        //   child: DropdownButton(
                        //
                        //       isExpanded: true,
                        //       iconSize: 40,
                        //
                        //
                        //       value: cubit.shift,
                        //
                        //
                        //       onChanged: ( String?value){
                        //
                        //         cubit.radioButtonShift(sht: value);
                        //
                        //
                        //       },
                        //
                        //       items:List.generate(cubit.shiftList.length, (index) =>   DropdownMenuItem<String>(child: Text(cubit.shiftList[index],style: getBoldStyle(color: ColorManager.primary,)),value: cubit.shiftList[index],))
                        //   ),
                        // ),
                        const SizedBox(height: 20,),
                        ElevatedButton(
                          child: const Text("Upload Pom"),
                          onPressed:(){
                            cubit.addPOm();




                          },
                        ),

                      ],
                    ): const SizedBox(),
                  ],
                ),
              ),
            ):SizedBox()
        );
      } ,

    );

  }

}
