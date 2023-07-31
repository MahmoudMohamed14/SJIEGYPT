import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/moduls/addplan/getplan.dart';
import 'package:untitled/moduls/kittingScreen/kitting_screen.dart';
import 'package:untitled/shared/constant/color_manager.dart';
import 'package:untitled/shared/constant/test_styles_manager.dart';
import 'moduls/plan/cubit/cubit_plan.dart';
import 'moduls/plan/cubit/state_plan.dart';

class AddKitting extends StatelessWidget {

  String? date;
  String ?shift;
  AddKitting({this.date,this.shift});

  TextEditingController code=TextEditingController();
  TextEditingController ordertype=TextEditingController();
  TextEditingController bag=TextEditingController();
  TextEditingController capa=TextEditingController();
  var listOperator;

  var listId;

  @override
  Widget build(BuildContext context) {

    listOperator=["Manga","Yassmen","Shiamaa Shabaan","Diaa","A.Ashraf","M.Abd EL-Twab","Houda","Hamada","Rasha"];



    return BlocConsumer<PlanCubit,PlanStates>(
      listener: (context,state){
        // if (state is OredrTypeState){
        // //  ordertype.text=PlanCubit.get(context).ordertype!;
        //   bag.text=PlanCubit.get(context).qtybox != null ? PlanCubit.get(context).qtybox! :" " ;
        //  // capa.text=PlanCubit.get(context).capa!;
        // }

      },

    builder:(context,state){
        var cubit=PlanCubit.get(context);

      return Scaffold(
    appBar: AppBar(

      title: Text("Control"),
      actions: [
        // IconButton(onPressed: (){
        //    navigateTo(context, GetPlan  ());
        //     }, icon:Icon(Icons.navigate_next_sharp)),
        // TextButton(onPressed: (){
        //  cubit.getKittingComponant(code:cubit.code ,date: date,shift:  cubit.shift);
        //  cubit.show=false;
        //   print("######listofKitting#############");
        //   print(PlanCubit.get(context).listofkitting.length);
        //   print("######listofKittinglenth#############");
        //  cubit.anyChange=0;
        //
        //   navigateTo(context, KittingScreen(listpomModel: PlanCubit.get(context).listofkitting,date: date,));
        // }, child: Text("KittingScreen",style: TextStyle(color: ColorManager.darkPrimary),))
        //
    ],
    ),
      body: Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Container(
          height: 500,
          width: 300,
          child: Column(
          children: [

          //operator
    // Container(
    //   padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
    //   width: double.infinity,
    //   height: 60,
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       border: Border.all(color: ColorManager.primary)
    //
    //   ),
    //   child: DropdownButton(
    //
    //       isExpanded: true,
    //       iconSize: 40,
    //
    //
    //       value: PlanCubit.get(context).opreator,
    //
    //
    //       onChanged: ( String?value){
    //
    //         PlanCubit.get(context).radioButtonopreator(operatorv: value);
    //
    //       },
    //
    //       items:List.generate(listOperator.length, (index) =>   DropdownMenuItem<String>(child: Text(listOperator[index],style: getBoldStyle(color: ColorManager.primary,)),value: listOperator[index],))
    //   ),
    // ),
    //   const SizedBox(height: 20,),
     //line
            Text('Line',style: getBoldStyle(color: ColorManager.lightPrimary,fontSize: 18),),
    Container(
          padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorManager.primary)

          ),
          child: DropdownButton(

              isExpanded: true,
              iconSize: 40,


              value: PlanCubit.get(context).line,


              onChanged: ( String?value){

                PlanCubit.get(context).radioButtonLine(linev: value);
               // PlanCubit.get(context).getCodeForLine(value: value,);

              },

              items:List.generate(cubit.listoflineName.length, (index) =>   DropdownMenuItem<String>(child: Text(cubit.listoflineName[index],style: getBoldStyle(color: ColorManager.primary,)),value: cubit.listoflineName[index],))
          ),
    ),
    const SizedBox(height: 20,),
            Text('Code',style: getBoldStyle(color: ColorManager.lightPrimary,fontSize: 18),),
     //code
    Container(
          padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorManager.primary)

          ),
          child: DropdownButton(
            hint:const Text('code'),
              isExpanded: true,
              iconSize: 40,


              value:PlanCubit.get(context).code,


              onChanged: ( String?value){

               PlanCubit.get(context).radioButtonID(idv: value);
              // PlanCubit.get(context).orderType(code: value);


              },

              items: List.generate(PlanCubit.get(context).codefoechLine!.length, (index) =>   DropdownMenuItem<String>(child: Text(PlanCubit.get(context).codefoechLine![index],style: getBoldStyle(color: ColorManager.primary,)),value: PlanCubit.get(context).codefoechLine![index],))

          ),
    ),
    const SizedBox(height: 20,),
            Center(
              child: ElevatedButton(
                child: const Text("Next Page"),
                onPressed:(){
                  cubit.getKittingComponant(code:cubit.code ,date: date,shift:  cubit.shift);
                  cubit.show=false;
                  print("######listofKitting#############");
                  print(PlanCubit.get(context).listofkitting.length);
                  print("######listofKittinglenth#############");
                  cubit.anyChange=0;

                  navigateTo(context, KittingScreen(listpomModel: PlanCubit.get(context).listofkitting,date: date,emt: true,));






                },
              ),
            ),



    // SizedBox(height: 20,),
    // defaultEditText(control: code, label: "code", validat: (s){},onchange: (va){
    //   PlanCubit.get(context).orderType(code: va);
    //
    // }),
  //  const SizedBox(height: 10,),
    // defaultEditText(control: ordertype, label: "OrderType", validat: (s){}),
    // const SizedBox(height: 10,),
    // defaultEditText(control:bag, label: "QTYBox", validat: (s){}),
    // const SizedBox(height: 10,),
    // defaultEditText(control:capa, label: "Capa", validat: (s){}),



    ],
    ),
        ),
      ),
    ),
    );
    }

    );


  }
}




