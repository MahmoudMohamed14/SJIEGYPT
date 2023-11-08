import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/model/hiringModel.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';

class InsetInfoHiring extends StatelessWidget {

  const InsetInfoHiring  ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? nameControl= new TextEditingController();
    TextEditingController? enameControl= new TextEditingController();
    TextEditingController? nIdControl=new TextEditingController();
    TextEditingController? governorateControl= new TextEditingController();
    TextEditingController? dateInterviewControl=new TextEditingController();
    TextEditingController? cityControl=new TextEditingController();
    TextEditingController? centerControl=new TextEditingController();
    TextEditingController? phoneControl=new TextEditingController();
    TextEditingController? noteControl=new TextEditingController();
    TextEditingController? motherControl=new TextEditingController();
    TextEditingController? socialControl=new TextEditingController();
    TextEditingController? importIDControl=new TextEditingController();
    TextEditingController? expiredIDControl=new TextEditingController();
    dateInterviewControl.text=DateFormat.yMd().format(DateTime.now());
    var keyForm=GlobalKey<FormState>();
    //.compareTo(DateTime.parse(formattedString)).toString();//DateTime.now().toString();
    return BlocConsumer<HiringCubit,HiringStates>(
      listener: (context,state){
        if(state is HiringAddLoadingState){
          showDialog(
            barrierDismissible: false,
              context: context,
              builder:(context )=>AlertDialog(

                backgroundColor:Colors.grey,

                title: Text('Insert',style: TextStyle(color: Colors.white),),
                content:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: CircularProgressIndicator()),
                    state is HiringAddErrorState? Text('تم الفحص الكود من قبل !!',style: TextStyle(color: Colors.white)):SizedBox(),
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
        if(state is HiringAddSuccessState){Navigator.of(context).pop(true);}
      },
      builder:  (context,state){
        var cubit=HiringCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: keyForm,
              child: Column(children: [
                Row(
                  children: [
                    Expanded(child: defaultEditText(label: 'Arabic Name',control: nameControl,validat: ( s){
                      if(s!.isEmpty){

                        return"name is empty";
                      }
                      return null;
                    })),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'English Name',control: enameControl,validat: ( s){
                      if(s!.isEmpty){

                        return"name is empty";
                      }
                      return null;
                    })),

                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'National ID',control: nIdControl,textType: TextInputType.number,maxlength: 14,validat: ( s){
                      RegExp regex = RegExp(r'^\d+$');
                    if(s!.isEmpty){

                    return"NationalID is empty";
                    }
                    else if(s.length<14)return'Must Length greater than 14';
                    else if(!regex.hasMatch(s))return'input value must be number';
                  else  return null;
                    })),
                              SizedBox(width: 20,),
                    Expanded(
                        child: defaultEditText(label: 'Phone Number',
                            control: phoneControl,
                            maxlength: 11,
                            validat: ( s){
                              RegExp regex = RegExp(r'^\d+$');
                              if(s!.isEmpty) return"Vaccination No is empty";

                              else if(!regex.hasMatch(s))return'input value must be number';
                              else if(s.length<11)return'Must Length  Not less than 11';
                              else return null;
                            }
                        )),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [

                    Expanded(child: defaultEditText(label: 'محافظة',control: governorateControl,validat: ( s){
                      if(s!.isEmpty){
                        return"Empty";
                      }
                      return null;
                    })),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'المركز',control: centerControl,validat: ( s){
                      if(s!.isEmpty){
                        return"Empty";
                      }
                      return null;
                    }),),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'الحى او القريه',control: cityControl,
                        validat: ( s){
                          if(s!.isEmpty){
                            return" Empty";
                          }
                          return null;
                        }

                    )),

                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Mother’s Name',control:motherControl,
                        validat: ( s){
                          if(s!.isEmpty){
                            return" Empty";
                          }
                          return null;
                        }

                    )),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [

                    Expanded(child: defaultEditText(label: 'Social insurance',control: socialControl,validat: ( s){
                      if(s!.isEmpty){
                        return"Empty";
                      }
                      return null;
                    })),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Import ID',control: importIDControl,validat: ( s){
                      if(s!.isEmpty){
                        return"Empty";
                      }
                      return null;
                    },
                        onPress: (){
                          showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                          DateTime.now() , lastDate: DateTime.parse('2023-12-31'))
                              .then((value){
                            importIDControl.text=DateFormat.yM().format(value!);
                            cubit.getEmit();


                          }).catchError((error){
                            print('date error'+error.toString());
                          });

                        }
                    ),

                    ),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'expired ID',control: expiredIDControl,
                        validat: ( s){
                          if(s!.isEmpty){
                            return" Empty";
                          }
                          return null;
                        },onPress: (){
                          showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                          DateTime.now() , lastDate: DateTime.parse('2023-12-31'))
                              .then((value){
                            expiredIDControl.text=DateFormat.yMd().format(value!);
                            cubit.getEmit();


                          }).catchError((error){
                            print('date error'+error.toString());
                          });

                        }

                    )),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Date Interview',control: dateInterviewControl
                        ,validat: ( s){
                      if(s!.isEmpty){
                        return"Date is empty";
                      }
                      return null;
                    }
                    ,onPress: (){
                        showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                        DateTime.now() , lastDate: DateTime.parse('2023-12-31'))
                            .then((value){
                          dateInterviewControl.text=DateFormat.yMd().format(value!);
                          cubit.getEmit();


                        }).catchError((error){
                          print('date error'+error.toString());
                        });

                    })),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [


                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Note',control: noteControl,)),
                    //SizedBox(width: 20,),
                    // Expanded(child: defaultEditText(label: 'search',control: search,onchange: (s){
                    //   cubit.search(s);
                    // })),

                  ],
                ),
                SizedBox(height: 20,),

                defaultButton(onPress: (){
    if(keyForm.currentState!.validate()) {
      cubit.insertHiringSql(HiringModel(name: nameControl.text,
          nId: nIdControl.text.trim(),
          ename: enameControl.text.trim(),
          center: centerControl.text.trim(),
          city: cityControl.text.trim(),
          governorate: governorateControl.text.trim(),
          phoneno: phoneControl.text.trim(),
          note: noteControl.text.trim(),
          date: dateInterviewControl.text.trim(),
          confirm: ''));
      // cubit.add(name: nameControl.text,nId: nIdControl.text,center: centerControl.text,city: cityControl.text,governorate: governorateControl.text,covidNO: covedControl.text,note: noteControl.text,date: dateInterviewControl.text);
    } }, name: 'Insert'),

                SizedBox(height: 20,),
                Visibility(child: defaultButton(width: 100,onPress: () async {
                await cubit.deleteHiringSql() ;
                }, name:'delete'),visible: cubit.selectedNID.isNotEmpty?true:false),
                SizedBox(height: 20,),
               cubit.listModelHiring.isNotEmpty? Expanded(child: DataTable2(
                  border: TableBorder.all(),
                  fixedLeftColumns: 2,
                   dataRowHeight: 30,

                   minWidth: 1700,
                    showBottomBorder:true ,
                    showCheckboxColumn: true,
                    onSelectAll: (value){
                     // cubit.onchangeselect(value);
                      cubit.onSelectAll(value??false);
                     print(value.toString() +'here');
                    },
                    //checkboxHorizontalMargin: ,
                    //horizontalScrollController:ScrollController() ,



                    columns: [
                      DataColumn2(label: Center(child: Text('Name')),fixedWidth: 300, ),
                      DataColumn2(label: Text('National ID'), fixedWidth: 180),
                      DataColumn2(label: Text('المحافظة'),  fixedWidth: 150),
                      DataColumn2(label: Text('المركز'), fixedWidth: 150),
                      DataColumn2(label: Text('الحي والقريه'), fixedWidth: 180),
                      DataColumn2(label: Text('Vaccination No.'), fixedWidth: 210),
                      DataColumn2(label: Text('Date '), fixedWidth: 150),
                      DataColumn2(label: Text('Confirm'), size: ColumnSize.L),
                      DataColumn2(label: Text('Note '), size: ColumnSize.L),



                    ], rows: List<DataRow>.generate(cubit.listModelHiring.length, (index) =>
                    DataRow(selected:cubit.selectedNID.contains( cubit.listModelHiring[index].nId),
                      //cubit.selectall,


                      onSelectChanged: (value){
                      if(value??false) cubit.selectedNID.add(cubit.listModelHiring[index].nId??'') ;else cubit.selectedNID.removeAt(cubit.selectedNID.indexOf(cubit.listModelHiring[index].nId??"")) ;
                      cubit.getEmit();

                        print(value.toString()+'odd');
                      },

                      cells: [
                      DataCell(Text('${cubit.listModelHiring[index].name}',style: TextStyle(),)),
                      DataCell(Text('${cubit.listModelHiring[index].nId}',style: TextStyle(),)),
                      DataCell(Text('${cubit.listModelHiring[index].governorate}',)),
                      DataCell(Text('${cubit.listModelHiring[index].center}',style: TextStyle(),)),
                      DataCell(Text('${cubit.listModelHiring[index].city}',style: TextStyle(),)),
                      DataCell(Text('${cubit.listModelHiring[index].phoneno}',style: TextStyle(),)),
                      DataCell(Text('${cubit.listModelHiring[index].date}',style: TextStyle(),)),
                        DataCell(Text('${cubit.listModelHiring[index].confirm}',style: TextStyle(),)),
                      DataCell(Text('${cubit.listModelHiring[index].note}',style: TextStyle(),)),




                    ],)),
                )
                ):SizedBox()
              ],),
            ),
          ),

        );
      },

    );
  }
}
