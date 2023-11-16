import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/model/hiringModel.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';
import 'package:untitled/shared/constant/color_manager.dart';

class EditHiring extends StatelessWidget {

  const EditHiring  ({Key? key}) : super(key: key);

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
    TextEditingController? serviceControl=new TextEditingController();
    TextEditingController? titleControl=new TextEditingController();
    TextEditingController? categoryControl=new TextEditingController();
    TextEditingController? socialAmountControl=new TextEditingController();
    TextEditingController? projectControl=new TextEditingController();
    TextEditingController? codeControl=new TextEditingController();
    TextEditingController? genCodeControl=new TextEditingController();
    TextEditingController? enddateControl=new TextEditingController();
    TextEditingController? startdateControl=new TextEditingController();
    nameControl.text=HiringCubit.get(context).hiringModelEdit.english_name!;
    nIdControl.text=HiringCubit.get(context).hiringModelEdit.nId!;
    governorateControl.text=HiringCubit.get(context).hiringModelEdit.governerate!;
    dateInterviewControl.text=HiringCubit.get(context).hiringModelEdit.birth_date!;
    villageControl.text=HiringCubit.get(context).hiringModelEdit.village!;
    centerControl.text=HiringCubit.get(context).hiringModelEdit.center!;
    phoneControl.text=HiringCubit.get(context).hiringModelEdit.mob_no??'';
    noteControl.text=HiringCubit.get(context).hiringModelEdit.note!;
    enameControl.text=HiringCubit.get(context).hiringModelEdit.english_name!;
   // locationControl.text=HiringCubit.get(context).hiringModelEdit.locatwork!;
   genderControl.text=HiringCubit.get(context).hiringModelEdit.gender!;
    birthControl.text=HiringCubit.get(context).hiringModelEdit.birth_date!;
    issuingtIDControl.text=HiringCubit.get(context).hiringModelEdit.issuing_id!;
    expiredIDControl.text=HiringCubit.get(context).hiringModelEdit.issuing_id!;
    motherControl.text=HiringCubit.get(context).hiringModelEdit.mother!;
    projectControl.text=HiringCubit.get(context).hiringModelEdit.project!;
    ageControl.text=HiringCubit.get(context).hiringModelEdit.age!;
    socialControl.text=HiringCubit.get(context).hiringModelEdit.social_insno!;
   // HiringCubit.get(context).dropValue=HiringCubit.get(context).hiringModelEdit.locatwork??'SEEG';
    serviceControl.text=HiringCubit.get(context).hiringModelEdit.service!;
    titleControl.text=HiringCubit.get(context).hiringModelEdit.title!;
    categoryControl.text=HiringCubit.get(context).hiringModelEdit.category!;
    socialAmountControl.text=HiringCubit.get(context).hiringModelEdit.social_insamount!;
    enddateControl.text=HiringCubit.get(context).hiringModelEdit.enddate!;
    startdateControl.text=HiringCubit.get(context).hiringModelEdit.startdate!;
    codeControl.text=HiringCubit.get(context).hiringModelEdit.code!;
    genCodeControl.text=HiringCubit.get(context).hiringModelEdit.gencode!;

    var keyForm=GlobalKey<FormState>();

