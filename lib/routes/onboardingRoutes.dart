import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';
import 'package:indtubes_1/routes/route_constants.dart';
import 'package:indtubes_1/spinner/reward_screen.dart';
import 'package:indtubes_1/spinner/spinner_screen.dart';

class OnBoardingRoutes{

  OnBoardingRoutes._();

  static List<GetPage> get route =>
      [
        GetPage(name: RouteConstants.spinningWheelRoute, page: ()=> AudioServiceWidget(child: SpinnerScreen())),
        GetPage(name: RouteConstants.rewardRoute, page: ()=> RewardedScreen())



      ];

}