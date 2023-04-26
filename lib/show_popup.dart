

import 'package:flutter/material.dart';
import 'package:indtubes_1/resources/asset_constants.dart';
import 'package:indtubes_1/resources/color_constants.dart';
import 'package:indtubes_1/resources/material_button.dart';
import 'package:indtubes_1/spinner/widget/gif_asset.dart';


class ShowMaterialPopup{

  static showPopup({required  BuildContext context , required VoidCallback onTap  }){
    AlertDialog alertDialog = AlertDialog(
     backgroundColor: Colors.transparent,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                transformAlignment: Alignment.topCenter,
                padding: const EdgeInsets.all(6),
                decoration:  BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.redAccent , Colors.black
                    ]
                  ),
                  border: Border.all(color: Colors.white  , width: 2),
                    color: Colors.red, shape: BoxShape.circle),
                child: const Icon(Icons.close , color: Colors.white, )),
          ),
          const SizedBox(height: 5,),
          Container(
            transformAlignment: Alignment.topCenter,
            decoration: BoxDecoration(
              gradient:const  LinearGradient(
                  begin:Alignment.bottomLeft ,
                  end: Alignment.topRight,
                  colors: [ColorConstants.bgWallet , Colors.black]
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [ BoxShadow(color: Colors.yellowAccent , blurRadius: 10 , spreadRadius: 4)],
            ),

            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Are you Ready to Collect coins ?" ,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                  const SizedBox(height:10.0 ,)  ,
                  Row(       mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:const  [
                      SizedBox(
                        width: 20,
                          height: 20,
                          child: Image(
         image: AssetImage(AssetConstants.icGifCoin) ,
         ),),
                      SizedBox(
                          width: 20,
                          height: 20,
                          child: Image(
         image: AssetImage(AssetConstants.icGifCoin) ,
         ),),
                      SizedBox(
                          width: 20,
                          height: 20,
                          child: Image(
         image: AssetImage(AssetConstants.icGifCoin) ,
         ),),
                    ],
                  ),
                  const SizedBox(height: 20.0,) ,
                  MaterialButtons(text: "OK", onTap: onTap,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
    showGeneralDialog(
    barrierColor: Colors.transparent,
    barrierDismissible: true,
    barrierLabel: "Wheel Popup",
    transitionDuration: const Duration(milliseconds: 150),
    context: context, pageBuilder: (BuildContext context , Animation<double> animation1 , Animation<double> animation2){
      return alertDialog ;
    });

  }
}