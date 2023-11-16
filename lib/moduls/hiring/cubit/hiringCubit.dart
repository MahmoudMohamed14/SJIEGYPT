

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';

import 'package:untitled/componant/remote/dioHelper.dart';
import 'package:untitled/model/hiringModel.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';
import 'package:open_file/open_file.dart';

class HiringCubit extends Cubit< HiringStates> {
  HiringCubit () : super(HiringInitState ());

  static HiringCubit  get(context) {
    return BlocProvider.of(context);
  }
  bool selectall=false;
  String dropValue='SEEG';
  List<String>dropValueList=['SEEG','Silo','Fayoum'];
  void dropButtonChange({vlu}) {
    dropValue = vlu;
    emit(HiringDropState ());
  }
  void onchangeselect(value){
    selectall= !selectall;
    emit(HiringAddState());
  }
  void onSelectAll(bool value){
   // selectedNID=[]

    if(value){
      listModelHiring.forEach((element) {
        selectedNID.add(element.nId??'');

      });
    }else selectedNID=[];
    emit(HiringAddState());
  }
  getEmit(){
    emit(HiringAddState());
  }
  List<String>selectedNID=[];
  List<HiringModel> listModelHiring=[];

  List<HiringModel> listAllHiring=[];

  Future insertHiringSql(HiringModel model)  async {
    emit(HiringAddLoadingState());
   String errorString='';
      try{

        Response response=await DioHelper.dio.post('hiring.php',queryParameters: model.toMap());
        //print(response.data);
        if(response.statusCode==200){
          print(response.data);
          getAllHiring();
          emit(HiringAddSuccessState());


          print("###############################");
          print(response.data);

        }else{
          print("${response.data+response.statusMessage}  data error");
        }
        print("${response.data+response.statusMessage}  data error");
      }catch(error){
       // print("${response.data??"error"}");

        print("payupload "+error.toString()+ "@@@@@@@"+errorString);
        emit(HiringAddErrorState());

      }



  }
  Future deleteHiringSql()  async {
    emit(HiringDeleteLoadingState());
     for(int i=0;i<selectedNID.length;i++) {
  try{
    Response response=await DioHelper.dio.post('deletehiring.php',queryParameters: {
      'nId':selectedNID[i]
    });
    if(response.statusCode==200){
     // getAllHiring();


      print("###############################");
      print(response.data);

    }
  }catch(error){
    print("payupload "+error.toString());
    emit(HiringDeleteErrorState());

  }
  if(i==selectedNID.length-1){

    emit(HiringDeleteSuccessState());
    selectedNID=[];
    getAllHiring();
    onSelectAll(false);

  }
}




  }
  Future<void> getAllHiring() async {
   emit(HiringGetLoadingState());
    listAllHiring=[];
    try{
    Response response=await  DioHelper.dio.post('gethiring.php');
    if (response.statusCode == 200 ) {
      var res=json.decode(response.data);
      //  showToast(text: value.data.toString(), state: ToastState.SUCCESS);
      if(res.length>0){
        print(res);
        listAllHiring=[];
        res.forEach((element){
          listAllHiring.add(HiringModel.FromJson(element));
          //myDepartList.add(element['depart']);
        });

        emit(HiringGetSuccessState());
        getMyList();

      }

      print(response.statusCode);

    } else {print('Login failed: ${response.data}');}
    }catch(onError){
      emit(HiringGetErrorState());

      print('Login onError: ${onError.toString()}');
      print(onError);
    }


  }
  // Future confirmAndCancelSql(bool confirm)  async {
  //   emit(HiringConfirmAndRejectLoadingState());
  //  // valuepross=0;
  // late HiringModel model;
  //
  //   for(int i=0;i< selectedNID.length;i++){
  //     listModelHiring.forEach((element) {
  //       if(element.nId==selectedNID[i]){
  //         element.confirm=confirm?'ok':'no';
  //         model=element;
  //       }
  //     });
  //
  //     try{
  //       Response response=await DioHelper.dio.post('testupdate.php',queryParameters: {'key':'confirm','value':model.confirm,'nId':model.nId});
  //       if(response.statusCode==200){
  //         print(i);
  //        // valuepross=(i+1)/suddenNormalList.length*100;
  //       //  getEmit();
  //         print("###############################");
  //         print(response.data);
  //         // if(valuepross.toInt()==100){
  //         //   suddenNormalList.clear();
  //         //   emit(UpdateSuddenNormalSQLSuccessState());
  //         // }
  //         if(i==selectedNID.length-1){
  //           emit(HiringConfirmAndRejectSuccessState());
  //           getAllHiring();
  //           onSelectAll(false);
  //         }
  //       }
  //     }catch(error){
  //       emit(HiringConfirmAndRejectErrorState());
  //       print("Sudden Normal upload "+error.toString());
  //
  //     }
  //
  //
  //
  //
  //
  //
  //   }
  //
  //
  //
  // }
  Future updateValueSql(String ky , {bool ?iscall,String? value})  async {
    String val='';
    emit(HiringCallLoadingState());
    // valuepross=0;
    late HiringModel model;

    for(int i=0;i< selectedNID.length;i++){
      listModelHiring.forEach((element) {
        if(element.nId==selectedNID[i]){
          if(iscall!=null) val=iscall?'ok':'no';
          else if(value !=null) val=value;

          model=element;
        }
      });

      try{
        Response response=await DioHelper.dio.post('valueupdatehiring.php',queryParameters: {'key':ky,'value':val,'nId':model.nId});
        if(response.statusCode==200){
          print(i);
          // valuepross=(i+1)/suddenNormalList.length*100;
          //getEmit();

          print("###############################");
          print(response.data);
          // if(valuepross.toInt()==100){
          //   suddenNormalList.clear();
          //   emit(UpdateSuddenNormalSQLSuccessState());
          // }
          if(i==selectedNID.length-1){
            emit(HiringCallSuccessState());
            getAllHiring();
            onSelectAll(false);
          }
        }
      }catch(error){
        print("Sudden Normal upload "+error.toString());
        emit(HiringCallErrorState());

      }






    }



  }
  Future updateAllSql(context)  async {

    emit(HiringUpdateLoadingState());


    try{
      Response response=await DioHelper.dio.post('edithiring.php',queryParameters: hiringModelEdit.toMap());
      if(response.statusCode==200){
       // print(i);
        // valuepross=(i+1)/suddenNormalList.length*100;
        //getEmit();

        print("###############################");
        print(response.data);
        // if(valuepross.toInt()==100){
        //   suddenNormalList.clear();
        //   emit(UpdateSuddenNormalSQLSuccessState());
        // }

          emit(HiringUpdateSuccessState());
        Navigator.of(context).pop(true);

          getAllHiring();
          onSelectAll(false);

      }
    }catch(error){
      print("edit allHiring "+error.toString());
      emit(HiringUpdateErrorState());

    }



  }



