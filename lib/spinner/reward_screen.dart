import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indtubes_1/resources/asset_constants.dart';
import 'package:indtubes_1/resources/color_constants.dart';
import 'package:indtubes_1/spinner/widget/custom_tracker.dart';
import 'package:indtubes_1/view_model/rewarded_controller.dart';

import 'widget/rewarded_page_view.dart';

class RewardedScreen extends StatelessWidget {
  RewardedScreen({super.key});

final rewardedController = Get.put(RewardedController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorConstants.topColors,
                  ColorConstants.middleColors,
                  ColorConstants.bottomColors,
                  ColorConstants.endColors,
                ])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                _header,
                const SizedBox(
                  height: 16,
                ),
                _earnCoin,
                const SizedBox(
                  height: 16,
                ),
                _dailyReward,
                const SizedBox(
                  height: 16,
                ),
                _race,

                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _header => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            minRadius: 20,
            backgroundImage: AssetImage(AssetConstants.icAvatar),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Image(
                      image: AssetImage(AssetConstants.icGifCoin),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "100",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              ),
            ),
          )
        ],
      );

  Widget get _earnCoin => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Earn 5 IndCoins",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: ("Spin Atleast "),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      TextSpan(
                          text: ("5 Times "),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      TextSpan(
                          text: ("to get best Rewards"),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14))
                    ]))
                  ],
                ),
              ),
              Expanded(child: Image.asset(AssetConstants.icGifGoldBox))
            ],
          ),
        ),
      );

  Widget get _dailyReward => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.4),
        ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _dailyRewardHeading,
          const SizedBox(height: 8.0,),
          _dailyRewardSlogan ,
          const SizedBox(height: 8.0,),
          _rewardPageView ,
          const SizedBox(height: 8.0,),


        ],
      ),
    ),
      );

  Widget get _dailyRewardHeading => const Text("Daily Rewards" ,   style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold),);

  Widget get _dailyRewardSlogan => const Text("Try your luck and win bonuses from 0 to 10,000 IndCoins",style: TextStyle(
    color: Colors.white,
    fontSize: 14 ,
    fontWeight: FontWeight.w400 ,
  ), );

  Widget get _rewardPageView => RewardedPageView(colorList: rewardedController.colorList, imageUrl: rewardedController.imageUrlList,);

  Widget get _race => Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.black.withOpacity(0.4),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _tracking,
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const  [
              Text("Realtime Tracking", style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold ,
              ),),
               SizedBox(height: 8.0),
              Text("4 step you can complete Today" ,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              )
                ,),
              Text("Amazing , you are half way ! Check you Progress Details" ,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                )
                ,)
            ],
          ),
        )
      ],
    ),
  );


  Widget get _tracking  => Stack(
    children:[
      CustomPaint(
        painter: CustomTracker(),
        size:const  Size(70,70),
      ),
      Positioned(
        top: 12,
          left: 14,
          child: Image.asset(AssetConstants.icFire, width: 40,height: 40,)),
    ]

  );
}
