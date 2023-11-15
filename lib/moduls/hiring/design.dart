import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/model/hiringModel.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';

import 'package:untitled/moduls/hiring/edit_hiring.dart';

Widget dataTable(context, List<HiringModel> listModel){
  return Expanded(child: DataTable2(
    

    border: TableBorder.all(),
    fixedLeftColumns: 2,
    dataRowHeight:30,


    minWidth: 2740,
    columnSpacing: 5,
    showBottomBorder:true ,
    showCheckboxColumn: true,
    
    onSelectAll: (value){
      // HiringCubit.get(context).onchangeselect(value);
      HiringCubit.get(context).onSelectAll(value??false);
      print(value.toString() +'here');
    },
    //checkboxHorizontalMargin: ,
    //horizontalScrollController:ScrollController() ,



    columns: [
      DataColumn2(label: Center(child: Text('English name ')),fixedWidth: 300, ),
      DataColumn2(label: Center(child: Text('Arabic name ')),fixedWidth: 300, ),
      DataColumn2(label: Center(child: Text('NID')), fixedWidth: 150),
      DataColumn2(label: Center(child: Text('Gender')), fixedWidth: 120),
      DataColumn2(label: Center(child: Text('Issuing ID')),  fixedWidth: 100),
      DataColumn2(label: Center(child: Text('Expired ID')), fixedWidth: 100),
      DataColumn2(label: Center(child: Text('Mob no.')), fixedWidth: 120),
      DataColumn2(label: Center(child: Text('Social ins No.')), fixedWidth: 100),
      DataColumn2(label: Center(child: Text("Mother's Name",)), fixedWidth: 200,),
      DataColumn2(label: Center(child: Text('Birth date')), fixedWidth: 130),
      DataColumn2(label: Center(child: Text('Age')), fixedWidth: 80),
      DataColumn2(label: Center(child: Text('Governerate ')),fixedWidth: 100,),
      DataColumn2(label: Center(child: Text('Center')),fixedWidth: 100),
      DataColumn2(label: Center(child: Text('Village ')),fixedWidth: 130,),
     // DataColumn2(label: Center(child: Text('Address')),fixedWidth: 200),
      DataColumn2(label: Center(child: Text('Date Interview')), fixedWidth: 130),
      DataColumn2(label: Center(child: Text('confirm')),fixedWidth: 80,),
      DataColumn2(label: Center(child: Text('CallStatus')),fixedWidth: 80,),
      DataColumn2(label: Center(child: Text('Note')),fixedWidth: 300,),
      DataColumn2(label: Center(child: Text('Edit')),size:ColumnSize.S,),



    ], rows: List<DataRow>.generate(listModel.length, (index) =>
      DataRow(

        selected:HiringCubit.get(context).selectedNID.contains( listModel[index].nId),
        //HiringCubit.get(context).selectall,


        onSelectChanged: (value){
          if(value??false) HiringCubit.get(context).selectedNID.add(listModel[index].nId??'') ;else HiringCubit.get(context).selectedNID.removeAt(HiringCubit.get(context).selectedNID.indexOf(listModel[index].nId??"")) ;
          HiringCubit.get(context).getEmit();

          print(value.toString()+'odd');
        },

        cells: [
          DataCell(Center(child: Text('${listModel[index].english_name}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].arabic_name}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].nId}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].gender}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].issuing_id}',))),
          DataCell(Center(child: Text('${listModel[index].expired_id}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].mob_no}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].social_insno}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].mother}',style: TextStyle(),))),
         // DataCell(Center(child: Text('${listModel[index].confirm}',style: TextStyle(color: HiringCubit.get(context).statusOfList=='true'?Colors.green:Colors.black),))),
          DataCell(Center(child: Text('${listModel[index].birth_date}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].age}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].governerate}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].center}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].village}',style: TextStyle(),))),
          //DataCell(Center(child: Text('${listModel[index].address}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].date_interview}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].confirm}',style: TextStyle(color: HiringCubit.get(context).statusOfList=='true'?Colors.green:Colors.black),))),
          DataCell(Center(child: Text('${listModel[index].iscall}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].note}',style: TextStyle(),))),
          DataCell(Center(child: Icon(Icons.edit)),onTap: (){
            HiringCubit.get(context).edit(listModel[index]);
            navigateTo(context, EditHiring());
          }),




        ],)),
  ));
}
Widget dataTableSafety(context, List<HiringModel> listModel){
  return Expanded(child: DataTable2(


    border: TableBorder.all(),
    fixedLeftColumns: 2,
    dataRowHeight:30,


    minWidth: 2740,
    columnSpacing: 5,
    showBottomBorder:true ,
    showCheckboxColumn: true,

    onSelectAll: (value){
      // HiringCubit.get(context).onchangeselect(value);
      HiringCubit.get(context).onSelectAll(value??false);
      print(value.toString() +'here');
    },
    //checkboxHorizontalMargin: ,
    //horizontalScrollController:ScrollController() ,



    columns: [
      DataColumn2(label: Center(child: Text('English name ')),fixedWidth: 300, ),
      DataColumn2(label: Center(child: Text('Arabic name ')),fixedWidth: 300, ),
      DataColumn2(label: Center(child: Text('Project')), fixedWidth: 150),
      DataColumn2(label: Center(child: Text('Service')), fixedWidth: 120),
      DataColumn2(label: Center(child: Text('Vest')),  fixedWidth: 80),
      DataColumn2(label: Center(child: Text('Shoes Size')), fixedWidth: 80),
      DataColumn2(label: Center(child: Text('Safety Soes')), fixedWidth: 80),
      DataColumn2(label: Center(child: Text('Crocs')), fixedWidth: 80),
      DataColumn2(label: Center(child: Text("Safety Helmet",)), fixedWidth: 80,),
      DataColumn2(label: Center(child: Text('Ear blug')), fixedWidth: 80),
      DataColumn2(label: Center(child: Text('Cutter')), fixedWidth: 80),




    ], rows: List<DataRow>.generate(listModel.length, (index) =>
      DataRow(

        selected:HiringCubit.get(context).selectedNID.contains( listModel[index].nId),
        //HiringCubit.get(context).selectall,


        onSelectChanged: (value){
          if(value??false) HiringCubit.get(context).selectedNID.add(listModel[index].nId??'') ;else HiringCubit.get(context).selectedNID.removeAt(HiringCubit.get(context).selectedNID.indexOf(listModel[index].nId??"")) ;
          HiringCubit.get(context).getEmit();

          print(value.toString()+'odd');
        },

        cells: [
          DataCell(Center(child: Text('${listModel[index].english_name}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].arabic_name}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].project}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].service}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].vest}',))),
          DataCell(Center(child: Text('${listModel[index].shoes_size}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].safety_soes}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].crocs}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].safety_helmet}',style: TextStyle(),))),
          // DataCell(Center(child: Text('${listModel[index].confirm}',style: TextStyle(color: HiringCubit.get(context).statusOfList=='true'?Colors.green:Colors.black),))),
          DataCell(Center(child: Text('${listModel[index].ear_blug}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].cutter}',style: TextStyle(),))),





        ],)),
  ));
}
