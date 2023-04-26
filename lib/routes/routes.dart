import 'package:get/get.dart';
import 'package:indtubes_1/routes/onboardingRoutes.dart';

class Routes{
  Routes._() ;

  static List<GetPage> get() {
    final moduleRoutes = <GetPage>[];
     moduleRoutes.addAll(OnBoardingRoutes.route) ;
     return moduleRoutes ;
  }

}