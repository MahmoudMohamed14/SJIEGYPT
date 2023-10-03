import 'dart:convert';
import 'dart:io';

// import 'package:csv/csv.dart';
// import 'package:file_picker/file_picker.dart';
//import 'package:firedart/firedart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';

import 'package:untitled/moduls/addPom/cubit/addPomStates.dart';


class AddPomCubit extends Cubit<AddPomStates> {
  AddPomCubit() : super(AddPomInitState());

  static AddPomCubit get(context) {
    return BlocProvider.of(context);
  }

  List<List<dynamic>> pomList = [];
  List<List<dynamic>> listcodeMaster = [];
  List<List<dynamic>> listBox = [];
  List<Map<String, dynamic>> listCodeMasterMap = [];
  List<Map<String, dynamic>> listBoxMab = [];
  List<Map<String, dynamic>> pomMap1 = [];
  List<Map<String, dynamic>> pomMap2 = [];
  String? filePath;
  String? filePathcode;
  String?filebox;

//   pickFile() async {
//     pomList = [];
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       print(result.files.first.name);
//       filePath = result.files.first.path!;
//
//       final input = File(filePath!).openRead();
//       final fields = await input
//           .transform(utf8.decoder)
//           .transform(const CsvToListConverter())
//           .toList();
//       pomList = fields;
//       print(fields.length);
//       pomMap1=[];
//       pomMap2=[];
//       listofPom=[];
//       for (int i = 0; i < 4000; i++) {
//         listofPom.add(PomModel(topModel: fields[i][0].toString().trim(),
//             parentCode: fields[i][1].toString().trim(),
//             objectDescription: fields[i][2].toString().trim(),
//             component: fields[i][3].toString().trim(),
//             qtyBase: fields[i][4].toString().trim()));
//         pomMap1.add(listofPom[i].toMap());
//       }
//       for (int i = 4000; i < fields.length; i++) {
//         listofPom.add(PomModel(topModel: fields[i][0].toString().trim(),
//             parentCode: fields[i][1].toString().trim(),
//             objectDescription: fields[i][2].toString().trim(),
//             component: fields[i][3].toString().trim(),
//             qtyBase: fields[i][4].toString().trim()));
//         pomMap2.add(listofPom[i].toMap());
//       }
//       print("pomMap1.length");
//       print(pomMap1.length);
//       print("pomMap1.length");
//       print(pomMap2.length);
//
//       emit(UploadPomSuccess());
//      // print(pomList);
//       PlatformFile file = result.files.first;
//
//       print(file.name);
//
//       print(file.size);
//       print(file.extension);
//       print(file.path);
//     }
//
//
//   else {
// // User canceled the picker
//   }
//
//
//   }

//   pickFilecode() async {
//     listCodeMasterMap= [];
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       print(result.files.first.name);
//       filePathcode = result.files.first.path!;
//
//       final input = File(filePathcode!).openRead();
//       final fields = await input
//           .transform(utf8.decoder)
//           .transform(const CsvToListConverter())
//           .toList();
//       listcodeMaster = fields;
//       print(fields.length);
//      // listCodeMasterMap=[];
//      // listOfCodeMasterGl=[];
//       for (int i = 0; i < fields.length; i++) {
//         listOfCodeMasterGl.add(CodeModel(code: fields[i][0].toString().trim(),
//             orderType: fields[i][1].toString().trim(),
//            bag: fields[i][2].toString().trim(),
//            capa: fields[i][3].toString().trim(),
//             check: fields[i][4].toString().trim()));
//        // listCodeMasterMap.add(  listOfCodeMasterGl[i].toMap());
//       }
//      // print(listCodeMasterMap.length);
//
//       emit(UploadCodeSuccess());
//       // print(pomList);
//       PlatformFile file = result.files.first;
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
//
//
//   }
//   pickBox() async {
//   //  listBoxMab= [];
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       print(result.files.first.name);
//       filebox = result.files.first.path!;
//
//       final input = File(filebox!).openRead();
//       final fields = await input
//           .transform(utf8.decoder)
//           .transform(const CsvToListConverter())
//           .toList();
//     listBox = fields;
//       print(fields.length);
//       // listCodeMasterMap=[];
//       // listOfCodeMasterGl=[];
//       for (int i = 0; i < fields.length; i++) {
//         listOfBoxGl.add(CodeBoxModel(code: fields[i][0].toString().trim(),
//             qtyBox : fields[i][1].toString().trim()));
//
//         // listCodeMasterMap.add(  listOfCodeMasterGl[i].toMap());
//       }
//       // print(listCodeMasterMap.length);
//
//       emit(UploadBoxSuccess());
//       // print(pomList);
//       PlatformFile file = result.files.first;
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
//
//
//   }
  void addPOm(){


    // for(int i=0;i<pomList.length;i++){
    //   listofPom.add(PomModel(topModel: pomList[i][0],parentCode:  pomList[i][1],objectDescription:  pomList[i][2],component:  pomList[i][3],qtyBase:pomList[i][4].toString() ));
     //  pomMap.add(listofPom[i].toMap());
    // }

      // Firestore.instance
      //     .collection("Pom").add({"map": pomMap1}).then((value) {
      //   Firestore.instance
      //       .collection("Pom").add({"map": pomMap2}).then((value) {
      //
      //     pomList=[];
      //     emit(UploadPomSuccess());
      //     getPom();
      //   }).catchError((onError){});
      //
      // }).catchError((onError){});







    // Firestore.instance
    //     .collection("Pom")
    //
    //     .add({"pom": pomMap})
    //     .then((value) {
    //
    //  pomList=[];
    //   emit(UploadPomSuccess());
    // }).catchError((onError){});

    //emit(AddToList());
  }

