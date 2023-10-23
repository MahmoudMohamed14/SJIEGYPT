import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/moduls/hiring/cubit/hiringCubit.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';
import 'package:untitled/moduls/hiring/insertInformation.dart';

class InsertHiring extends StatelessWidget {
  const InsertHiring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HiringCubit,HiringStates>(
        listener: (context,state){},
    builder:  (context,state){
      var cubit=HiringCubit.get(context);
          return  Scaffold(

            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(


                    width: 150,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(onPressed: (){
                          cubit.statusOfList='';
                          cubit.getMyList();
                        }, child:Text('Hiring List')),
                        SizedBox(height: 20,),
                        TextButton(onPressed: (){
                          cubit.statusOfList='true';
                          cubit.getMyList();
                        }, child:Text('Accepted')),
                        SizedBox(height: 20,),
                        TextButton(onPressed: (){
                          cubit.statusOfList='false';
                          cubit.getMyList();
                        }, child:Text('NotAccepted')),
                      ],
                    ),
                  ),
                  Container(height: double.infinity,width: 1,color: Colors.grey,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                      Visibility(child: Row(
                        children: [
                          defaultButton(height: 25,width: 100,onPress: () async {
                            await cubit.confirmAndCancelSql(true) ;


                          }, name:'confirm'),
                          SizedBox(width: 20,),
                          defaultButton(height: 25,width: 100,onPress: () async {
                             cubit.confirmAndCancelSql(false).then((value) {

                             }) ;


                          }, name:'Reject'),
                        ],
                      ),visible: cubit.selectedNID.isNotEmpty?true:false),
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
                              DataCell(Text('${cubit.listModelHiring[index].covidNo}',style: TextStyle(),)),
                              DataCell(Text('${cubit.listModelHiring[index].date}',style: TextStyle(),)),
                              DataCell(Text('${cubit.listModelHiring[index].confirm}',style: TextStyle(),)),
                              DataCell(Text('${cubit.listModelHiring[index].note}',style: TextStyle(),)),




                            ],)),
                      )
                      ):SizedBox()
                    ],),
                  ),
                ],
              ),
            ) ,
           floatingActionButton: FloatingActionButton(onPressed: (){
            navigateTo(context, InsetInfoHiring());
           },),
          );
    }


    );
  }
}
