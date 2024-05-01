import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/model/hiringModel.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';
import 'package:untitled/moduls/hiring/edit_hiring.dart';
import 'package:untitled/shared/constant/color_manager.dart';
class AllDataBaseScreen extends StatelessWidget {
  const AllDataBaseScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? search=new TextEditingController();
    TextEditingController? SocialAmountControl=new TextEditingController();
    return  BlocConsumer<HiringCubit,HiringStates>(
        listener: (context,state){
          if(state is HiringDeleteLoadingState||state is HiringConfirmAndRejectLoadingState ||state is HiringCallLoadingState ){
            showDialog(

                barrierDismissible: false,
                context: context,
                builder:(context )=>AlertDialog(
                  backgroundColor:Colors.grey,
                  title: Text('Loading!!!',style: TextStyle(color: Colors.white),),
                  content:  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(child: CircularProgressIndicator()),
                      // state is HiringAddErrorState? Text('تم الفحص الكود من قبل !!',style: TextStyle(color: Colors.white)):SizedBox(),
                    ],
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      //emit(FinishSCanStateSuccess());
                      // duplicated=false;
                      // emitState();

                      Navigator.of(context).pop(true);

                    }, child: Text('Cancel',style: TextStyle(color: Colors.white),)),
                  ],

                ));
          }
          if(state is HiringCallSuccessState|| state is HiringDeleteSuccessState||state is HiringConfirmAndRejectSuccessState){Navigator.of(context).pop(true);}
        },
        builder:  (context,state){
          var cubit=HiringCubit.get(context);
          return  Scaffold(

         appBar: AppBar(),
            //   backgroundColor: Colors.white70.withOpacity(.9),


            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                //  mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey.withOpacity(.1),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width:200,
                          height: 40,
                          child: defaultEditText(prefIcon: Icons.search,label: 'search',control: search,onchange: (s){
                            cubit.search(s);
                          }),
                        ),


                        Spacer(),
                        // TextButton(onPressed: (){
                        //   signOut( context);
                        //
                        // }, child:Row(
                        //   children: [
                        //     Icon(Icons.logout_outlined,color:ColorManager.error ,),
                        //     SizedBox(width: 5,),
                        //     Text('Logout',style: TextStyle(color: ColorManager.error,fontWeight: FontWeight.bold,fontSize: 16),),
                        //
                        //     //Text('${cubit.countCallok}',style: TextStyle(color:  ColorManager.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                        //
                        //   ],
                        // )),



                      ],
                    ),

                  ),
                  //  Container(height: double.infinity,width: 1,color: Colors.grey,),
                  SizedBox(height: 20,),

                  Visibility(child: Row(
                    children: [
                       // SizedBox(width: 20,),
                      defaultButton(color: Colors.blueGrey,height: 25,width: 180,onPress: () async {
                        showDialog(

                            barrierDismissible: false,
                            context: context,
                            builder:(context )=>AlertDialog(
                              backgroundColor:Colors.grey,
                              title: Text('Set Social ins.Amount',style: TextStyle(color: Colors.white),),
                              content:  Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultEditText(label: 'Social ins.Amount',control: SocialAmountControl),
                                  //Center(child: CircularProgressIndicator()),
                                  // state is HiringAddErrorState? Text('تم الفحص الكود من قبل !!',style: TextStyle(color: Colors.white)):SizedBox(),
                                ],
                              ),
                              actions: [
                                TextButton(onPressed: (){
                                  //emit(FinishSCanStateSuccess());
                                  // duplicated=false;
                                  // emitState();

                                  Navigator.of(context).pop(true);

                                }, child: Text('Cancel',style: TextStyle(color: Colors.white),)),
                                TextButton(onPressed: () async {
                                  await cubit.updateValueSql('social_insamount',value: SocialAmountControl.text.trim()).then((value) {

                                  }) ;

                                }, child: Text('Confirm',style: TextStyle(color: ColorManager.darkPrimary),)),
                              ],

                            ));



                      }, name:'Set Social Ins Amount'),

                      SizedBox(width: 15,),
                      defaultButton(height: 25,width: 150,onPress: () async {
                        showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                        DateTime.now() , lastDate: DateTime.parse('2030-12-31'))
                            .then((value){
                          cubit.updateValueSql('enddate',value: DateFormat.yMd().format(value!));


                        }).catchError((error){
                          print('date error'+error.toString());
                        });



                      }, name:'Date Out Service'),
                      SizedBox(width: 15,),
                      defaultButton(color: Colors.red,height: 25,width: 100,onPress: () async {
                        cubit.deleteHiringSql();


                      }, name:'Delete'),

                      SizedBox(width: 15,),
                      defaultButton(color: Colors.blueGrey,height: 25,width: 80,onPress: () async {
                        cubit.createExcel();


                      }, name:'Export'),
                    ],
                  ),visible: cubit.selectedNID.isNotEmpty?true:false),
                  SizedBox(height: 20,),
                  search.text.isNotEmpty? Expanded(child: Rowtable(context,cubit.listAllHiring))//dataTableAllData(context,cubit.listOfSearch)
                      :cubit.listAllHiring.isNotEmpty? Expanded(child: Rowtable(context,cubit.listAllHiring))// Expanded(child: dataTableAllData(context,cubit.listModelHiring))

                      :Column(
                    children: [
                      SizedBox(height: 200,),
                      Text('EMPTY!',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 30),),
                    ],
                  ),
                ],),
            ) ,

          );
        }


    );
  }
  Widget Rowtable(context, List<HiringModel> listModel){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Table(
        //columnWidths: {2:FlexColumnWidth(200)},


        border:TableBorder.all(),




        defaultColumnWidth: IntrinsicColumnWidth(),



        children:List.generate(listModel.length, (index) => TableRow(


            decoration: BoxDecoration(


                border: Border.all()

            ),
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${index}',style: TextStyle(),),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.edit),onPressed: (){
                    HiringCubit.get(context).edit(listModel[index]);
                    navigateTo(context, EditHiring());
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${listModel[index].code}',style: TextStyle(),),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${listModel[index].gencode}',style: TextStyle(),),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${listModel[index].english_name}',style: TextStyle(),),
                ),
              ),
              Center(child: Text('${listModel[index].arabic_name}',style: TextStyle(),)),
              Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${listModel[index].nId}',style: TextStyle(),),
              )),
              Center(child: Text('${listModel[index].gender}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].issuing_id}',)),
              Center(child: Text('${listModel[index].expired_id}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].mob_no}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].social_insno}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].mother}',style: TextStyle(),)),
              // Center(child: Text('${listModel[index].confirm}',style: TextStyle(color: HiringCubit.get(context).statusOfList=='true'?Colors.green:Colors.black),)),
              Center(child: Text('${listModel[index].birth_date}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].age}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].governerate}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].center}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].village}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].locatwork}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].date_interview}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].startdate}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].enddate}',style: TextStyle(),)),
              //Project	Service 	Title	Category	Social ins. Amount
              Center(child: Text('${listModel[index].project}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].service}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].title}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].category}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].social_insamount}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].confirm}',style: TextStyle(color: HiringCubit.get(context).statusOfList=='true'?Colors.green:Colors.black),)),
              Center(child: Text('${listModel[index].iscall}',style: TextStyle(),)),

              Center(child: Text('${listModel[index].criminal_report}',style: TextStyle(color:listModel[index].criminal_report=='Received'?Colors.green:ColorManager.error ),)),
              Center(child: Text('${listModel[index].education_certificate}',style: TextStyle(color:listModel[index].education_certificate=='Received'?Colors.green:ColorManager.error),)),
              Center(child: Text('${listModel[index].military_certificate}',style: TextStyle(color:listModel[index].military_certificate=='Received'?Colors.green:ColorManager.error),)),
              Center(child: Text('${listModel[index].birth_certificate}',style: TextStyle(color:listModel[index].birth_date=='Received'?Colors.green:ColorManager.error),)),
              Center(child: Text('${listModel[index].insurance_print}',style: TextStyle(color:listModel[index].insurance_print=='Received'?Colors.green:ColorManager.error),)),
              Center(child: Text('${listModel[index].nid_copy}',style: TextStyle(color:listModel[index].nid_copy=='Received'?Colors.green:ColorManager.error),)),
              Center(child: Text('${listModel[index].personal_photo}',style: TextStyle(color:listModel[index].personal_photo=='Received'?Colors.green:ColorManager.error),)),
              Center(child: Text('${listModel[index].form_111}',style: TextStyle(color:listModel[index].form_111=='Received'?Colors.green:ColorManager.error),)),
              Center(child: Text('${listModel[index].qr_vaccine}',style: TextStyle(color:listModel[index].qr_vaccine=='Received'?Colors.green:ColorManager.error),)),


              Center(child: Text('${listModel[index].shoes_size}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].vest}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].safety_soes}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].crocs}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].safety_helmet}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].ear_blug}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].cutter}',style: TextStyle(),)),
              Center(child: Text('${listModel[index].note}',style: TextStyle(),)),
              Center(child: Icon(Icons.edit)),




            ]
        )),


      ),
    );

  }
}