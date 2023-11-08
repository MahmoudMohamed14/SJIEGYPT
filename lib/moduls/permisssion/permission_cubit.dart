import 'dart:convert';
import 'dart:io';

 import 'package:csv/csv.dart';
 import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/componant/remote/dioHelper.dart';
import 'package:untitled/model/permissionModel.dart';
import 'package:untitled/model/reviewModel.dart';
import 'package:untitled/moduls/permisssion/permission_status.dart';
import 'package:http/http.dart' as http;

class PermissionCubit extends Cubit< PermissionStates> {
  PermissionCubit () : super( PermissionInitState());

  static PermissionCubit  get(context) {
    return BlocProvider.of(context);
  }
  String? filePathReview;
  List<ReviewModel> reviewListModel=[];
  List<List<dynamic>> reviewList= [];
  pickFileReview() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      reviewList = [];
      print(result.files.first.name);
      filePathReview = result.files.first.path!;

      final input = File(filePathReview!).openRead();
      final fields = await input
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();
      reviewList   = fields;
      print(fields.length);
      print( reviewList.length);

      reviewListModel=[];

      for (int i = 0; i <fields.length; i++) {


        reviewListModel.add(ReviewModel(
          code: fields[i][0].toString().trim(),
          name: fields[i][1].toString().trim(),
          month_1: fields[i][2].toString().trim(),
          month_2: fields[i][3].toString().trim(),
          // Variable: fields[i][4].toString().trim(),
          // Clothing_Allow: fields[i][5].toString().trim(),
          month_3: fields[i][4].toString().trim(),
          month_4: fields[i][5].toString().trim(),
          month_5: fields[i][6].toString().trim(),
          month_6: fields[i][7].toString().trim(),
          month_7: fields[i][8].toString().trim(),
          month_8: fields[i][9].toString().trim(),
          month_9: fields[i][10].toString().trim(),
          month_10: fields[i][11].toString().trim(),
          month_11: fields[i][12].toString().trim(),
          month_12: fields[i][13].toString().trim(),
          month_13:  fields[i][14].toString().trim(),
          month_14: fields[i][15].toString().trim(),
          month_15: fields[i][16].toString().trim(),
          month_16: fields[i][17].toString().trim(),
          month_17: fields[i][18].toString().trim(),
          month_18: fields[i][19].toString().trim(),
          month_19: fields[i][20].toString().trim(),
          month_20: fields[i][21].toString().trim(),
          month_21: fields[i][22].toString().trim()??'',
          month_22: fields[i][23].toString().trim()??'',
          month_23: fields[i][24].toString().trim()??'',
          month_24: fields[i][25].toString().trim()??'',
          month_25: fields[i][26].toString().trim()??'',
          month_26: fields[i][27].toString().trim()??'',
          month_27: fields[i][28].toString().trim()??'',
          month_28: fields[i][29].toString().trim()??'',
          month_29: fields[i][30].toString().trim()??'',
          month_30: fields[i][31].toString().trim()??'',
          month_31: fields[i][32].toString().trim()??'',
          month: '',






        ));



      }

      emit(FetchStateSuccess());
      // print(pomList);
      PlatformFile file = result.files.first;
      print(reviewList.length);

      print(file.name);

