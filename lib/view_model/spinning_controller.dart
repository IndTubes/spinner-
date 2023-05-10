import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:indtubes_1/admob/ad_helper.dart';
import 'package:indtubes_1/main.dart';
import 'package:indtubes_1/resources/asset_constants.dart';

class SpinningController extends FullLifeCycleController with GetSingleTickerProviderStateMixin, GetTickerProviderStateMixin{



  static const int maxFailedLoadAttempts = 3;

  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;
  RxBool isAdShown = false.obs ;
  bool flag = false;
  final RxBool  isPopupComing = false.obs  ;

  static final AdRequest request =   AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );


  List<double> sectors = [1, 2, 3, 3, 5, 6, 7, 8, 0, 10, 11, 12];

  int randomSectorIndex = -1 ;


  List<double> sectorRadians = [];

  double angle = 0;

  bool spinning = false;

  double earnedValue = 0;

  RxBool isAdsSeen = false.obs ;

  double totalEarnings = 0;

  int spins = 0;

  int delayTimeInSecond = 3;
   String? deviceId  ;
  late  AnimationController animationController;
  late Animation<double> animation;
  late GifController gifController ;

  Random random = Random();
  final player = AudioPlayer();

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
   gifController =  GifController(vsync: this) ;
   _init() ;
   isPopupComing.value = true ;
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: delayTimeInSecond));
    Tween<double> tween = Tween<double>(begin: 0, end: 1);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
     statusBarColor: Colors.black,
   ));
    CurvedAnimation curvedAnimation =
    CurvedAnimation(parent: animationController, curve: Curves.decelerate);

    animation =  tween.animate(curvedAnimation);
   // createRewardedAd(spinningController);
    _getId() ;


    generateSectorRadian();
    animationController.addListener(() {
      //only when animation complete
      if (animationController.isCompleted) {
        //record states
        recordStats();
        // update status boolean
        spinning = false;
      }
    });
    super.onInit();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.paused){
     // player.pause();
      player.stop();
    //  player.dispose();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    gifController.dispose();
    animationController.dispose();
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    player.dispose();
    _rewardedAd?.dispose() ;
    super.dispose();
  }


  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    player.playbackEventStream.listen((event) {
/*
      if(event != ProcessingState.loading && event !=ProcessingState.buffering){
        if(!flag){
          player.play();
          flag = true;
        }

     }*/

    },
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });
    // Try to load audio from a source and catch any errors.
    try {
      // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac
      await player.setAudioSource(AudioSource.uri(Uri.parse(
          "https://indtubes.com/spinner/IndTubes/assets/music.mp3")));
      print((Uri.parse(
          "https://indtubes.com/spinner/IndTubes/assets/music.mp3"))) ;
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }


  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }


  }

  Future<void> createRewardedAd() async{
   await  RewardedAd.load(
        adUnitId: AdHelper.adUnit,
         request: request,
        rewardedAdLoadCallback:  RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;
            _rewardedAd!.setImmersiveMode(true) ;
            print("The ad is coming  ::${ad}") ;
            showRewardedAd() ;
            _numRewardedLoadAttempts = 0;

          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: ${error.message}');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              createRewardedAd();
            }
          },
        ));
  }

  void showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) {
        print('ad onAdShowedFullScreenContent.');

      },

      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
     //  isAdShown.value = false ;
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
     //   isAdShown.value = false ;
        // createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
          isAdShown.value = false ;
          isAdsSeen.value = true ;
          Timer.periodic(const Duration(seconds: 20), (timer) {
            isAdsSeen.value = false ;
          });

        });
    _rewardedAd = null;
  }

  void generateSectorRadian() {
    double sectorRadian = 2 * pi / sectors.length;
    print("The sector Radian is::${sectorRadians}");
    for (int i = 0; i < sectors.length; i++) {
      sectorRadians.add((i+1)  * sectorRadian);
    }
    print("The sector Radian is::${sectorRadians}");
  }

  void recordStats() {
    earnedValue = sectors[sectors.length - (randomSectorIndex + 1)];
    totalEarnings = totalEarnings + earnedValue;
    spins = spins + 1;
    update();
  }

  void spin() {
    randomSectorIndex = random.nextInt(sectors.length);
    double randomRadian = generateRandomRadianToSpinTo();
    animationController.reset();
    angle = randomRadian;
    animationController.forward();
  }

  double generateRandomRadianToSpinTo() {
    return (2 * pi * sectors.length) + sectorRadians[randomSectorIndex];
  }
}