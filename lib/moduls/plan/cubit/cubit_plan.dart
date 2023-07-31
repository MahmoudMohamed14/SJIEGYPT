import 'package:bloc/bloc.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/model/codeModel.dart';
import 'package:untitled/model/kittingcomponanat.dart';
import 'package:untitled/model/planmodel.dart';
import 'package:untitled/model/pomModel.dart';
import 'package:untitled/model/qtyBoxModel.dart';

import 'package:untitled/moduls/plan/cubit/state_plan.dart';


class PlanCubit extends Cubit<PlanStates> {
  PlanCubit() : super(PlanInitState());
  static PlanCubit get(context) {
    return BlocProvider.of(context);
  }
  int anyChange=0;
  List<String>?codefoechLine=[" "];
  String? opreator = 'Manga';
  String? line = " ";
  String? code=' ';
  String? ordertype;
  String? qtybox;
  String? capa;
 List<String> listline=[" ","MH001","MH002","MH003","MH004","MH005","MH006","MH007","MH008","MH009","MH010","MH011",];
  List<String>  listline1=[" ","MH001",];
  List<String>  listline2=[" ","MH002",];
  List<String> listline3=[" ","MH003",];
  List<String>  listline4=[" ","MH004",];
  List<String>  listline5=[" ","MH005",];
  List<String> listline6=[" ","MH006",];
  List<String>  listline7=[" ","MH007",];
  List<String>  listline8=[" ","MH008",];
  List<String>  listline9=[" ","MH009",];
  List<String>  listline10=[" ","MH010",];
  List<String>  listline11=[" ","MH011",];


void orderType({code}){
  ordertype=orderTypemap[code];
  qtybox=qtyBoxMap[code];
  capa=capaMap[code];
  emit(OredrTypeState());
}

  List<String>listoflineName=[];
  PlanModel?planModel;

void getCodeForLine({value}) {

  codefoechLine=[];
  if (listofPlan.isNotEmpty) {
    listofPlan.forEach((element) {

      if (value == element.line) {


        codefoechLine!.add('${element.code}');

      }
    });
    emit(Test());
  }
}
  List<String> getlistofLine(){
    List<String>value;
    line = " ";
    listoflineName=[];
    if(CacheHelper.getData(key: 'line')=='Line1')
     value=listline1;
    else if(CacheHelper.getData(key: 'line')=='Line2')
      value=listline2;
    else if(CacheHelper.getData(key: 'line')=='Line3')
      value=listline3;
    else if(CacheHelper.getData(key: 'line')=='Line4')
      value=listline4;
    else if(CacheHelper.getData(key: 'line')=='Line5')
      value=listline5;
    else if(CacheHelper.getData(key: 'line')=='Line6')
      value=listline6;
    else if(CacheHelper.getData(key: 'line')=='Line7')
      value=listline7;
    else if(CacheHelper.getData(key: 'line')=='Line8')
      value=listline8;
    else if(CacheHelper.getData(key: 'line')=='Line9')
      value=listline9;
    else if(CacheHelper.getData(key: 'line')=='Line10')
      value=listline10;
    else if(CacheHelper.getData(key: 'line')=='Line11')
      value=listline11;
    else
      value=listline;
    value.forEach((element) {
      listoflineName.add(element);

    });
    print("###############LINE**********");
    print(value);
    print(listoflineName);

    emitPlan();
    return value;

  }


  void radioButtonopreator({operatorv}) {
    opreator = operatorv;
    emit(PlanchooseOperator());
  }
  void radioButtonLine({linev,nav=false}) {
    line = linev;
    codefoechLine=[" "];
    radioButtonID(idv: " ",nav: nav);

    if (listofPlan.isNotEmpty) {
      listofPlan.forEach((element) {
        if (linev == element.line) {
          codefoechLine!.add('${element.code}');
        }
      });

    }
    emit(PlanchooseLine());
  }
  String shift='Day1';
  List<String>shiftList=['Day1','Day2'];
  String date='';



  void radioButtonShift({sht}) {
    shift = sht;
    emit(ShiftState());
  }
  getplan({date,shift}){
    listofPlan=[];
    Firestore.instance
        .collection("plan")
        .document("${date}")
        .collection("DalyPlan")
        .document("${shift}")
        .get().then((value) {

          value.map['$shift'].forEach(( value) {
            listofPlan.add(PlanModel.fromJson(value));

          });
          print(listofPlan[1].operator);
          getlistofLine();
          emit(GetSuccessPlan());



    }).catchError((onError){});

  }
  List<KittingComponant>listMonitorCode=[];
  List<String>liststringcodeMonitor=[];
  List<String>liststringlineMonitor=[];
  getMonitorCode({date,shift}){
    listMonitorCode=[];
    liststringcodeMonitor=[];
    liststringlineMonitor=[];

    Firestore.instance
        .collection("plan")
        .document("${date}")

        .collection("${shift}").get().then((value) {
          value.forEach((element) {
          print("code=  "+element.id.substring(0,11));
          liststringcodeMonitor.add(element.id.substring(0,11));
          liststringlineMonitor.add(element.id.substring(11));

            listMonitorCode.add(KittingComponant.fromJson(element.map));

          });
          emit(GetKittingComponentListSuccess());

    }).catchError((onError){});

  }

