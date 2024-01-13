import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';
import 'package:untitled/moduls/hiring/design.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? search=new TextEditingController();
    TextEditingController? shoesSizeControl=new TextEditingController();
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

                  Visibility(child: Column(
                    children: [
                      Row(
                        children: [
                          defaultButton(color:  Colors.blueGrey,height: 25,width: 150,onPress: () async {
                            await cubit.updateValueSql('criminal_report',value: "Received") ;


                          }, name:'Criminal report'),
                          // Row(
                          //   children: [
                          //     SizedBox(width: 20,),
                          //     defaultButton(color: Colors.blueGrey,height: 25,width: 130,onPress: () async {
                          //       showDialog(
                          //
                          //           barrierDismissible: false,
                          //           context: context,
                          //           builder:(context )=>AlertDialog(
                          //             backgroundColor:Colors.grey,
                          //             title: Text('Set Shoes Size',style: TextStyle(color: Colors.white),),
                          //             content:  Column(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: [
                          //                 defaultEditText(label: 'Shoes Size',control: shoesSizeControl),
                          //                 //Center(child: CircularProgressIndicator()),
                          //                 // state is HiringAddErrorState? Text('تم الفحص الكود من قبل !!',style: TextStyle(color: Colors.white)):SizedBox(),
                          //               ],
                          //             ),
                          //             actions: [
                          //               TextButton(onPressed: (){
                          //                 //emit(FinishSCanStateSuccess());
                          //                 // duplicated=false;
                          //                 // emitState();
                          //
                          //                 Navigator.of(context).pop(true);
                          //
                          //               }, child: Text('Cancel',style: TextStyle(color: Colors.white),)),
                          //               TextButton(onPressed: () async {
                          //                 await cubit.updateValueSql('shoes_size',value: shoesSizeControl.text.trim()).then((value) {
                          //
                          //                 }) ;
                          //
                          //               }, child: Text('Confirm',style: TextStyle(color: ColorManager.darkPrimary),)),
                          //             ],
                          //
                          //           ));
                          //
                          //
                          //
                          //     }, name:'Set Shoes Size'),
                          //   ],
                          // ),
                          SizedBox(width: 15,),
                          defaultButton(color:  Colors.blueGrey,height: 25,width: 180,onPress: () async {
                            cubit.updateValueSql('education_certificate',value: 'Received').then((value) {}) ;


                          }, name:'Education certificate'),
                          SizedBox(width:15,),
                          defaultButton(color: Colors.blueGrey,height: 25,width: 150,onPress: () async {
                            cubit.updateValueSql('military_certificate ',value: 'Received').then((value) {}) ;
                          }, name:'Military certificate'),
                          SizedBox(width: 15,),
                          defaultButton(color:  Colors.blueGrey,height: 25,width: 180,onPress: () async {
                            cubit.updateValueSql('birth_certificate',value:'Received' );


                          }, name:'Birth certificate'),
                          SizedBox(width: 15,),
                          defaultButton(color: Colors.blueGrey,height: 25,width: 150,onPress: () async {
                            cubit.updateValueSql('insurance_print',value:'Received' );


                          }, name:'Insurance print'),
                        ],
                      ),
                      SizedBox(height: 10,),
                     Row(children: [
                       defaultButton(color: Colors.blueGrey ,height: 25,width: 120,onPress: () async {
                         cubit.updateValueSql('nid_copy',value:'Received' );


                       }, name:'NID copy'),
                       SizedBox(width: 15,),
                       defaultButton(color: Colors.blueGrey ,height: 25,width: 150,onPress: () async {
                         cubit.updateValueSql('personal_photo',value:'Received' );


                       }, name:'Personal photo'),
                       SizedBox(width: 15,),
                       defaultButton(color: Colors.blueGrey ,height: 25,width: 120,onPress: () async {
                         cubit.updateValueSql('form_111',value:'Received' );


                       }, name:'Form 111'),
                       SizedBox(width: 15,),
                       defaultButton(color: Colors.blueGrey ,height: 25,width: 120,onPress: () async {
                         cubit.updateValueSql('qr_vaccine',value:'Received' );


                       }, name:'QR  vaccine'),
                       SizedBox(width: 15,),
                       defaultButton(color: Colors.blueGrey,height: 25,width: 80,onPress: () async {
                         cubit.createExcel();


                       }, name:'Export'),
                     ],)
                    ],
                  ),visible: cubit.selectedNID.isNotEmpty?true:false),
                  SizedBox(height: 20,),
                  search.text.isNotEmpty?dataTableDocument(context,cubit.listOfSearch)
                      :cubit.listModelHiring.isNotEmpty? dataTableDocument(context,cubit.listModelHiring)
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
}