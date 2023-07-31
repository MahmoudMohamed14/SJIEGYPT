import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/componant/componant.dart';
import 'package:untitled/moduls/permisssion/permission_cubit.dart';
import 'package:untitled/moduls/permisssion/permission_status.dart';

class PendingRequest extends StatelessWidget {

  const PendingRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PermissionCubit, PermissionStates>(
        listener: (context, state) {},
      builder:(context, state) {
        var cubit = PermissionCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                itemCount:cubit.listOfPermisPending.length,

                itemBuilder: (context,index)=>Container(
                  padding:const EdgeInsets.all(10) ,

                  decoration: BoxDecoration(

                    borderRadius:BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(.3)


                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Text('Holiday Request',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                      SizedBox(height: 10,),
                      Text('${cubit.listOfPermisPending[index].name} request holiday for ${cubit.listOfPermisPending[index].day} ${cubit.listOfPermisPending[index].date}  '),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Expanded(
                            child: defaultButton(onPress: () {
                              cubit.EditPermission(context, cubit.listOfPermisPending[index].id!
                                  , cubit.listOfPermisPending[index].date!
                                  , 'NotAccept');


                            }, name: 'Deny', width: 80, height: 30,color: Colors.red),
                          ),
                          SizedBox(width: 10,),

                          Expanded(
                            child: defaultButton(onPress: () {
                              cubit.EditPermission(context, cubit.listOfPermisPending[index].id!
                                  , cubit.listOfPermisPending[index].date!
                                  , 'Accept');

                            }, name: 'Agree', width: 80, height: 30,color: Colors.green),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
                separatorBuilder: (context,index)=>SizedBox(height: 20,),
              ),
            ),
          );
      } ,
    );
  }
}
