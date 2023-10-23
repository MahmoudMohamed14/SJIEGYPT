

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/remote/dioHelper.dart';
import 'package:untitled/model/hiringModel.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';

class HiringCubit extends Cubit< HiringStates> {
  HiringCubit () : super(HiringInitState ());

  static HiringCubit  get(context) {
    return BlocProvider.of(context);
  }
  bool selectall=false;
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
  // void add({name,nId,governorate,city,center,covidNO,date,note}){
  //   listModelHiring.add(HiringModel(name: name,nId: nId,governorate: governorate,center: center,city: city,covidNo: covidNO,date: date,note: note));
  //   emit(HiringAddState());
  // }
  // void confirm(){
  //   for(int i=0;i<selectedNID.length;i++){
  //     listModelHiring.forEach((element) {
  //       if(element.nId==selectedNID[i]){
  //         element.confirm=true;
  //       }
  //     });
  //   }
  //   getEmit();
  // }
  Future insertHiringSql(HiringModel model)  async {
    emit(HiringAddLoadingState());

      try{
        Response response=await DioHelper.dio.post('hiring.php',queryParameters: model.toMap());
        if(response.statusCode==200){
          getAllHiring();
          emit(HiringAddSuccessState());

          print("###############################");
          print(response.data);

        }
      }catch(error){
        print("payupload "+error.toString());
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

  }
}




  }
  Future<void> getAllHiring() async {
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
  Future confirmAndCancelSql(bool confirm)  async {
   // valuepross=0;
  late HiringModel model;

    for(int i=0;i< selectedNID.length;i++){
      listModelHiring.forEach((element) {
        if(element.nId==selectedNID[i]){
          element.confirm=confirm?'ok':'No';
          model=element;
        }
      });

      try{
        Response response=await DioHelper.dio.post('edithiring.php',queryParameters: model.toMap());
        if(response.statusCode==200){
          print(i);
         // valuepross=(i+1)/suddenNormalList.length*100;
          getEmit();
          print("###############################");
          print(response.data);
          // if(valuepross.toInt()==100){
          //   suddenNormalList.clear();
          //   emit(UpdateSuddenNormalSQLSuccessState());
          // }
        }
      }catch(error){
        print("Sudden Normal upload "+error.toString());

      }

   if(i==selectedNID.length-1){
     getAllHiring();
   }




    }



  }
 List <HiringModel>listOfSearch=[];
String statusOfList='';
  void search(String value){
    listOfSearch=[];
   // listOfSearch = listModelHiring.where((element) => element['code']!.toLowerCase().trim().contains(value.toLowerCase())).toList();

    listOfSearch = listModelHiring.where((element) => element.toMap().values.toString().toLowerCase().trim().contains(value.toLowerCase().trim())).toList();
    print('ffffffffffffffffffffffffffffffffffff');
    listOfSearch.forEach((element) {
      print(element.name);
    });

    // emit(SearchState());
  }
  void getMyList(){
    listModelHiring=[];
    listAllHiring.forEach((element) {
      if(statusOfList=='true'&& element.confirm=='ok'){
        listModelHiring.add(element);
      }else   if(statusOfList=='false'&& element.confirm=='No'){
        listModelHiring.add(element);
      }else   if(statusOfList==''&& element.confirm==''){
        listModelHiring.add(element);

      }

    });
    getEmit();

  }
}

