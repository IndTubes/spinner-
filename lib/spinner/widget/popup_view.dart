import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indtubes_1/resources/asset_constants.dart';
import 'package:indtubes_1/resources/material_button.dart';
import 'package:indtubes_1/spinner/widget/custom_half_circle.dart';
import 'package:indtubes_1/spinner/widget/custom_hexagon_btn.dart';
import 'package:indtubes_1/view_model/spinning_controller.dart';

class PopupView extends StatelessWidget {
  final VoidCallback onTap ;
   PopupView({Key? key , required this.onTap}) : super(key: key);

  final spinnerController = Get.put(SpinningController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width*.80,
      height: 300,
      child: Stack(
        children: [
          Positioned(top: 40, child: _upperView),
          Positioned(left: Get.width *.06, top: 0, bottom: Get.height*.15, child: _middleView),
          Positioned(top: Get.height*.16, child: _lowerView),
        ],
      ),
    );
  }

  Widget get _upperView => Container(
        width: 500,
        height: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF140226),
                Color(0xFF7905F3),
              ],
            )),
      );

  Widget get _middleView => Container(
       width: Get.width*.65,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF210262),
                  Color(0xFF05FACD),
                ])),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _heading,
                const SizedBox(height: 16.0),
                _customHexGone,
                const SizedBox(height: 20.0),
              ]),
        ),
      );

  Widget get _lowerView => Align(
    alignment: Alignment.center,
    child: Stack(
          children: [
            CustomPaint(
              size: Size(Get.width * .80, 200),
              painter: CustomHalfCircle(),
            ),
            Positioned(
              top: Get.height*.07,
              left: Get.width *.20,

                child: _buttonView)
          ],
        ),
  );

  Widget get _text => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Collect Rewards",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget get _button => MaterialButtons(
        text: "OK",
        onTap: onTap,
        boxShadow: [BoxShadow(color: Colors.transparent)],
        border: Border.all(color: Colors.tealAccent , width: 1),
        colorList: [
          Colors.yellowAccent,
          Colors.yellow.shade900,
          Colors.yellow.shade200
        ],
      );

  Widget get _customHexGone => Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: CustomPaint(
              size:  Size(Get.width *.30, Get.height*.07),
              painter: CustomHexagonButton(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(top: Get.height* .02),
              child: Text(spinnerController.earnedValue.toString() , style: TextStyle(
                color: Colors.white ,
                fontSize: 16,
                fontWeight: FontWeight.bold

              ),),
            ),
          )
        ],
      );

  Widget get _buttonView => Column(
        children: [
          _text,
          const SizedBox(height: 16.0),
          _button],
      );

  Widget get _heading => Row(
        children: [
             SizedBox(width: 8.0),
          Expanded(

              child: _goldGif),
       //   SizedBox(width: 8.0),
          Expanded(
            flex: 4,
            child: Text(
              "READY TO COLLECT COINS",
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),
       //   const SizedBox(width: 8.0),
          Expanded(child: _goldGif),
        ],
      );

  Widget get _goldGif => Image(
    image: AssetImage(AssetConstants.icGifCoin ),
    width: 30,
    height: 25,
  );

  Widget get _goldImage => const SizedBox(
      width: 20,
      height: 20,
      child: Image(image: AssetImage(AssetConstants.icGoldImage)));
}
