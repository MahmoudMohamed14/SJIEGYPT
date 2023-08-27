import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/componant/local/cache_helper.dart';
import 'package:untitled/model/permissionModel.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';
import 'package:untitled/moduls/permisssion/permission_status.dart';

class LayoutPermission extends StatelessWidget {

  const LayoutPermission ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PermissionCubit, PermissionStates>(
      listener: (context, state) {},
      builder:(context, state) {
        var cubit = PermissionCubit.get(context);
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Holiday Status'),
              centerTitle: true,
              bottom: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),



                tabs: [Text('Pending ${cubit.listOfPermisPending.length}'),Text('Accept ${ cubit.listOfPermisAccept.length}'), Text('N.Accept ${cubit.listOfPermisNotAccept.length}')],),

            ),
            body:TabBarView(
          children: [
          ListView.separated(
          itemBuilder: (context,index)=> buildItemRequest(context,cubit.listOfPermisPending[index],false),
          separatorBuilder:(context,index)=>SizedBox(height: 20),
          itemCount: cubit.listOfPermisPending.length),
          ListView.separated(
          itemBuilder: (context,index)=> buildItemRequest(context,cubit.listOfPermisAccept[index],true),
          separatorBuilder:(context,index)=>SizedBox(height: 20),
          itemCount: cubit.listOfPermisAccept.length),
          ListView.separated(
          itemBuilder: (context,index)=> buildItemRequest(context,cubit.listOfPermisNotAccept[index],false,isNotAc: true),
          separatorBuilder:(context,index)=>SizedBox(height: 20),
          itemCount: cubit.listOfPermisNotAccept.length),
          ],
          ) ,
          ),
        );
      } ,
    );
  }
  Widget buildItemRequest(context,PermissionModel model,bool isPending,{bool isNotAc=false,}){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding:const EdgeInsets.all(10) ,

        decoration: BoxDecoration(

            borderRadius:BorderRadius.circular(20),
            color: Colors.grey.withOpacity(.3)


        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Holiday Request',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                SizedBox(width: 10,),
                Text('${model.reason}',),
              ],
            ),
            SizedBox(height: 10,),
            Text('${model.name} (${model.code}) request holiday for ${model.day} ${model.date}  '),
            SizedBox(height: 20,),
          CacheHelper.getData(key: 'depart')=='HR'? SizedBox():Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
             isNotAc? SizedBox() :Expanded(
                  child: defaultButton(onPress: () {
                    PermissionCubit.get(context).EditPermissionSql(context, model.code!
                        , model.date!
                        , 'NotAccept');


                  }, name: 'Deny', width: 80, height: 30,color: Colors.red),
                ),
                SizedBox(width: 10,),

                isPending?SizedBox() : Expanded(
                  child: defaultButton(onPress: () {
                    PermissionCubit.get(context).EditPermissionSql(context, model.code!
                        , model.date!
                        , 'Accept');

                  }, name: 'Agree', width: 80, height: 30,color: Colors.green),
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
}
