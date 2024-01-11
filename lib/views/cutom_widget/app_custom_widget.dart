import 'package:flutter/material.dart';

class AppCustomWidgt{
  static reusableRow({required String title , required int value}){
  return  Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(title),),
        Spacer(flex: 3,),
        Expanded(
          flex: 2,
          child: Text('$value'),),
      ],
    );
  }
}