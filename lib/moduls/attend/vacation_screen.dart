import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/constant/color_manager.dart';

import 'attendCubit/cubitAttend.dart';
import 'attendCubit/statusAttend.dart';

class  VacationScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendCubit,AttendStates>(
        listener: (context,state){},

        builder: (context,state){
          var cubit=  AttendCubit.get(context);
          return Padding(

            padding: const EdgeInsets.all(20),
            child:SingleChildScrollView(

              child:state is GetVacationLoadState? Center(child: CircularProgressIndicator()):cubit.vacationModel==null ? Center(child: Text('Empty!!!')):Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color:Colors.black,width: 1.5)

                    ),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        // itemInTable(label: 'code',value: '${cubit.reviewModel!.code??""}'),
                        // itemInTable(label: 'name',value: '${cubit.reviewModel!.name??""}'),
                        cubit.vacationModel!.date1!="-"? itemInTable(label: ' ${cubit.vacationModel!.date1??''}',value: '${cubit.vacationModel!.type1??''}'):SizedBox(),
                        cubit.vacationModel!.date2!="-"? itemInTable(label: ' ${cubit.vacationModel!.date2??''}',value: '${cubit.vacationModel!.type2??''}'):SizedBox(),
                        cubit.vacationModel!.date3!="-"? itemInTable(label: ' ${cubit.vacationModel!.date3??''}',value: '${cubit.vacationModel!.type3??''}'):SizedBox(),
                        cubit.vacationModel!.date4!="-"? itemInTable(label: ' ${cubit.vacationModel!.date4??''}',value: '${cubit.vacationModel!.type4??''}'):SizedBox(),
                        cubit.vacationModel!.date5!="-"? itemInTable(label: ' ${cubit.vacationModel!.date5??''}',value: '${cubit.vacationModel!.type5??''}'):SizedBox(),
                        cubit.vacationModel!.date6!="-"? itemInTable(label: ' ${cubit.vacationModel!.date6??''}',value: '${cubit.vacationModel!.type6??''}'):SizedBox(),
                        cubit.vacationModel!.date7!="-"? itemInTable(label: ' ${cubit.vacationModel!.date7??''}',value: '${cubit.vacationModel!.type7??''}'):SizedBox(),
                        cubit.vacationModel!.date8!="-"? itemInTable(label: ' ${cubit.vacationModel!.date8??''}',value: '${cubit.vacationModel!.type8??''}'):SizedBox(),
                        cubit.vacationModel!.date9!="-"? itemInTable(label: ' ${cubit.vacationModel!.date9??''}',value: '${cubit.vacationModel!.type9??''}'):SizedBox(),
                        cubit.vacationModel!.date10!="-"? itemInTable(label: ' ${cubit.vacationModel!.date10??''}',value: '${cubit.vacationModel!.type10??''}'):SizedBox(),
                        cubit.vacationModel!.date11!="-"? itemInTable(label: ' ${cubit.vacationModel!.date11??''}',value: '${cubit.vacationModel!.type11??''}'):SizedBox(),
                        cubit.vacationModel!.date12!="-"? itemInTable(label: ' ${cubit.vacationModel!.date12??''}',value: '${cubit.vacationModel!.type12??''}'):SizedBox(),
                        cubit.vacationModel!.date13!="-"? itemInTable(label: ' ${cubit.vacationModel!.date13??''}',value: '${cubit.vacationModel!.type13??''}'):SizedBox(),
                        cubit.vacationModel!.date14!="-"? itemInTable(label: ' ${cubit.vacationModel!.date14??''}',value: '${cubit.vacationModel!.type14??''}'):SizedBox(),
                        cubit.vacationModel!.date15!="-"? itemInTable(label: ' ${cubit.vacationModel!.date15??''}',value: '${cubit.vacationModel!.type15??''}'):SizedBox(),
                        cubit.vacationModel!.date16!="-"? itemInTable(label: ' ${cubit.vacationModel!.date16??''}',value: '${cubit.vacationModel!.type16??''}'):SizedBox(),
                        cubit.vacationModel!.date17!="-"? itemInTable(label: ' ${cubit.vacationModel!.date17??''}',value: '${cubit.vacationModel!.type17??''}'):SizedBox(),
                        cubit.vacationModel!.date18!="-"? itemInTable(label: ' ${cubit.vacationModel!.date18??''}',value: '${cubit.vacationModel!.type18??''}'):SizedBox(),
                        cubit.vacationModel!.date19!="-"? itemInTable(label: ' ${cubit.vacationModel!.date19??''}',value: '${cubit.vacationModel!.type19??''}'):SizedBox(),
                        cubit.vacationModel!.date20!="-"? itemInTable(label: ' ${cubit.vacationModel!.date20??''}',value: '${cubit.vacationModel!.type20??''}'):SizedBox(),
                        cubit.vacationModel!.date21!="-"? itemInTable(label: ' ${cubit.vacationModel!.date21??''}',value: '${cubit.vacationModel!.type21??''}'):SizedBox(),
                        cubit.vacationModel!.date22!="-"? itemInTable(label: ' ${cubit.vacationModel!.date22??''}',value: '${cubit.vacationModel!.type22??''}'):SizedBox(),
                        cubit.vacationModel!.date23!="-"? itemInTable(label: ' ${cubit.vacationModel!.date23??''}',value: '${cubit.vacationModel!.type23??''}'):SizedBox(),
                        cubit.vacationModel!.date24!="-"? itemInTable(label: ' ${cubit.vacationModel!.date24??''}',value: '${cubit.vacationModel!.type24??''}'):SizedBox(),
                        cubit.vacationModel!.date25!="-"? itemInTable(label: ' ${cubit.vacationModel!.date25??''}',value: '${cubit.vacationModel!.type25??''}'):SizedBox(),
                        cubit.vacationModel!.date26!="-"? itemInTable(label: ' ${cubit.vacationModel!.date26??''}',value: '${cubit.vacationModel!.type26??''}'):SizedBox(),
                        cubit.vacationModel!.date27!="-"? itemInTable(label: ' ${cubit.vacationModel!.date27??''}',value: '${cubit.vacationModel!.type27??''}'):SizedBox(),
                        cubit.vacationModel!.date28!="-"? itemInTable(label: ' ${cubit.vacationModel!.date28??''}',value: '${cubit.vacationModel!.type28??''}'):SizedBox(),
                        cubit.vacationModel!.date29!="-"? itemInTable(label: ' ${cubit.vacationModel!.date29??''}',value: '${cubit.vacationModel!.type29??''}'):SizedBox(),
                        cubit.vacationModel!.date30!="-"? itemInTable(label: ' ${cubit.vacationModel!.date30??''}',value: '${cubit.vacationModel!.type30??''}'):SizedBox(),
                        cubit.vacationModel!.date31!="-"? itemInTable(label: ' ${cubit.vacationModel!.date31??''}',value: '${cubit.vacationModel!.type31??''}'):SizedBox(),
                        cubit.vacationModel!.date32!="-"? itemInTable(label: ' ${cubit.vacationModel!.date32??''}',value: '${cubit.vacationModel!.type32??''}'):SizedBox(),
                        cubit.vacationModel!.date33!="-"? itemInTable(label: ' ${cubit.vacationModel!.date33??''}',value: '${cubit.vacationModel!.type33??''}'):SizedBox(),
                        cubit.vacationModel!.date34!="-"? itemInTable(label: ' ${cubit.vacationModel!.date34??''}',value: '${cubit.vacationModel!.type34??''}'):SizedBox(),
                        cubit.vacationModel!.date35!="-"? itemInTable(label: ' ${cubit.vacationModel!.date35??''}',value: '${cubit.vacationModel!.type35??''}'):SizedBox(),
                        cubit.vacationModel!.date36!="-"? itemInTable(label: ' ${cubit.vacationModel!.date36??''}',value: '${cubit.vacationModel!.type36??''}'):SizedBox(),
                        cubit.vacationModel!.date37!="-"? itemInTable(label: ' ${cubit.vacationModel!.date37??''}',value: '${cubit.vacationModel!.type27??''}'):SizedBox(),
                        cubit.vacationModel!.date38!="-"? itemInTable(label: ' ${cubit.vacationModel!.date38??''}',value: '${cubit.vacationModel!.type38??''}'):SizedBox(),
                        cubit.vacationModel!.date39!="-"? itemInTable(label: ' ${cubit.vacationModel!.date39??''}',value: '${cubit.vacationModel!.type39??''}'):SizedBox(),
                        cubit.vacationModel!.date40!="-"? itemInTable(label: ' ${cubit.vacationModel!.date40??''}',value: '${cubit.vacationModel!.type40??''}'):SizedBox(),
                        cubit.vacationModel!.date41!="-"? itemInTable(label: ' ${cubit.vacationModel!.date41??''}',value: '${cubit.vacationModel!.type41??''}'):SizedBox(),
                        cubit.vacationModel!.date42!="-"? itemInTable(label: ' ${cubit.vacationModel!.date42??''}',value: '${cubit.vacationModel!.type42??''}'):SizedBox(),
                        cubit.vacationModel!.date43!="-"? itemInTable(label: ' ${cubit.vacationModel!.date43??''}',value: '${cubit.vacationModel!.type43??''}'):SizedBox(),
                        cubit.vacationModel!.date44!="-"? itemInTable(label: ' ${cubit.vacationModel!.date44??''}',value: '${cubit.vacationModel!.type44??''}'):SizedBox(),
                        cubit.vacationModel!.date45!="-"? itemInTable(label: ' ${cubit.vacationModel!.date45??''}',value: '${cubit.vacationModel!.type45??''}'):SizedBox(),

                      ],
                    ),
                  ),



                ],
              ),
            ),
          );
        }
    );
  }
  Widget  itemInTable({String label='',String value='0',Color colorRow=Colors.white,Color colorText=Colors.black,}){
    return Container(
      color: colorRow,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Center(child: Text(label,style: TextStyle(color: colorText),))),
              Expanded(child: Center(child: Text(value,style: TextStyle(color: colorText),))),
            ],
          ),
          SizedBox(height: 10,),
          Container(width: double.infinity,height: 2,color: Colors.black,),

        ],
      ),
    );
  }
}