    return BlocConsumer<HiringCubit,HiringStates>(
      listener: (context,state){},
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

                    Expanded(child: defaultEditText(label: 'Code',control:codeControl )),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'GenCode',control: genCodeControl,

                    ),

                    ),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Start work Date(m/d/y)',control: startdateControl,
                       onPress: (){
                          showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                          DateTime.parse('2010-12-31') , lastDate: DateTime.parse('2030-12-31'))
                              .then((value){
                            birthControl.text=DateFormat.yMd().format(value!);
                            cubit.getEmit();


                          }).catchError((error){
                            print('date error'+error.toString());
                          });

                        }

                    )),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'OUT work Date(m/d/y)',control: enddateControl,onPress: (){
                          showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                          DateTime.parse('2010-12-31') , lastDate: DateTime.parse('2030-12-31'))
                              .then((value){
                            birthControl.text=DateFormat.yMd().format(value!);
                            cubit.getEmit();


                          }).catchError((error){
                            print('date error'+error.toString());
                          });

                        }

                    )),

                  ],
                ),
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

                    Expanded(child: defaultEditText(label: 'Service',control: serviceControl)),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Title',control: titleControl),),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Category',control:categoryControl,


                    )),

                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Social ins. Amount ',control:socialAmountControl,


                    )),
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
                // Row(
                //   children: [
                //     Expanded(child: defaultEditText(label: 'Name' ,control: nameControl,validat: ( s){
                //       if(s!.isEmpty){
                //
                //         return"name is empty";
                //       }
                //       return null;
                //     })),
                //
                //     SizedBox(width: 20,),
                //     Expanded(child: defaultEditText(label: 'NationalId',control: nIdControl,textType: TextInputType.number,maxlength: 14,validat: ( s){
                //       RegExp regex = RegExp(r'^\d+$');
                //       if(s!.isEmpty){
                //
                //         return"NationalID is empty";
                //       }
                //       else if(s.length<14)return'Must Length greater than 14';
                //       else if(!regex.hasMatch(s))return'input value must be number';
                //       else  return null;
                //     })),
                //     SizedBox(width: 20,),
                //     Expanded(child: defaultEditText(label: 'محافظة',textDirection: 'etl',control: governorateControl,validat: ( s){
                //       if(s!.isEmpty){
                //         return"Empty";
                //       }
                //       return null;
                //     })),
                //
                //   ],
                // ),
                // SizedBox(height: 20,),
                // Row(
                //   children: [
                //
                //     Expanded(child: defaultEditText(label: 'المركز',textDirection: 'etl',control: centerControl,validat: ( s){
                //       if(s!.isEmpty){
                //         return"Empty";
                //       }
                //       return null;
                //     }),),
                //     SizedBox(width: 20,),
                //     Expanded(child: defaultEditText(label: 'الحى او القريه',textDirection: 'etl',control: cityControl,
                //         validat: ( s){
                //           if(s!.isEmpty){
                //             return" Empty";
                //           }
                //           return null;
                //         }
                //
                //     )),
                //     SizedBox(width: 20,),
                //     Expanded(
                //         child: defaultEditText(label: 'Phone Number',
                //             control: phoneControl,
                //             maxlength: 11,
                //             validat: ( s){
                //               RegExp regex = RegExp(r'^\d+$');
                //               if(s!.isEmpty) return"Vaccination No is empty";
                //
                //               else if(!regex.hasMatch(s))return'input value must be number';
                //               else if(s.length<11)return'Must Length  Not less than 11';
                //               else return null;
                //             }
                //         )),
                //   ],
                // ),
                //
                // SizedBox(height: 20,),
                // Row(
                //   children: [
                //     Expanded(child: defaultEditText(label: 'Date Interview',control: dateInterviewControl,validat: ( s){
                //       if(s!.isEmpty){
                //         return"Date is empty";
                //       }
                //       return null;
                //     },onPress: (){
                //
                //     })),
                //     SizedBox(width: 20,),
                //     Expanded(child: defaultEditText(label: 'Note',control: noteControl,)),
                //     SizedBox(width: 20,),
                //     Expanded(child: defaultEditText(label: 'CallStatus',control: callControl,validat: ( s){
                //       if(s!.toString().toLowerCase().trim() =='ok') {return null;}
                //       else if(s!.toString().toLowerCase().trim() =='no'){return null;}
                //       else if(s!.toString().toLowerCase().trim() =='no'){return null;}
                //       else if(s!.toString().toLowerCase().trim() ==''){return null;}
                //       else return 'You Must Type "ok" or "no" ';
                //       // return n ull;
                //     })),
                //     SizedBox(width: 20,),
                //     Expanded(child: defaultEditText(label: 'StartDate',control: sDateControl,)),
                //
                //   ],
                // ),
                // SizedBox(height: 20,),
                // Visibility(child: child)
                defaultButton(onPress: (){
                  if(keyForm.currentState!.validate()) {

                  cubit.hiringModelEdit.code= codeControl.text.trim();
                  cubit.hiringModelEdit. gencode= genCodeControl.text.trim();
                  cubit.hiringModelEdit. startdate= startdateControl.text.trim();
                  cubit.hiringModelEdit. enddate= enddateControl.text.trim();
                  cubit.hiringModelEdit. service= serviceControl.text.trim();
                  cubit.hiringModelEdit. social_insamount=socialAmountControl.text.trim();
                  cubit.hiringModelEdit. title=titleControl.text.trim();
                  cubit.hiringModelEdit. category=categoryControl.text.trim();

                  cubit.hiringModelEdit.arabic_name= nameControl.text.trim();
                  cubit.hiringModelEdit.nId= nIdControl.text.trim();
                  cubit.hiringModelEdit. english_name=enameControl.text.trim();
                  cubit.hiringModelEdit. center= centerControl.text.trim();
                  cubit.hiringModelEdit.project= projectControl.text.trim();
                  cubit.hiringModelEdit.locatwork= cubit.dropValue;
                  cubit.hiringModelEdit. village= villageControl.text.trim();
                  cubit.hiringModelEdit. social_insno= socialControl.text.trim();
                  cubit.hiringModelEdit. governerate= governorateControl.text.trim();
                  cubit.hiringModelEdit. mob_no= phoneControl.text.trim();
                  cubit.hiringModelEdit. mother= motherControl.text.trim();
                  cubit.hiringModelEdit.note= noteControl.text.trim();
                  cubit.hiringModelEdit.birth_date = birthControl.text.trim();
                  cubit.hiringModelEdit. date_interview=dateInterviewControl.text.trim();
                  cubit.hiringModelEdit.  gender= genderControl.text;
                  cubit.hiringModelEdit.  age= ageControl.text;
                  cubit.hiringModelEdit. issuing_id= issuingtIDControl.text.trim();
                  cubit.hiringModelEdit. expired_id=expiredIDControl.text.trim();
                        cubit.updateAllSql(context);
                  } }, name: 'Update'),


              ],),
            ),
          ),

        );
      },

    );
  }
}
