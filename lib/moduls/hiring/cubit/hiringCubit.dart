

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/componant/remote/dioHelper.dart';
import 'package:untitled/model/hiringModel.dart';
import 'package:untitled/moduls/hiring/cubit/hiringStatus.dart';

class HiringCubit extends Cubit< HiringStates> {
  HiringCubit () : super(HiringInitState ());

  static HiringCubit  get(context) {
    return BlocProvider.of(context);
  }

  String? filePathHiring;
  List<HiringModel> hiringListModel=[];
  List<List<dynamic>> hiringList= [];
  pickFileHiring() async {

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       hiringList = [];
//       print(result.files.first.name);
//       filePathHiring = result.files.first.path!;
//
//       final input = File(filePathHiring!).openRead();
//       final fields = await input
//           .transform(utf8.decoder)
//           .transform(const CsvToListConverter())
//           .toList();
//       hiringList   = fields;
//       print(fields.length);
//       print( hiringList);
//
//       hiringListModel=[];
//
//       for (int i = 0; i <fields.length; i++) {
//
//         print(fields[i][1]);
//         hiringListModel.add(HiringModel(
//            english_name: fields[i][0].toString().trim(),
//            arabic_name: fields[i][1],
//           nId: fields[i][2].toString().trim(),
//            mother: fields[i][3],
//           mob_no: fields[i][4].toString(),
//            governerate: fields[i][5].toString(),
//           center: fields[i][6].toString(),
//           village: fields[i][7].toString(),
//           birth_date: fields[i][8].toString().trim(),
//           issuing_id: fields[i][9].toString().trim(),
//          expired_id: fields[i][10].toString().trim(),
//           social_insno: fields[i][11].toString().trim(),
//
//         ));
//       }
//
//
//       emit(FetchStateSuccess());
//       // print(pomList);
//       PlatformFile file = result.files.first;
//       print(hiringList.length);
//
//       print(file.name);
//
//       print(file.size);
//       print(file.extension);
//       print(file.path);
//     }
//
//
//     else {
// // User canceled the picker
//     }


  }
  String? filePathConfirm;
  List<HiringModel> confirmListModel=[];
  List<List<dynamic>> confirmList= [];
  pickFileConfirm() async {

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       confirmList = [];
//       print(result.files.first.name);
//       filePathConfirm= result.files.first.path!;
//
//       final input = File(filePathConfirm!).openRead();
//       final fields = await input
//           .transform(utf8.decoder)
//           .transform(const CsvToListConverter())
//           .toList();
//       confirmList   = fields;
//       print(fields.length);
//       print(confirmList.length);
//
//       confirmListModel=[];
//
//       for (int i = 0; i <fields.length; i++) {
//
//         print(fields[i][1]);
//         confirmListModel.add(HiringModel(
//           english_name: fields[i][0].toString().trim(),
//           arabic_name: fields[i][1],
//           nId: fields[i][2].toString().trim(),
//           mother: fields[i][3],
//           mob_no: fields[i][4].toString(),
//           governerate: fields[i][5].toString(),
//           center: fields[i][6].toString(),
//           village: fields[i][7].toString(),
//           birth_date: fields[i][8].toString().trim(),
//           issuing_id: fields[i][9].toString().trim(),
//           expired_id: fields[i][10].toString().trim(),
//           social_insno: fields[i][11].toString().trim(),
//
//         ));
//       }
//
//
//       emit(FetchStateSuccess());
//       // print(pomList);
//       PlatformFile file = result.files.first;
//       print(confirmList.length);
//
//       print(file.name);
//
//       print(file.size);
//       print(file.extension);
//       print(file.path);
//     }
//
//
//     else {
// // User canceled the picker
//     }


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
String messagesuccess='';
  Future uploadHiringSql()  async {
    //messagesuccess='';
    emit(HiringAddLoadingState());
    String errorString='';
    for(int i=0;i<hiringList.length;i++){
      try{

        Response response=await DioHelper.dio.post('hiring.php',queryParameters: hiringListModel[i].toMap());
        //print(response.data);
        if(response.statusCode==200){
          print(response.data);

        //
          if(i==hiringList.length-1){
            emit(HiringAddSuccessState());
            getAllHiring();
            hiringList.clear();
          }



          print("###############################");
          print(response.data);
          messagesuccess=response.data.toString();

        }else{
          print("${response.data+response.statusMessage}  data error");
        }
       // print("${response.data+response.statusMessage}  data error");
      }catch(  error)
      {
        // print("${response.data??"error"}");
        messagesuccess=error.toString();
        print(messagesuccess +' index ${i} ');
        //print("payupload "+;error.toString()+ "@@@@@@@");
        emit(HiringAddErrorState());

      }
    }




  }
  Future insertHiringSql(HiringModel model)  async {
    messagesuccess='';
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
          messagesuccess=response.data.toString();

        }else{
          print("${response.data+response.statusMessage}  data error");
        }
        print("${response.data+response.statusMessage}  data error");
      }catch(error){
       // print("${response.data??"error"}");
       messagesuccess=error.toString();
       print(messagesuccess+'hier hir ');
        //print("payupload "+;error.toString()+ "@@@@@@@");
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
  String typeOfAccountHiring='';
  int numOfWork=0;
  int numOfEndWork=0;
  int numOfReject=0;
  int  numOfConfirm=0;
  int numOfWait=0;

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
       numOfWork=0;
       numOfEndWork=0;
       numOfReject=0;
       numOfConfirm=0;
        numOfWait=0;
        res.forEach((element){
          if(element['startdate'].toString().isNotEmpty&&element['enddate'].toString().isEmpty)numOfWork+=1;
          if(element['startdate'].toString().isNotEmpty&&element['enddate'].toString().isNotEmpty)numOfEndWork+=1;
          if(element['confirm'].toString()=='no'&&element['startdate'].toString().isEmpty&&element['enddate'].toString().isEmpty)numOfReject+=1;
          if(element['startdate'].toString().isEmpty&&element['enddate'].toString().isEmpty&&element['confirm'].toString()=='ok')numOfConfirm+=1;
          if(element['startdate'].toString().isEmpty&&element['enddate'].toString().isEmpty&&element['confirm'].toString().isEmpty)numOfWait+=1;
          listAllHiring.add(HiringModel.FromJson(element));
          //myDepartList.add(element['depart']);
        });

        emit(HiringGetSuccessState());
        getMyList();

      }

