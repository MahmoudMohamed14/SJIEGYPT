import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/model/hiringModel.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';

class EditHiring extends StatelessWidget {

  const EditHiring  ({Key? key}) : super(key: key);

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
    TextEditingController? callControl=new TextEditingController();
    TextEditingController? sDateControl=new TextEditingController();
    nameControl.text=HiringCubit.get(context).hiringModelEdit.english_name!;
    nIdControl.text=HiringCubit.get(context).hiringModelEdit.nId!;
    governorateControl.text=HiringCubit.get(context).hiringModelEdit.governerate!;
    dateInterviewControl.text=HiringCubit.get(context).hiringModelEdit.birth_date!;
    cityControl.text=HiringCubit.get(context).hiringModelEdit.village!;
    centerControl.text=HiringCubit.get(context).hiringModelEdit.center!;
    phoneControl.text=HiringCubit.get(context).hiringModelEdit.mob_no??'';
    noteControl.text=HiringCubit.get(context).hiringModelEdit.note!;
    callControl.text=HiringCubit.get(context).hiringModelEdit.iscall!;
    sDateControl.text=HiringCubit.get(context).hiringModelEdit.startdate!;
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
                    Expanded(child: defaultEditText(label: 'Name' ,control: nameControl,validat: ( s){
                      if(s!.isEmpty){

                        return"name is empty";
                      }
                      return null;
                    })),

                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'NationalId',control: nIdControl,textType: TextInputType.number,maxlength: 14,validat: ( s){
                      RegExp regex = RegExp(r'^\d+$');
                      if(s!.isEmpty){

                        return"NationalID is empty";
                      }
                      else if(s.length<14)return'Must Length greater than 14';
                      else if(!regex.hasMatch(s))return'input value must be number';
                      else  return null;
                    })),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'محافظة',textDirection: 'etl',control: governorateControl,validat: ( s){
                      if(s!.isEmpty){
                        return"Empty";
                      }
                      return null;
                    })),

                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [

                    Expanded(child: defaultEditText(label: 'المركز',textDirection: 'etl',control: centerControl,validat: ( s){
                      if(s!.isEmpty){
                        return"Empty";
                      }
                      return null;
                    }),),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'الحى او القريه',textDirection: 'etl',control: cityControl,
                        validat: ( s){
                          if(s!.isEmpty){
                            return" Empty";
                          }
                          return null;
                        }

                    )),
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
                    Expanded(child: defaultEditText(label: 'Date Interview',control: dateInterviewControl,validat: ( s){
                      if(s!.isEmpty){
                        return"Date is empty";
                      }
                      return null;
                    },onPress: (){

                    })),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'Note',control: noteControl,)),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'CallStatus',control: callControl,validat: ( s){
                      if(s!.toString().toLowerCase().trim() =='ok') {return null;}
                      else if(s!.toString().toLowerCase().trim() =='no'){return null;}
                      else if(s!.toString().toLowerCase().trim() =='no'){return null;}
                      else if(s!.toString().toLowerCase().trim() ==''){return null;}
                      else return 'You Must Type "ok" or "no" ';
                      // return n ull;
                    })),
                    SizedBox(width: 20,),
                    Expanded(child: defaultEditText(label: 'StartDate',control: sDateControl,)),

                  ],
                ),
                SizedBox(height: 20,),
                // Visibility(child: child)
                defaultButton(onPress: (){
                  if(keyForm.currentState!.validate()) {
                    cubit.insertHiringSql(HiringModel(english_name: nameControl.text,
                        nId: nIdControl.text,
                        center: centerControl.text,
                        village: cityControl.text,
                        governerate: governorateControl.text,
                        mob_no:phoneControl.text,
                        note: noteControl.text,
                        birth_date: dateInterviewControl.text,
                        confirm: ''));
                    // cubit.add(name: nameControl.text,nId: nIdControl.text,center: centerControl.text,city: cityControl.text,governorate: governorateControl.text,covidNO: covedControl.text,note: noteControl.text,date: dateInterviewControl.text);
                  } }, name: 'Insert'),


              ],),
            ),
          ),

        );
      },

    );
  }
}
