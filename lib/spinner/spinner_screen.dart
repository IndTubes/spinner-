import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:indtubes_1/resources/asset_constants.dart';
import 'package:indtubes_1/resources/material_button.dart';
import 'package:indtubes_1/routes/route_constants.dart';
import 'package:indtubes_1/show_popup.dart';
import 'package:indtubes_1/spinner/widget/control_button.dart';
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
          child: gameContent(context)),
    );
  }

  Widget gameContent(BuildContext context) => Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                   Align(
                     alignment: Alignment.topLeft,
                     child: Container(
                       decoration: BoxDecoration(
                         color: Colors.black.withOpacity(0.2)
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(
                               child: ControlButtons(spinningController.player )),
                           MaterialButtons( fontSize: 14 , text: "Rewards", onTap: (){
                               Get.toNamed(RouteConstants.rewardRoute);
                             },)

                         ],
                       ),
                     ),
                   ),
            SizedBox(height: Get.height * .05),
            Obx(
              () => Stack(alignment: Alignment.center, children: [
                gameBelt(),
                gameWheel(),
                InkWell(
                  onTap: (){
                    if(spinningController.isPopupComing.value){
                      spinningController.isPopupComing.value = false ;
                      Timer(Duration(seconds: spinningController.delayTimeInSecond),
                              () {
                            ShowMaterialPopup.showPopup(
                                context: context,
                                onTap: () async {
                                  debugPrint("Before create Rewarded");
                                  await spinningController.createRewardedAd();
                                  debugPrint("After create Rewarded");
                                  Navigator.pop(context);
                                  spinningController.isAdShown.value = true;
                                  if(!spinningController.isAdShown.value) {
                                    spinningController.isAdsSeen.value = true;
                                  }
                                });
                          });

                      if (!spinningController.spinning) {
                        spinningController.spin();
                      }
                    }
                  },
                  child: SizedBox(
                      width: Get.width * .18,
                      child: Image.asset(AssetConstants.icSpin)),
                ),
                spinningController.isAdShown.value ? Loader() : Offstage()
              ]),
            ),

            spinningController.isAdsSeen.value ?SizedBox.shrink():SizedBox(
              height:20,
            ),
            goldenBox,
            //   walletManagement(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );

  Widget gameBelt() =>
      SizedBox(width: Get.width, child:Image(
        image: CachedNetworkImageProvider( "https://indtubes.com/spinner/IndTubes/assets/belt.png",),
      ),);

  Widget gameWheel() => Padding(
        padding: const EdgeInsets.only(top: 35.0, ),
        child: AnimatedBuilder(
          animation: spinningController.animation,
          builder: (context, child) {
            return Transform.rotate(
                angle: spinningController.animationController.value *
                    spinningController.angle,
                child: SizedBox(
                  width: Get.width * .768,
                  child: Image(
                    image: CachedNetworkImageProvider( "https://indtubes.com/spinner/IndTubes/assets/spinningCircle.png",),
                  ),
                ));
          },
        ),
      );

  Widget walletManagement() => Container(
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
        child: GetBuilder<SpinningController>(builder: (controller) {
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
        }),
      );

  Widget get goldenBox => Obx(
        () => AnimatedCrossFade(
          duration:const Duration(milliseconds: 10),
          crossFadeState: spinningController.isAdsSeen.value
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Image(
              image: const  AssetImage(AssetConstants.icGifGoldBox),
              width: Get.width*.20,
              height: Get.height *.20,
          ),
          secondChild: Padding(
            padding:const  EdgeInsets.only(right:45),
            child: Image(
              width: Get.width*.50,
              height: Get.height *.20,
              image: const  AssetImage(AssetConstants.icGifMoving),
            ),
          ),
        ),
      );

  Widget _titleColumn(var title) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        title.toString(),
        style: const TextStyle(
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
