
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/moduls/addplan/cubit/addPlanCubit.dart';
import 'package:untitled/moduls/addplan/cubit/addPlanStates.dart';
import 'package:untitled/shared/constant/color_manager.dart';
import 'package:untitled/shared/constant/test_styles_manager.dart';

  class  UploalPlan extends StatelessWidget {
    TextEditingController date=TextEditingController();
@override
Widget build(BuildContext context) {

  return BlocProvider(
    create:  (context)=>AddPlanCubit(),
    child: BlocConsumer<AddPlanCubit,AddPlanStates>(
      listener: (context,state){},
      builder: (context,state){
     var cubit=  AddPlanCubit.get(context);
        return Scaffold(
            appBar: AppBar(
//               systemOverlayStyle: const SystemUiOverlayStyle(
// // Status bar color
//                 statusBarColor: Colors.white,
// // Status bar brightness (optional)
//                 statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//                 statusBarBrightness: Brightness.light, // For iOS (dark icons)
//               ),
              title: const Text("upload Plan",
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [


                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cubit.data.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: Center(child: Text("${cubit.data[index][0]}"))),


                                Expanded(child: Text("${cubit.data[index][1]}")),

                                Expanded(child: Center(child: Text("${cubit.data[index][2]}"))),

                                Expanded(child: Center(child: Text("${cubit.data[index][3]}"))),
                                // Expanded(child: Text("${cubit.data[index][4]}")),
                                //
                                // Expanded(child: Center(child: Text("${cubit.data[index][5]}"))),
                                //
                                // Expanded(child: Center(child: Text("${cubit.data[index][6]}"))),
                              ],
                            ),
                          const  SizedBox(height: 10,),
                          ],
                        );

                      },

                    ),
                  const  SizedBox(height: 20,),
                    cubit.data.isNotEmpty ? Column(
                      children: [

                        defaultEditText(control: date, label: "Date", validat:( validat){},onPress: (){
                          showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                          DateTime.now() , lastDate: DateTime.parse('2023-12-31'))
                              .then((value){
                            date.text=DateFormat.yMMMd().format(value!);
                            cubit.emitstate();


                          }).catchError((error){
                            print('date error'+error.toString());
                          });
                        }),
                        const SizedBox(height: 20,),

                        //line
                        Container(
                          padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: ColorManager.primary)

                          ),
                          child: DropdownButton(

                              isExpanded: true,
                              iconSize: 40,


                              value: cubit.shift,


                              onChanged: ( String?value){

                                cubit.radioButtonShift(sht: value);


                              },

                              items:List.generate(cubit.shiftList.length, (index) =>   DropdownMenuItem<String>(child: Text(cubit.shiftList[index],style: getBoldStyle(color: ColorManager.primary,)),value: cubit.shiftList[index],))
                          ),
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(
                          child: const Text("Upload Data"),
                          onPressed:(){
                            cubit.AddPlan(date: date.text,shift: cubit.shift);




                          },
                        ),

                      ],
                    ): const SizedBox(),
       ],
                ),
              ),
            )
        );
      } ,

    ),
  );

}

  }
