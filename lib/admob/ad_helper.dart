
import 'dart:io';



class AdHelper{
  static const  adUnit = "ca-app-pub-3940256099942544/5224354917";

  static String  get rewardedAdsUnit{
    if(Platform.isAndroid){
      return adUnit ;
  }
    else {
      throw  UnsupportedError("Unsupported platform") ;
    }
  }
}
