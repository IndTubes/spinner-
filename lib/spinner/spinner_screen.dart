import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:indtubes_1/resources/asset_constants.dart';
import 'package:indtubes_1/show_popup.dart';
import 'package:indtubes_1/spinner/widget/gif_asset.dart';
import 'package:indtubes_1/view_model/spinning_controller.dart';
import '../resources/color_constants.dart';
import 'widget/loader.dart';


class SpinnerScreen extends StatelessWidget {
   SpinnerScreen({Key? key}) : super(key: key);

  final spinningController = Get.put(SpinningController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetConstants.bg), fit: BoxFit.cover)),
        child: gameContent(context)
      ),
    );

  }

   Widget gameContent(BuildContext context) => Padding(
     padding: EdgeInsets.only(left: 14.0, right: 14,top: 24 , bottom: 8),
     child: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
            SizedBox(height: Get.height *.09),
           InkWell(
             onTap: () {
               Timer(Duration(seconds: spinningController.delayTimeInSecond), () {
                 ShowMaterialPopup.showPopup(context: context ,onTap:()async{
                   debugPrint("Before create Rewarded");
                 await spinningController.createRewardedAd();
                   debugPrint("After create Rewarded");
                   Navigator.pop(context);
                   spinningController.isAdShown.value = true ;


                 } );
               });
               if (!spinningController.spinning) {
                 spinningController. spin();
               }
             },
             child: Obx(
                 ()=> Stack(alignment: Alignment.center, children: [
                 gameBelt(),
                 gameWheel(),
                 SizedBox(
                     width: Get.width * .18,
                     child: Image.asset(AssetConstants.icSpin)),
                 spinningController.isAdShown.value?  Loader():Offstage()
               ]),
             ),
           ),
           SizedBox(
             height: Get.height * .10,
           ),
           goldenBox,
        //   walletManagement(),
           SizedBox(
             height: Get.height * .10,
           ),
         ],
       ),
     ),
   );

   Widget  gameBelt() =>
       SizedBox(width: Get.width, child: Image.asset(AssetConstants.icBelt));

   Widget  gameWheel() => Padding(
     padding: const EdgeInsets.only(top: 20.0 , left: 5),
     child: AnimatedBuilder(
       animation: spinningController.animation,
       builder: (context, child) {
         return Transform.rotate(
             angle: spinningController.animationController.value * spinningController.angle,
             child: SizedBox(
               width: Get.width * .80,
               child: Image.asset(AssetConstants.icWheel),
             ));
       },
     ),
   );

   Widget  walletManagement() => Container(
       width: Get.width * .90,
       decoration: BoxDecoration(
           gradient: const LinearGradient(
               begin: Alignment.bottomLeft,
               end: Alignment.topRight,
               colors: [ColorConstants.bgWallet, Colors.black]),
           borderRadius: BorderRadius.circular(10),
           boxShadow: const [
             BoxShadow(
                 color: Colors.yellowAccent, spreadRadius: 4, blurRadius: 3)
           ]),
       child: GetBuilder<SpinningController>(
         builder: (controller) {
           return Table(
             border: TableBorder.all(
                 color: ColorConstants.bgWallet,
                 borderRadius: BorderRadius.circular(10)),
             children: [
               TableRow(children: [
                 _titleColumn("Earned"),
                 _titleColumn("Earning"),
                 _titleColumn("Spins"),
               ]),
               TableRow(children: [
                 _valueColumn(controller.earnedValue),
                 _valueColumn(controller.totalEarnings),
                 _valueColumn(controller.spins),
               ])
             ],
           );
         }
       ),
   );

   Widget get  goldenBox =>  const  SizedBox(
       width: 150,
       height: 150,
       child:    Image(
         image: AssetImage(AssetConstants.icGifGoldBox) ,
         ),
   );
   Widget _titleColumn(var title) {
     return Padding(
       padding: const EdgeInsets.all(15.0),
       child: Text(
         title.toString(),
         style:const  TextStyle(
             color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
       ),
     );
   }

   Widget _valueColumn(var value) {
     return Padding(
       padding: const EdgeInsets.all(15.0),
       child: Text(
         value.toString(),
         style: const TextStyle(
           color: Colors.white,
           fontWeight: FontWeight.w500,
           fontSize: 16,
         ),
       ),
     );
   }

}