  void radioButtonID({idv,bool nav=false}) {
   code = idv;
   if(nav){} else getKittingPlan(idv);
    // ordertype=orderTypemap[idv];
    // qtybox=qtyBoxMap[idv];
    // capa=capaMap[idv];
    emit(OredrTypeState());
   // emit(PlanchooseID());
  }
  CodeBoxModel? codeBoxModel;
 List<PomModel> listofkitting=[];
  List<bool>checkList1=[];
  List<bool>checkList2=[];
  CodeModel ?codeModel;


  List<TextEditingController>listcontrol=[];
  getKittingPlan  (codev)  {
    listofkitting=[];
    listcontrol=[];
     checkList1=[];
     checkList2=[];
     codeBoxModel=null;
    planModel=null;
    print("******listofkitting.length***** from function getKittingPlan ");
    print(codev);
    print(listofPom.length);
    listofPom.forEach((element) {
      if(element.parentCode==codev){
        listcontrol.add(TextEditingController());

         checkList1.add(false);
         checkList2.add(false);

        listofkitting.add(element);
        emit(GetCodeKittingPlan());

      }
    });
    listOfCodeMasterGl.forEach((element) {
      if(element.code==codev){

        codeModel=CodeModel.fromJson(element.toMap());
        print("code Model");
        print(element.code);
        print(element.capa);
        print(element.orderType);


      }
    });
    listofPlan.forEach((element) {
      if(codev==element.code&&line==element.line) planModel=PlanModel.fromJson(element.toMap());
    });
    listOfBoxGl.forEach((element) {
     if(codev==element.code) codeBoxModel=CodeBoxModel.fromJson(element.toMap());

    });
    print("******listofkitting.length***** from function on radio button");
    print(listofkitting.length);
    print("******listofkitting.length***** from function on radio button");

  }
  //comment to show all
  bool show=false;
//var myindex=0;
  showDescription({index}){
      show=!show;
      //comment to show all
     // myindex=index;
    emit(ShowDescription ());
  }
  emitPlan(){

    emit(EmitStatePlan());
  }

  setKittingComponant({date,shift,code, kitting}){
    Firestore.instance
        .collection("plan")
        .document("${date}")
        .collection("${shift}")
        .document("${code}").create(kitting).then((value) {
          emit(SetKittingComponantSuccess ());

    }).catchError((onError){});


  }
  Future waiting(int secnd) async {
    await Future.delayed(const Duration(seconds: 2));

  }

  int check2=0;
  int check1=0;
  KittingComponant kittingComponant=KittingComponant();
  getKittingComponant({date,shift,code}){
    check1=0;
    check2=0;
    Firestore.instance
        .collection("plan")
        .document("${date}")
        .collection("${shift}").document('${code}'+'${line}').get().then((value) {
      kittingComponant=KittingComponant.fromJson(value.map);
      value.map["listCheck1"].forEach((value) {
        if(value){}
        else{
          check1=1;


        }



      });
      value["listCheck2"].forEach((value) {
        if(value){}
        else{
          check2=1;
        }



      });
      print("#########################################");
      print(kittingComponant.toMap());
      print("#########################################");

      emit(GetKittingComponantSuccess());
    }).catchError((onError){
      print('getKittingComponant');
      print(onError.toString());
      emit(GetKittingComponantFailed());
    });



  }
  CollectionReference ?groceryCollection=  Firestore.instance.collection("plan");
  updateKittingComponent({date,cod,shift,listco,fdate,ldate,check1,check2,listch1,listch2}){

   groceryCollection!.document("${date}")
        .collection("${shift}")
        .document("${cod}${line}").update({
     "listComment": listco,
     "listCheck1":listch1,
     "listCheck2":listch2,
     "check1":check1,
     "check2":check2,
     "startTime":fdate,
     "endTime":ldate

   }).then((value) {
     anyChange=0;
     print("${date}");
     print("${shift}");
     print("${cod}");
   //  print("${key}");
   //  print("${valu}");
     getKittingComponant(date: date,shift: shift,code: cod);
     emit(UpdateKittingComponantSuccess ());



       //  getKittingComponant(date: date,shift: shift,code: cod);



    }).catchError((onError){});


  }



}