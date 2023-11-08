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


    minWidth: 2400,
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
      DataColumn2(label: Center(child: Text('A Name')),fixedWidth: 300, ),
      DataColumn2(label: Center(child: Text('E Name')),fixedWidth: 300, ),
      DataColumn2(label: Center(child: Text('National ID')), fixedWidth: 180),
      DataColumn2(label: Center(child: Text('المحافظة')),  fixedWidth: 150),
      DataColumn2(label: Center(child: Text('المركز')), fixedWidth: 150),
      DataColumn2(label: Center(child: Text('الحي والقريه')), fixedWidth: 180),
      DataColumn2(label: Center(child: Text('Vaccination No.')), fixedWidth: 210),
      DataColumn2(label: Center(child: Text('Date ')), fixedWidth: 150),
      DataColumn2(label: Center(child: Text('Confirm',)), fixedWidth: 130,),
      DataColumn2(label: Center(child: Text('CallStatus')), fixedWidth: 130),
      DataColumn2(label: Center(child: Text('Document')), fixedWidth: 130),
      DataColumn2(label: Center(child: Text('Note ')),fixedWidth: 200),
      DataColumn2(label: Center(child: Text('Edit')),size: ColumnSize.S,),



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
          DataCell(Center(child: Text('${listModel[index].name}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].ename}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].nId}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].governorate}',))),
          DataCell(Center(child: Text('${listModel[index].center}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].city}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].phoneno}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].date}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].confirm}',style: TextStyle(color: HiringCubit.get(context).statusOfList=='true'?Colors.green:Colors.black),))),
          DataCell(Center(child: Text('${listModel[index].document}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].iscall}',style: TextStyle(),))),
          DataCell(Center(child: Text('${listModel[index].note}',style: TextStyle(),))),
          DataCell(Center(child: Icon(Icons.edit)),onTap: (){
            HiringCubit.get(context).edit(listModel[index]);
            navigateTo(context, EditHiring());
          }),




        ],)),
  ));
}
