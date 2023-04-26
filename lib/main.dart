import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:indtubes_1/routes/route_constants.dart';
import 'package:indtubes_1/routes/routes.dart';
import 'package:package_info_plus/package_info_plus.dart';

String? version;
List<String> testDeviceIds = ['FAEF4BB6A566B6C867B4FBEA18AF867D', "269A6466C3F5334EDA350B677D37E25E", "93D13D474A82C0CBF6D79DCB3EAA78C6", "677885559C580A97BA119FF31D48DA62"];

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  version = packageInfo.version;

  RequestConfiguration configuration =
  RequestConfiguration(testDeviceIds: testDeviceIds);
  print("The configuration is ::${configuration}") ;
  MobileAds.instance.updateRequestConfiguration(configuration);
  await Firebase.initializeApp();
  MobileAds.instance.initialize() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.get(),
      initialRoute: RouteConstants.spinningWheelRoute,
    );
  }
}


