import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/model/hiringModel.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';
import 'package:untitled/moduls/hiring/design.dart';
import 'package:untitled/shared/constant/color_manager.dart';

class InsetInfoHiring extends StatelessWidget {

  const InsetInfoHiring  ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? nameControl= new TextEditingController();
    TextEditingController? enameControl= new TextEditingController();
    TextEditingController? nIdControl=new TextEditingController();
    TextEditingController? governorateControl= new TextEditingController();
    TextEditingController? dateInterviewControl=new TextEditingController();
    TextEditingController? villageControl=new TextEditingController();
    TextEditingController? centerControl=new TextEditingController();
    TextEditingController? phoneControl=new TextEditingController();
    TextEditingController? noteControl=new TextEditingController();
    TextEditingController? motherControl=new TextEditingController();
    TextEditingController? socialControl=new TextEditingController();
    TextEditingController? issuingtIDControl=new TextEditingController();
    TextEditingController? expiredIDControl=new TextEditingController();
    TextEditingController? ageControl=new TextEditingController();
    TextEditingController? birthControl=new TextEditingController();
    TextEditingController? genderControl=new TextEditingController();
    TextEditingController? locationControl=new TextEditingController();
    TextEditingController? projectControl=new TextEditingController();



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

          appBar: AppBar(

          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
            child: Form(
              key: keyForm,
              child: Column(children: [
                Row(
                  children: [
                    Expanded(child: defaultEditText(label: 'English Name',control: enameControl,validat: ( s){
                      if(s!.isEmpty){

                        return"name is empty";
                      }
                      return null;
                    })),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Arabic Name',control: nameControl,validat: ( s){
                      if(s!.isEmpty){

                        return"name is empty";
                      }
                      return null;
                    })),


                    SizedBox(width: 20,),
                    Expanded(child: Column(
                      children: [
                        SizedBox(height: 20,),
                        defaultEditText(onchange: (String s){
                          if(s.length==14){
                          String date= s.toString().substring(0,7);
                          String day=date.substring(5,7);
                          String month=date.substring(3,5);

                          String year=date.substring(1,3);
                          String numYear=date.substring(0,1)=='2'?'19':'20';
                          int gender=int.parse(s.substring(12,13));
                          print(int.parse(s.substring(12,13)).toString()+"gender");
                          genderControl.text=gender%2==0?'Female':'Male';
                          ageControl.text=(DateTime.now().year-int.parse("$numYear$year")).toString();
                          birthControl.text="$month/$day/$numYear$year";
                          String gov=s.substring(7,9);
                          switch(gov){
                            case '23':{governorateControl.text='Fayoum';
                              break;
                            }case '22':{governorateControl.text='Beni suef';
                          break;
                          }case '21':{governorateControl.text='Giza';
                          break;
                          }case '01':{governorateControl.text='Cairo';
                          break;
                          }
                          }
                          cubit.getEmit();}
                          if(s.length<14){
                            governorateControl.clear();
                            genderControl.clear();
                            birthControl.clear();
                            genderControl.clear();
                            ageControl.clear();

                          }
                          cubit.getEmit();
                        },
                            label: 'National ID',control: nIdControl,textType: TextInputType.number,maxlength: 14,validat: ( s){
                          RegExp regex = RegExp(r'^\d+$');
                        if(s!.isEmpty){

                        return"NationalID is empty";
                        }
                        else if(s.length<14)return'Must Length greater than 14';
                        // else if(s.length==14){
                        //   String date= s.toString().substring(0,7);
                        //   String day=date.substring(5,7);
                        //   String month=date.substring(3,5);
                        //   String year=date.substring(1,3);
                        //   dateInterviewControl.text="$month/$day/19$year";
                        //   cubit.getEmit();
                        // }
                        else if(!regex.hasMatch(s))return'input value must be number';
                  else  return null;
                        }),
                      ],
                    )),
                              SizedBox(width: 20,),
                    Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            defaultEditText(
                                label: 'Mobile Number',
                                control: phoneControl,
                                maxlength: 11,
                                validat: ( s){
                                  RegExp regex = RegExp(r'^\d+$');
                                  if(s!.isEmpty) return"Mobile No is empty";

                                  else if(!regex.hasMatch(s))return'input value must be number';
                                  else if(s.length<11)return'Must Length  Not less than 11';
                                  else return null;
                                }
                            ),
                          ],
                        )),
                  ],
                ),

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
                    Expanded(child: defaultEditText(label: 'Village',control: villageControl,
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

                Row(
                  children: [

                     Expanded(child: Column(

                       children: [
                         SizedBox(height:20,),
                         defaultEditText(label:'Social insurance',control: socialControl
   // validat: ( s){
                    //   RegExp regex = RegExp(r'^\d+$');
                    //  // if(s!.isEmpty) return"Mobile No is empty";
                    //
                    //    if(!regex.hasMatch(s))return'input value must be number';
                    //   else if(s.length<8)return'Must Length  Not less than 8';
                    //   else return null;
                    // }
                    ,maxlength: 8),
                       ],
                     )),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Issuing ID',control: issuingtIDControl,validat: ( s){
                      if(s!.isEmpty){
                        return"Empty";
                      }
                      return null;
                    },
                        onPress: (){
                          showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                          DateTime.now() , lastDate: DateTime.parse('2030-12-31'))
                              .then((value){
                            issuingtIDControl.text=DateFormat.yM().format(value!);
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

                Row(
                  children: [

                    Expanded(child: defaultEditText(label: 'Gender',control: genderControl,validat: ( s){
                      if(s!.isEmpty){
                        return"Empty";
                      }
                      return null;
                    })),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Age',control: ageControl,validat: ( s){
                      if(s!.isEmpty){
                        return"Empty";
                      }
                      return null;
                    },

                    ),

                    ),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Birth date(m/d/y)',control: birthControl,
                        validat: ( s){
                          if(s!.isEmpty){
                            return" Empty";
                          }
                          return null;
                        },onPress: (){
                          showDatePicker(context: context, initialDate:  DateTime.parse('1999-01-01'), firstDate:
                          DateTime.parse('1950-12-31') , lastDate: DateTime.parse('2010-12-31'))
                              .then((value){
                            birthControl.text=DateFormat.yMd().format(value!);
                            cubit.getEmit();


                          }).catchError((error){
                            print('date error'+error.toString());
                          });

                        }

                    )),
                    SizedBox(width: 20,),
                    // Expanded(child: defaultEditText(label: 'Date Interview',control: birthControl
                    //     ,validat: ( s){
                    //       if(s!.isEmpty){
                    //         return"Date is empty";
                    //       }
                    //       return null;
                    //     }
                    //     ,onPress: (){
                    //       showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                    //       DateTime.now() , lastDate: DateTime.parse('2023-12-31'))
                    //           .then((value){
                    //         dateInterviewControl.text=DateFormat.yMd().format(value!);
                    //         cubit.getEmit();
                    //
                    //
                    //       }).catchError((error){
                    //         print('date error'+error.toString());
                    //       });
                    //
                    //     })),
                    // SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Project',control: projectControl,)),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [

                    Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.lightPrimary),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: DropdownButton(

                          isExpanded: true,
                          iconSize: 40,


                          value: cubit.dropValue,


                          onChanged: ( String?value){

                            cubit.dropButtonChange(vlu: value);


                          },

                          items:List.generate(cubit.dropValueList.length, (index) =>   DropdownMenuItem<String>(child: Text(cubit.dropValueList[index],),value: cubit.dropValueList[index],))
                      ),
                    ),
                    SizedBox(width: 20,),
                    // Expanded(child: defaultEditText(label: 'Date Interview',control: birthControl
                    //     ,validat: ( s){
                    //       if(s!.isEmpty){
                    //         return"Date is empty";
                    //       }
                    //       return null;
                    //     }
                    //     ,onPress: (){
                    //       showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                    //       DateTime.now() , lastDate: DateTime.parse('2023-12-31'))
                    //           .then((value){
                    //         dateInterviewControl.text=DateFormat.yMd().format(value!);
                    //         cubit.getEmit();
                    //
                    //
                    //       }).catchError((error){
                    //         print('date error'+error.toString());
                    //       });
                    //
                    //     })),
                    // SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Note',control: noteControl,)),
                  ],
                ),
                SizedBox(height: 10,),


                defaultButton(onPress: (){
    if(keyForm.currentState!.validate()) {
      cubit.insertHiringSql(
          HiringModel(
            arabic_name: nameControl.text.trim(),
          nId: nIdControl.text.trim(),
          english_name: enameControl.text.trim(),
          center: centerControl.text.trim(),
          project: projectControl.text.trim(),
          locatwork: cubit.dropValue,
          village: villageControl.text.trim(),
          social_insno: socialControl.text.trim(),
          governerate: governorateControl.text.trim(),
          mob_no: phoneControl.text.trim(),
          mother: motherControl.text.trim(),
          note: noteControl.text.trim(),
          birth_date : birthControl.text.trim(),
          date_interview: dateInterviewControl.text.trim(),
          confirm: '',
          gender: genderControl.text,
          age: ageControl.text,
          issuing_id: issuingtIDControl.text.trim(),
          expired_id: expiredIDControl.text.trim(),
      ));
      // cubit.add(name: nameControl.text,nId: nIdControl.text,center: centerControl.text,city: cityControl.text,governorate: governorateControl.text,covidNO: covedControl.text,note: noteControl.text,date: dateInterviewControl.text);
    } }, name: 'Insert'),

                SizedBox(height: 20,),
                Visibility(child: defaultButton(width: 100,onPress: () async {
                await cubit.deleteHiringSql() ;
                }, name:'delete'),visible: cubit.selectedNID.isNotEmpty?true:false),


                SizedBox(height: 20,),
               cubit.listModelHiring.isNotEmpty? dataTable(context,cubit.listModelHiring.reversed.toList())


            :SizedBox()
              ],),
            ),
          ),

        );
      },

    );
  }
}