  void addCode(){
    listCodeMasterMap=[];
    listOfCodeMasterGl.forEach((element) {
      listCodeMasterMap.add(element.toMap());
    });


    // Firestore.instance
    //     .collection("code").document('newCode').update({'code': listCodeMasterMap}).then((value) {
    //   print("######conte###########");
    //   listcodeMaster=[];
    //   listCodeMasterMap=[];
    //   emit(UploadCodeSuccess());
    //   getcode();
    //
    //
    // }).catchError((onError){});
    //

  }
  void addBox(){
    listBoxMab=[];
    listOfBoxGl.forEach((element) {
      listBoxMab.add(element.toMap());
    });


    // Firestore.instance
    //     .collection("Box").document('newBox').update({'Box': listBoxMab}).then((value) {
    //   print("######conte###########");
    //   listBox=[];
    //   listBoxMab=[];
    //   emit(UploadBoxSuccess());
    //   getBox();
    //
    //
    // }).catchError((onError){});


  }

  getPom(){
    listofPom=[];
    // Firestore.instance
    //     .collection("Pom")
    //
    //     .get().then((value) {
    //   print("**********getPom value");
    //  // print( value.map["map"].length);
    //   value.forEach((element) {
    //     element.map["map"].forEach((element) {
    //
    //       listofPom.add(PomModel.fromJson(element));
    //
    //     });
    //   });
    //
    //   print("**********getPom listofPom");
    //   print(listofPom.length);
    //
    //   emit(GetPomSuccessState());
    //  // getPom();
    //
    //     // value.map["pom"].forEach(( value) {
    //     //   listofPom.add(PomModel.fromJson(value));
    //     //
    //     // });
    //
    //
    // }).catchError((onError){
    //
    // });
  }

  String shift='Day1';
  //List<String>shiftList=['Day1','Day2'];
  void radioButtonShift({sht}) {
    shift = sht;
  //  emit(ShiftSuccessState());
  }

  void emitstate(){
    emit(EmitState());
  }

  getUsers(){
    // listofUsers=[];
    // Firestore.instance
    //     .collection("user").get().then((value) {
    //       value.forEach((element) {
    //         listofUsers.add(UsersModel.fromJson(json:element.map));
    //       //  print();
    //
    //       });
    //       emit(GetUsersSuccess());
    //
    // }).catchError((onError){});

  }

  getcode(){
    // listOfCodeMasterGl=[];
    // Firestore.instance
    //     .collection("code").document('newCode').get().then((value) {
    //
    //
    //       value.map["code"].forEach((element) {
    //
    //         listOfCodeMasterGl.add(CodeModel.fromJson(element));
    //
    //   });
    //       emit(GetCodeSuccessState());
    //   print('###########getcode&&&&&&&&&&&&&&&&');
    //   print(value.map["code"].length);
    //   print(listOfCodeMasterGl.length);
    //   print('###########getcode&&&&&&&&&&&&&&&&');
    //
    // }).catchError((onError){});

  }
  getBox(){
    // listOfBoxGl=[];
    // Firestore.instance
    //     .collection("Box").document('newBox').get().then((value) {
    //
    //
    //   value.map["Box"].forEach((element) {
    //     listOfBoxGl.add(CodeBoxModel.fromJson(element));
    //
    //   });
    //   emit(GetBoxSuccessState());
    //   print('###########getBox&&&&&&&&&&&&&&&&');
    //   print(value.map["Box"].length);
    //   print(listOfBoxGl.length);
    //   print('###########getBox&&&&&&&&&&&&&&&&');
    //
    // }).catchError((onError){});

  }
  getAttendanceUser(){
    listOfAttenduserGl=[];
    // Firestore.instance
    //     .collection("userAttend").get().then((value) {
    //       print(value);
    //   value.forEach((element) {
    //     listOfAttenduserGl.add(element.map);
    //   });
    //  // print(listOfAttendGl);
    //   emit(GetAttendUserStateSuccess());
    // }).catchError((onError){
    //   print(onError.toString());
    // });




  }


}
