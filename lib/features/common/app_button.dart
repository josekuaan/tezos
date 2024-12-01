import 'package:flutter/material.dart';

import 'app_enum.dart';
import 'color_constant.dart';

class AppButton {

  static Widget  plainButton(BuildContext context, {Function? apply,
    AppButtonState buttonState=AppButtonState.idle,
    required String name}){
    return ElevatedButton(
      onPressed:(){
        if(apply!=null){
          apply();
        }
      },
      style: ElevatedButton.styleFrom(
        // elevation: 5,

        padding: const EdgeInsets.symmetric( vertical: 14),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.5)),
        ),
        // maximumSize: Size(50, 50),

        backgroundColor: green,
      ),
      child:   Center(

        child:buttonState== AppButtonState.loading?const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(
              color: Colors.white54,
              strokeWidth: 2,
            )):
        Text(
          name,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }


}