      print(response.statusCode);

    } else {print('Get All Data Error: ${response.data}');}
    }catch(onError){
      emit(HiringGetErrorState());

      print('Get All Data Error: ${onError.toString()}');
      print(onError);
    }

  }

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
    messagesuccess='';

    emit(HiringUpdateLoadingState());


    try{
      Response response=await DioHelper.dio.post('edithiring.php',options: Options(
          headers: {
            "accept":"*/*",
          }
      ),queryParameters: hiringModelEdit.toMap());
      if(response.statusCode==200){
       // print(i);
        // valuepross=(i+1)/suddenNormalList.length*100;
        //getEmit();

        print("###############################");
        print(response.data);
        messagesuccess=response.data.toString();
        // if(valuepross.toInt()==100){
        //   suddenNormalList.clear();
        //   emit(UpdateSuddenNormalSQLSuccessState());
        // }

          emit(HiringUpdateSuccessState());

       // Navigator.of(context).pop(true);

          getAllHiring();
          onSelectAll(false);

      }
    }catch(error){
      messagesuccess=error.toString();
      print("edit allHiring "+error.toString());
      emit(HiringUpdateErrorState());

    }



  }



 List <HiringModel>listOfSearch=[];
  List <HiringModel>listOfExcel=[];
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
      if(CacheHelper.getData(key: 'controller')=='safety'||typeOfAccountHiring!="hiring"){
        if((element.startdate!.isNotEmpty&&element.enddate!.isEmpty)&&(typeOfAccountHiring=="workdata"||typeOfAccountHiring=="document"||typeOfAccountHiring=="safety"||CacheHelper.getData(key: 'controller')=='safety'))listModelHiring.add(element);
        else if(element.startdate!.isNotEmpty&&element.enddate!.isNotEmpty&&typeOfAccountHiring=="endwork")listModelHiring.add(element);


      }

     else if(element.startdate!.isEmpty&&typeOfAccountHiring=="hiring"){
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
    listOfExcel=[];
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
  listOfExcel=  listOfSearch.isNotEmpty?listOfSearch:listModelHiring;

      for(int i=0;i<=selectedNID.length;i++){

        if(i==0){
          sheet.getRangeByName('A1').setText('English Name');
          sheet.getRangeByName('B1').setText('Arabic Name');
          sheet.getRangeByName('C1').setText('NID');
          sheet.getRangeByName('D1').setText("Mother's Name");
          sheet.getRangeByName('E1').setText('Mobile No.');
          sheet.getRangeByName('F1').setText('governerate');
          sheet.getRangeByName('G1').setText('center');
          sheet.getRangeByName('H1').setText('village');
          sheet.getRangeByName('I1').setText('Birth Date');
          sheet.getRangeByName('J1').setText('Issuing Id');
          sheet.getRangeByName('K1').setText('Expired Id');
          sheet.getRangeByName('L1').setText('Social Ins no');
        }
        else{

          listModelHiring.forEach((element) {
            if(element.nId==selectedNID[i-1]){
              sheet.getRangeByName('A${i+1}').setText('${element.english_name}');
              sheet.getRangeByName('B${i+1}').setText('${element.arabic_name}');
              sheet.getRangeByName('C${i+1}').setText('${element.nId}');
              sheet.getRangeByName('D${i+1}').setText('${element.mother}');
              sheet.getRangeByName('E${i+1}').setText('${element.mob_no}');
              sheet.getRangeByName('F${i+1}').setText('${element.governerate}');
              sheet.getRangeByName('G${i+1}').setText('${element.center}');
              sheet.getRangeByName('H${i+1}').setText('${element.village}');
              sheet.getRangeByName('I${i+1}').setText('${element.birth_date}');
              sheet.getRangeByName('J${i+1}').setText('${element.issuing_id}');
              sheet.getRangeByName('K${i+1}').setText('${element.expired_id}');
              sheet.getRangeByName('L${i+1}').setText('${element.social_insno}');

            }
          }
          );


        }





    }

    final List<int> bytes = workbook.saveAsStream();
    // workbook.dispose();
    //
    //
    //   final String path = ( await getDownloadsDirectory())!.path;
    //   final String fileName = '$path\\Output.xlsx' ;
    //   final File file = File(fileName);
    //   await file.writeAsBytes(bytes, flush: true);
    //   OpenFile.open(fileName);

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

