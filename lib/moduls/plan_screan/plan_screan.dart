import 'package:flutter/material.dart';
import 'package:untitled/shared/constant/test_styles_manager.dart';

class PlanScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(" Operator  ",style: getBoldStyle(color: Colors.black,fontSize: 18,height: 0)),
              Text(" Operator  ",style:getLightStyle(color: Colors.black)),

            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(" ID ",style: getBoldStyle(color: Colors.black,fontSize: 18,height: 0)),
              Text(" Operator  ",style:getLightStyle(color: Colors.black)),
              SizedBox(width: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(" Operator  ",style: getBoldStyle(color: Colors.black,fontSize: 18,height: 0)),
                  Text(" Operator  ",style:getLightStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(" LINE  ",style: getBoldStyle(color: Colors.black,fontSize: 18,height: 0)),
              Text(" Operator  ",style:getLightStyle(color: Colors.black)),
              SizedBox(width: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(" Operator  ",style: getBoldStyle(color: Colors.black,fontSize: 18,height: 0)),
                  Text(" Operator  ",style:getLightStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(" CODE  ",style: getBoldStyle(color: Colors.black,fontSize: 18,height: 0)),
              Text(" Operator  ",style:getLightStyle(color: Colors.black)),
              SizedBox(width: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(" Operator  ",style: getBoldStyle(color: Colors.black,fontSize: 18,height: 0)),
                  Text(" Operator  ",style:getLightStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

