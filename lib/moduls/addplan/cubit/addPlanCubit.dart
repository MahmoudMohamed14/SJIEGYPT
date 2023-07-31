import 'dart:convert';

import 'dart:io';

// import 'package:csv/csv.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/model/kittingcomponanat.dart';
import 'package:untitled/model/planmodel.dart';
import 'package:untitled/moduls/addplan/cubit/addPlanStates.dart';

class AddPlanCubit extends Cubit<AddPlanStates> {
  AddPlanCubit() : super(AddPlanInitState());

  static AddPlanCubit get(context) {
    return BlocProvider.of(context);
  }
  List<List<dynamic>> data = [];
  List<Map<dynamic,dynamic>> datamap = [];
  String? filePath;
//   pickFile() async {
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
//       data=fields;
//       emit(UploadPlanSuccess());
//       print(data);
//       PlatformFile file = result.files.first;
//
//       print(file.name);
// //print(file.bytes);
//       print(file.size);
//       print(file.extension);
//       print(file.path);
//     } else {
// // User canceled the picker
//     }
//
//   }

  void AddPlan({date,shift}){
    listofPlan=[];
    datamap=[];
    for(int i=1;i<data.length;i++){
      listofPlan.add(PlanModel(line: data[i][0].toString().trim(),operator:  data[i][1].toString().trim(),code:  data[i][2].toString().trim(),qty:  data[i][3].toString().trim()));
        datamap.add(listofPlan[i-1].toMap());
    }


   Firestore.instance
       .collection("plan")
       .document("${date}")
       .collection("DalyPlan")
       .document("${shift}")
       .set({"${shift}": datamap})
       .then((value) {
     setKittingComponant(date: date,shift: shift);


           emit(UploadPlanSuccess());
   }).catchError((onError){});



  }
  setKittingComponant({date,shift,}) {
    List<String>commentList1=[];
    List<bool>checkList2=[];
    List<bool>checkList1=[];
  data.forEach((element1) {
    commentList1=[];
      checkList1=[];
      checkList2=[];

      listofPom.forEach((element) {
        if(element1[2]==element.parentCode){
          commentList1.add(" ");
          checkList1.add(false);
          checkList2.add(false);

      }
      });
      if(element1[2]!='Code') {
        Firestore.instance
            .collection("plan")
            .document("${date}")
            .collection("${shift}")
            .document("${element1[2]}" + "${element1[0]}").set(KittingComponant(
            comment: "", startTime: " ", endTime: " ", listComment: commentList1,listCheck1: checkList1,listCheck2: checkList2)
            .toMap()).then((value) {
          emit(SetKittingComponantSuccessAdd());
        }).catchError((onError) {});
      }

    });



data.clear();
  }

  String shift='Day1';
  List<String>shiftList=['Day1','Day2'];
  void radioButtonShift({sht}) {
    shift = sht;
    emit(ShiftSuccessState());
  }
  edit({date,shift}){
    Firestore.instance
        .collection("plan")
        .document("${date}")
        .collection("DalyPlan")
        .document("${shift}")
        .update({"$shift.0.code":"test"})
        .then((value) {
          
    })
        .catchError((onError){});
  }
  void emitstate(){
    emit(EmitState());
  }
  getkittingplan({date,shift}){
    Firestore.instance
        .collection("plan")
        .document("${date}")
        .collection("DalyPlan")
        .document("${shift}")
        .get().then((value) {


    }).catchError((onError){});

  }
}