 List <HiringModel>listOfSearch=[];
 String statusOfList='true';
  void search(String value){
    listOfSearch=[];

    listOfSearch = listModelHiring.where((element) => element.valueSearch().toLowerCase().trim().contains(value.toLowerCase().trim())).toList();
     getEmit();


    // emit(SearchState());
  }
  int countCallok=0;
  int countCallno=0;

  void getMyList(){
    countCallok=0;
    countCallno=0;

    listModelHiring=[];
    listAllHiring.forEach((element) {
      if(CacheHelper.getData(key: 'controller')=='safety'){
        if(element.startdate!.isNotEmpty)listModelHiring.add(element);
      }

     else if(element.startdate!.isEmpty){
       if(statusOfList=='true'&& element.confirm=='ok'){
        if(element.iscall=='ok' ){
          countCallok+=1;
          //listModelHiring.add(element);
        }
         if(element.iscall=='no'){
          countCallno +=1;
        //  // listModelHiring.add(element);
         }

        listModelHiring.add(element);
      }
      else   if(statusOfList=='false'&& element.confirm=='no'){listModelHiring.add(element);}
      else   if(statusOfList==''&& element.confirm==''){listModelHiring.add(element);}
     }

    });
    getEmit();

  }
  Future<void> createExcel() async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    if(listOfSearch.isNotEmpty){ for(int i=0;i<=listOfSearch.length;i++){
      if(i==0){
        sheet.getRangeByName('A1').setText('En');
        sheet.getRangeByName('B1').setText('National ID');
        sheet.getRangeByName('C1').setText('المحافظه');
        sheet.getRangeByName('D1').setText('المركز');
        sheet.getRangeByName('E1').setText('القريه');
        sheet.getRangeByName('F1').setText('CovidNo');
        sheet.getRangeByName('G1').setText('Confirmed');
        sheet.getRangeByName('H1').setText('Date');
      }else{
        sheet.getRangeByName('A${i+1}').setText('${listOfSearch[i-1].english_name}');
        sheet.getRangeByName('B${i+1}').setText('${listOfSearch[i-1].arabic_name}');
        sheet.getRangeByName('C${i+1}').setText('${listOfSearch[i-1].nId}');
        sheet.getRangeByName('D${i+1}').setText('${listOfSearch[i-1].mother}');
        sheet.getRangeByName('E${i+1}').setText('${listOfSearch[i-1].mob_no}');
        sheet.getRangeByName('F${i+1}').setText('${listOfSearch[i-1].governerate}');
        sheet.getRangeByName('G${i+1}').setText('${listOfSearch[i-1].center}');
        sheet.getRangeByName('H${i+1}').setText('${listOfSearch[i-1].birth_date}');

      }

    }}else{
   for(int i=0;i<=listModelHiring.length;i++){
     if(i==0){
       sheet.getRangeByName('A1').setText('Name');
       sheet.getRangeByName('B1').setText('National ID');
       sheet.getRangeByName('C1').setText('المحافظه');
       sheet.getRangeByName('D1').setText('المركز');
       sheet.getRangeByName('E1').setText('القريه');
       sheet.getRangeByName('F1').setText('CovidNo');
       sheet.getRangeByName('G1').setText('Confirmed');
       sheet.getRangeByName('H1').setText('Date');
     }
     else{
       sheet.getRangeByName('A${i+1}').setText('${listModelHiring[i-1].english_name}');
       sheet.getRangeByName('B${i+1}').setText('${listModelHiring[i-1].nId}');
       sheet.getRangeByName('C${i+1}').setText('${listModelHiring[i-1].governerate}');
       sheet.getRangeByName('D${i+1}').setText('${listModelHiring[i-1].center}');
       sheet.getRangeByName('E${i+1}').setText('${listModelHiring[i-1].center}');
       sheet.getRangeByName('F${i+1}').setText('${listModelHiring[i-1].mob_no}');
       sheet.getRangeByName('G${i+1}').setText('${listModelHiring[i-1].confirm}');
       sheet.getRangeByName('H${i+1}').setText('${listModelHiring[i-1].birth_date}');
     }

   }
    }

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();


      final String path = ( await getDownloadsDirectory())!.path;
      final String fileName = '$path\\Output.xlsx' ;
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);

  }
 late HiringModel hiringModelEdit ;
  void edit(HiringModel model){
    hiringModelEdit=model;
    getEmit();

  }
  String typeSearch='';
  bool isSearch=false;
  void searchByValue(bool search,String txtSearch){
    isSearch=search;
    typeSearch=txtSearch;
    listModelHiring=[];
    if(isSearch){
    listAllHiring.forEach((element) {
      if(txtSearch =='callOk'&&element.iscall=='ok' && element.confirm=='ok'){
        listModelHiring.add(element);
      }else   if(txtSearch =='callNo'&&element.iscall=='no'&& element.confirm=='ok' ){
        listModelHiring.add(element);
      }
      // else   if(txtSearch =='documentOk'&&element.document=='ok'&& element.confirm=='ok' ){
      //   listModelHiring.add(element);
      //
      // }else   if(txtSearch =='documentNo'&&element.document=='' && element.confirm=='ok'){
      //   listModelHiring.add(element);
      //
      // }

    });} else getMyList();
    getEmit();

  }
}