      print(file.size);
      print(file.extension);
      print(file.path);
    }


    else {
// User canceled the picker
    }


  }

  List<String> allVaction=['','اعتيادية'];
  List<String> Vaction=['','عارضة'];
  String valueofdepart='';
  void onChangeDepart(value){
    valueofdepart=value;
    emit(ChangeDepartState());
  }

  void orderPermission(context,String day,String reason,  String id,
  String  name,
  String date,

      String state,){
    emit( PermissionLoadingState());
    // var url = Uri.parse('https://sjeg.seongji-eg.com/addHoliday.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  PermissionModel(day:day
    //         ,date: date
    //         ,code: id
    //         ,name: name
    //         ,depart: CacheHelper.getData(key: 'depart')??'NoDepart'
    //         ,reason: reason
    //         ,state: state
    //     ).toMap())
        DioHelper.dio.post('addHoliday.php',queryParameters: PermissionModel(day:day
            ,date: date
            ,code: id
            ,name: name
            ,depart: CacheHelper.getData(key: 'depart')??'NoDepart'
            ,reason: reason
            ,state: state
        ).toMap() ).then((value) {
      if (value.statusCode == 200 ) {
        emit(PermissionSuccessState());
        Navigator.pop(context);
        getOrderPermissionSQL();

        print(value.data.trim()); // The response from PHP script
      }else  {print(value.data.trim());
      emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });


  }

  void deletePermissionSql(context, String date,){
    emit( PermissionDeleteLoadingState());

    // var url = Uri.parse('https://sjeg.seongji-eg.com/deleteholiday.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'code':CacheHelper.getData(key: 'myId'),"date":date})
    DioHelper.dio.post('deleteholiday.php',queryParameters:{'code':CacheHelper.getData(key: 'myId'),"date":date} ).then((value) {
      // emit(PermissionDeleteSuccessState());
      // Navigator.pop(context);
      // getOrderPermissionSQL();

      if (value.statusCode == 200 ) {
        emit(PermissionDeleteSuccessState());
        Navigator.pop(context);
        getOrderPermissionSQL();



        print(value.data.trim()); // The response from PHP script
      }else  {print(value.data.trim());
      emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionDeleteErrorState());
      print(onError.toString().trim());
    });
    // Firestore.instance
    //     .collection("Permission").document(id+date).delete().then((value) {
    //   emit(PermissionDeleteSuccessState());
    //   getOrderPermission();
    //
    //   Navigator.pop(context);
    // }).catchError((onError){
    //   emit( PermissionDeleteErrorState());
    // });

  }
  List<PermissionModel>listofpermis=[];
  List<PermissionModel>listOfPermisPending=[];
  List<PermissionModel>listOfPermisAccept=[];
  List<PermissionModel>listOfPermisNotAccept=[];
  getOrderPermissionSQL(){

    // var url = Uri.parse('https://sjeg.seongji-eg.com/getholidybycode.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'code':CacheHelper.getData(key: 'myId')})
        DioHelper.dio.post('getholidybycode.php',queryParameters:{'code':CacheHelper.getData(key: 'myId')} ).then((value) {

      if (value.statusCode == 200 ) {
        print('code= '+CacheHelper.getData(key: 'myId'));

        listofpermis=[];
        var res=json.decode(value.data);
        print(res);
        print(value.data);
        print(res.length);
        if(res.length>0){
          res.forEach((element){
            listofpermis.add(PermissionModel.fromJson(element));

          });
        }
        emit(PermissionGetSuccessState());

       // The response from PHP script
      }else  {print(value.data.trim());

      emit(PermissionGetSuccessState());
     // emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });


  }
  getOrderPermissionSQLByDepart(depart){
         listOfPermisPending=[];
         listOfPermisAccept=[];
         listOfPermisNotAccept=[];
    // var url = Uri.parse('https://sjeg.seongji-eg.com/getallholidays.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'depart':depart})
        DioHelper.dio.post('getallholidays.php',queryParameters: {'depart':depart}).then((value) {

      if (value.statusCode == 200 ) {

        var res=json.decode(value.data);
        if(res.length>0){
          res.forEach((element){

            if(element['state']=='pending'){
              listOfPermisPending.add(PermissionModel.fromJson(element));
            }else if(element['state']=='NotAccept'){
              listOfPermisNotAccept.add(PermissionModel.fromJson(element));
            }
            else if(element['state']=='Accept'){
              listOfPermisAccept.add(PermissionModel.fromJson(element));
            }




          });
        }
        emit(PermissionGetSuccessState());
        print(res.length); // The response from PHP script
      }else  {
        print(value.data.trim());
      emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });


  }
  getOrderPermissionSQLByDepartAndDate(date){
    listOfPermisPending=[];
    listOfPermisAccept=[];
    listOfPermisNotAccept=[];
    // var url = Uri.parse('https://sjeg.seongji-eg.com/getholidays_depart_date.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'depart':departvar,"date":date})
    DioHelper.dio.post('getholidays_depart_date.php',queryParameters: {'depart':departvar,"date":date} )  .then((value) {

      if (value.statusCode == 200 ) {


        var res=json.decode(value.data);
        if(res.length>0){
          res.forEach((element){

            if(element['state']=='pending'){
              listOfPermisPending.add(PermissionModel.fromJson(element));
            }else if(element['state']=='NotAccept'){
              listOfPermisNotAccept.add(PermissionModel.fromJson(element));
            }
            else if(element['state']=='Accept'){
              listOfPermisAccept.add(PermissionModel.fromJson(element));
            }




          });
        }
        emit(PermissionGetSuccessState());
        print(res.length); // The response from PHP script
      }else  {
        print(value.data.trim());
        emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionErrorState());
      print(onError.toString().trim());
    });


  }

  void getOrderPermission(){
    listofpermis=[];
    listOfPermisNotAccept=[];
    listOfPermisAccept=[];
    listOfPermisPending=[];
    // Firestore.instance
    //     .collection("Permission").orderBy('date').get().then((value) {
    //       print(value);
    //
    //       value.forEach((element) {
    //
    //      listofpermis.add(PermissionModel.fromJson(element.map));
    //      if(CacheHelper.getData(key: 'control')){
    //        // print(CacheHelper.getData(key: 'control'));
    //        // print(CacheHelper.getData(key: 'depart'));
    //      if(element.map['state']=='pending'&&element.map['depart']==CacheHelper.getData(key: 'depart')){
    //        listOfPermisPending.add(PermissionModel.fromJson(element.map));
    //
    //      }else if(element.map['state']=='Accept'&&element.map['depart']==CacheHelper.getData(key: 'depart')){
    //        listOfPermisAccept.add(PermissionModel.fromJson(element.map));
    //      }else if(element.map['state']=='NotAccept'&& element.map['depart']==CacheHelper.getData(key: 'depart')){
    //        listOfPermisNotAccept.add(PermissionModel.fromJson(element.map));
    //      }}
    //       });
    //
    //       emit(PermissionGetSuccessState());
    //       print(listofpermis[0].toMap());
    //
    //
    // }).catchError((onError){
    //   emit(PermissionGetErrorState());
    //
    // });

  }
  String departvar='';
  getDepart(val){
    departvar=val;
    getEmit();
  }
  void getEmit(){
    emit(EmitPermission() );
  }
  void EditPermissionSql(context,String code,String date,String state){
    // var url = Uri.parse('https://sjeg.seongji-eg.com/updateholiday.php');// Replace with your PHP script URL
    //
    // http.post(url,headers: {'Accept':'application/json'} ,
    //     body:  {'code':code,"date":date,"state":state})
    DioHelper.dio.post('updateholiday.php',queryParameters: {'code':code,"date":date,"state":state}).then((value) {

      if (value.statusCode == 200 ) {
        emit(PermissionUpdateSuccessState());
        getOrderPermissionSQLByDepart(departvar);
        //getOrderPermissionSQL();
       // Navigator.pop(context);

        print('**********EditPermissionSql***********'); // The response from PHP script
      }else  {print(value.data.trim());
      emit( PermissionErrorState());
      } //

    }).catchError((onError){
      emit( PermissionUpdateErrorState());
      print(onError.toString().trim());
    });
    // Firestore.instance
    //     .collection("Permission").document(id+date).update({'state':state.toString()}).then((value) {
    //  // emit(PermissionUpdateSuccessState());
    //   getOrderPermission();
    //
    //  // Navigator.pop(context);
    // }).catchError((onError){
    //   emit( PermissionUpdateErrorState());
    // });

  }
}