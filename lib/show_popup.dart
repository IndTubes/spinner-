

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indtubes_1/resources/asset_constants.dart';
import 'package:indtubes_1/resources/color_constants.dart';
import 'package:indtubes_1/resources/material_button.dart';
import 'package:indtubes_1/spinner/widget/gif_asset.dart';
import 'package:indtubes_1/spinner/widget/popup_view.dart';
import 'package:indtubes_1/view_model/spinning_controller.dart';


class ShowMaterialPopup{



  static SnackbarController showTimerSnackBar(){
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final spinningController = Get.put(SpinningController());


   return   Get.showSnackbar(
         GetSnackBar(
           backgroundColor: Colors.transparent,
           snackPosition: SnackPosition.BOTTOM,
       messageText:   WillPopScope(
           onWillPop: ()async{
             return false ;
           },
           child:
           Padding(
             padding:  EdgeInsets.only(bottom: Get.height * .50),
             child: Container(
               decoration: BoxDecoration(
                   gradient: LinearGradient(
                       begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                       colors: [
                         Colors.white.withOpacity(0.8) ,
                         Colors.red.shade900,
                         Colors.red.shade900,
                         Colors.red.shade500,

                       ]
                   ),
                   border: Border.all(color: Colors.red),
                   borderRadius: BorderRadius.circular(10)
               ),


               child: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Obx(()
                     => Text("Next Spin ${spinningController.timerString.value}" , style:const  TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         fontSize: 20
                     )),
                     ),

                   ],
                 ),
               ),
             ),
           ) ,
       )
     ));


  }


  static showPopUp({ required BuildContext context ,required VoidCallback onTap }){

    AlertDialog alertDialog =  AlertDialog(
        contentPadding:const  EdgeInsets.only(bottom: 120),
        alignment: Alignment.center,
        elevation: 10,
        backgroundColor: Colors.transparent,
        content: WillPopScope(
            onWillPop: () async{

              return false ; },
            child: PopupView(onTap: onTap))
    );

    showGeneralDialog(
        context: context,
        transitionDuration: const Duration(seconds: 1),
        barrierDismissible: false,
        pageBuilder: (context , animation1 , animation2){

          return alertDialog ;
        });
  }
}