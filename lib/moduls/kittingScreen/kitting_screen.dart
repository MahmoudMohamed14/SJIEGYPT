
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/home.dart';
import 'package:untitled/model/pomModel.dart';
import 'package:untitled/moduls/plan/cubit/cubit_plan.dart';
import 'package:untitled/moduls/plan/cubit/state_plan.dart';
import 'package:untitled/shared/constant/color_manager.dart';

class KittingScreen extends StatelessWidget {
  // TextEditingController startTimeControl=TextEditingController();
  // TextEditingController endTimeControl=TextEditingController();
  // TextEditingController operator=TextEditingController();
  String startTime="";
  String endTime="";
 bool emt=false;
  //int anyChange=0;

List<PomModel> ?listpomModel=[];

String?date;

   KittingScreen({this.listpomModel,this.date,required this.emt});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlanCubit,PlanStates>(
          listener: (context,state){
            if(state is GetKittingComponantSuccess )
              PlanCubit.get(context).emitPlan();

          },
          builder:(context,state){
           var cubit=PlanCubit.get(context);
           cubit.waiting(10).then((value) {

           });

          // operator.text="Mahmoud";

            return Scaffold(
              appBar: AppBar(
                leading: IconButton(onPressed: (){

                  Navigator.pop(context);
                  cubit.codeModel=null;
                  cubit.radioButtonLine(linev: " ",nav: true);
                 // navigateTo(context, AddKitting());
                }, icon: Icon(Icons.arrow_back)),
                title: Text("Accessory KITTING LIST"),
                actions: [

              cubit.anyChange>0?  TextButton(onPressed: (){
                    cubit.check1=0;
                    cubit.checkList1.forEach((element) {
                      if(element){}else cubit.check1=1;
                    });

                    cubit.checkList2.forEach((element) {
                      if(element){}else cubit.check2=1;
                    });

                    PlanCubit.get(context).updateKittingComponent(
                        cod: listpomModel![0].parentCode,
                        date: date,
                        shift: PlanCubit.get(context).shift,
                        listco: cubit.kittingComponant.listComment,
                        fdate: cubit.kittingComponant.startTime,
                        ldate:cubit.kittingComponant.endTime,
                        check1: cubit.check1>0?false:true,
                        check2: cubit.check2>0?false:true,
                        listch1: cubit.checkList1,
                        listch2: cubit.checkList2
                    );
                  // cubit.getKittingComponant(shift: PlanCubit.get(context).shift,date: date,code: listpomModel![0].parentCode);

                  }, child: Text("Save",style: TextStyle(color: ColorManager.lightPrimary),)):SizedBox()
                ],
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,

                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [

                      Row(
                        children: [
                          //startTime
                          Column(
                            children: [
                              Text('StartTime'),
                              GestureDetector(
                                onTap: (){
                                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                                      .then((value) {
                                    if(value !=null){
                                      cubit.kittingComponant.startTime = value.format(context).toString();
                                      cubit.anyChange=1;
                                      cubit.emitPlan();
                                    }
                                  });

                                },
                                child: Container(
                                  width:100,
                                  height: 30,
                                  child: Center(child: Text("${cubit.kittingComponant.startTime}")),
                                  decoration:BoxDecoration(
                                    //  shape: BoxShape.circle,
                                      border: Border.all(width: 1.5,color: ColorManager.darkPrimary)
                                  ) ,

                                ),
                              ),
                            ],
                          ),

                          SizedBox(width: 10,),
                          //endTime
                          Column(
                            children: [
                              Text('EndTime'),
                              GestureDetector(
                                onTap: (){
                                  if(cubit.check1==0 && cubit.check2==0)
                                    showTimePicker(context: context, initialTime: TimeOfDay.now())
                                        .then((value) {
                                      if(value !=null) {
                                        cubit.kittingComponant.endTime=value.format(context).toString();
                                        cubit.anyChange=1;
                                        cubit.emitPlan();}
                                    });

                                },
                                child: Container(
                                  width:100,
                                  height: 30,
                                  child: Center(child: Text("${cubit.kittingComponant.endTime}")),
                                  decoration:BoxDecoration(
                                    //  shape: BoxShape.circle,
                                      border: Border.all(width: 1.5,color: ColorManager.darkPrimary)
                                  ) ,

                                ),
                              ),
                            ],
                          ),


                          SizedBox(width: 10,),
                          //operator

                          Column(
                            children: [
                              Text('Operator'),
                              Container(
                                width:150,
                                height: 30,
                                child: Center(child: Text('${cubit.planModel?.operator}')),
                                decoration:BoxDecoration(
                                  //  shape: BoxShape.circle,
                                    border: Border.all(width: 1.5,color: ColorManager.darkPrimary)
                                ) ,

                              ),
                            ],
                          ),
                          const SizedBox(width: 10,),
                          //line

                          Column(
                            children: [
                              Text('Line'),
                              Container(
                                width:100,
                                height: 30,
                                child: Center(child: Text('${cubit.planModel?.line}')),
                                decoration:BoxDecoration(
                                  //  shape: BoxShape.circle,
                                    border: Border.all(width: 1.5,color: ColorManager.darkPrimary)
                                ) ,

                              ),
                            ],
                          ),
                          const SizedBox(width: 10,),

                          //orderType
                          Column(
                            children: [
                              const Text('OrderType'),
                              Container(
                                width:100,
                                height: 30,
                                child: Center(child: Text('${cubit.codeModel?.orderType}')),
                                decoration:BoxDecoration(
                                  //  shape: BoxShape.circle,
                                    border: Border.all(width: 1.5,color: ColorManager.darkPrimary)
                                ) ,

                              ),
                            ],
                          ),
                          const SizedBox(width: 10,),

                          //Capa
                          Column(
                            children: [
                              const Text('Capa'),
                              Container(
                                width:40,
                                height: 40,
                                child: Center(child: Text('${cubit.codeModel?.capa}')),
                                decoration:BoxDecoration(
                                  //borderRadius: BorderRadius.circular(30),

                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1.5,color: ColorManager.darkPrimary)
                                ) ,

                              ),
                            ],
                          ),
                          const SizedBox(width: 10,),

                          //qty
                          Column(
                            children: [
                              const Text('QTY'),
                              Container(
                                width:40,
                                height: 40,
                                child: Center(child: Text('${cubit.planModel?.qty}')),
                                decoration:BoxDecoration(
                                  //borderRadius: BorderRadius.circular(30),

                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1.5,color: ColorManager.darkPrimary)
                                ) ,

                              ),
                            ],
                          ),
                          const SizedBox(width: 10,),

                          //qty
                          Column(
                            children: [
                              const Text('BoxQTY'),
                              Container(
                                width:40,
                                height: 40,
                                child: Center(child: Text('${cubit.codeBoxModel?.qtyBox}')),
                                decoration:BoxDecoration(
                                  //borderRadius: BorderRadius.circular(30),

                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1.5,color: ColorManager.darkPrimary)
                                ) ,

                              ),
                            ],
                          ),


                        ],
                      ),
                     Column(
                       children:List<Widget>.generate(listpomModel!.length, (index) =>   kittingDesgin(listpomModel![index],index,context,cubit.planModel?.qty)),
                     )

                      // ListView.builder(
                      //  // primary: false,
                      //   shrinkWrap: true,
                      //   itemBuilder: (context,i)=>Text('test'),itemCount: 10,)

                      // ListView.separated(
                      //   scrollDirection: Axis.vertical,
                      //
                      //   physics: BouncingScrollPhysics(),
                      //  // primary: true,
                      //
                      //
                      //
                      //  // shrinkWrap: true,
                      //
                      //
                      //   itemBuilder: (context,index)=> kittingDesgin(listpomModel![index],index,context,cubit.planModel?.qty),
                      //   separatorBuilder:(context,index)=>SizedBox(height: 15,) ,
                      //   itemCount:listpomModel!.length,
                      // ),
                    ],
                  ),
                ),
              ),
            );
          } ,

        );
  }


  Widget kittingDesgin(PomModel pomModel,index,context,qty){
    var cubit=PlanCubit.get(context);

    cubit. waiting(2).then((value) {
     cubit.listcontrol[index].text= cubit.kittingComponant.listComment![index??0]??"?";
      cubit.checkList1[index]=cubit.kittingComponant.listCheck1![index];
      cubit.checkList2[index]=cubit.kittingComponant.listCheck2![index];
      if(emt)cubit.emitPlan();
      if(cubit.checkList2.length-1==index)emt=false;

    });



   // bool show=false;
    return GestureDetector(
      onTap: (){

        PlanCubit.get(context).showDescription(index: index);
      },
      child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      index==0?Row(
      children:  [
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
      Text("Top Model"),
      SizedBox(height:5 ,),
      Text("${pomModel.topModel}"),
      ],
      ),
      SizedBox(width: 10,),
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
      Text("Parent Code"),
        SizedBox(height:5 ,),
      Text("${pomModel.parentCode}"),
      ],
      ),
        SizedBox(width: 10,),
        Container(
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: Text("Object description")),
              SizedBox(height:5 ,),
              Text("${pomModel.objectDescription}"),
            ],
          ),
        ),
      SizedBox(width: 10,),
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
      Text("Component"),
        SizedBox(height:5 ,),
      Text("${pomModel.component}"),
      ],
      ),
      
      SizedBox(width: 10,),
      Container(
        width: 60,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
        Text("Qty(Base)"),
          SizedBox(height:5 ,),
          Center(child: Text("${pomModel.qtyBase}")),
        ],
        ),
      ),
      SizedBox(width: 10,),
      Container(
        width: 50,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
        Text("Check"),
          SizedBox(height:5 ,),

          Center(child: Text("${int.parse(pomModel.qtyBase!) *int.parse(qty) }")),
        ],
        ),
      ),
      SizedBox(width: 10,),


     cubit.kittingComponant.check1 == false? Column(

      mainAxisSize: MainAxisSize.min,
      children: [
      Text("Check1"),
      Center(
        child: Checkbox(value:cubit.checkList1[index], onChanged:(x){
         PlanCubit.get(context).kittingComponant.listCheck1![index]=x;
         cubit. checkList1[index]=x!;
         cubit.anyChange=1;


          PlanCubit.get(context).emitPlan();
          print(cubit.kittingComponant.listCheck1);
        }),
      ),
      ],
      )
     : Column(

       mainAxisSize: MainAxisSize.min,
       children: [
       Text("Check2"),
       Center(
         child: Checkbox(value:cubit.checkList2[index], onChanged:(x){
           cubit.kittingComponant.listCheck2![index]=x!;
          cubit. checkList2[index]=x;
           cubit.anyChange=1;
           // PlanCubit.get(context).updateKittingComponent(
           //     code: PlanCubit.get(context).code,
           //     date: PlanCubit.get(context).date,
           //     shift: PlanCubit.get(context).shift,
           //     value: checklist2,
           //     key: "check2"
           //
           // );
           PlanCubit.get(context).emitPlan();
          // print(checklist2);


      }),
       ),
      ],
      ),

      ],) : Row(
      children:  [
        Text("${pomModel.topModel}"),
        SizedBox(width: 10,),
        Text("${pomModel.parentCode}"),
        SizedBox(width: 10,),
        Container(
          width: 350,
            child: Text("${pomModel.objectDescription}")),
        SizedBox(width: 10,),
        Text("${pomModel.component}"),
        SizedBox(width: 10,),
        Container(
          width: 60,
            child: Center(child: Text("${pomModel.qtyBase}"))),
        SizedBox(width: 10,),
        Container(
          width: 50,
            child: Center(child: Text("${int.parse(pomModel.qtyBase!)*int.parse(qty)}"))), SizedBox(width: 20,),
        cubit.kittingComponant.check1 == false?  Center(
          child: Checkbox(value:cubit.checkList1[index], onChanged:(x){
          cubit.kittingComponant.listCheck1![index]=x!;
       cubit. checkList1[index]=x;
          print(cubit.checkList1);
          cubit.anyChange=1;
          PlanCubit.get(context).emitPlan();


      }),
        ):
        Center(
          child: Checkbox(value:cubit.checkList2[index], onChanged:(x){
          cubit.kittingComponant.listCheck2![index]=x!;
       cubit.checkList2[index]=x;
          cubit.anyChange=1;
          PlanCubit.get(context).emitPlan();
          print(cubit.checkList2);







      }),
        )








      ],),
      // SizedBox(height: 5,),
        // //comment to show all
     //  index == PlanCubit.get(context).myindex?
       PlanCubit.get(context).show?
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           height: 30,
           width: 300,
           child: Row(
             mainAxisSize: MainAxisSize.min,
            children: [
             // Text("Object description: ",style: TextStyle(color: Colors.black45),),


              Expanded(
                child: defaultEditText(label: 'label',control:PlanCubit.get(context).listcontrol[index]
                  ,onchange: (value){
                      cubit.anyChange=1;
                  PlanCubit.get(context).kittingComponant.listComment![index]=value;
                  print( PlanCubit.get(context).kittingComponant.listComment![index]);
                 // cubit.emitPlan();



                })
              )
            ],

      ),
         ),
       ):SizedBox() //comment to show all //:SizedBox(),

      ],
      ),
    );
}
}
