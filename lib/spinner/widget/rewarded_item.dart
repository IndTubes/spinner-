
import 'package:flutter/material.dart';
import 'package:indtubes_1/resources/asset_constants.dart';

class RewardedItem extends StatelessWidget{
  final double scale  ;
  final Color color ;
  final   String imageUrl ;

  const  RewardedItem({ required this.color , required this.imageUrl , super.key , required this.scale});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Container(
          width: scale>0.7? 250 :200 ,
          height: scale>0.7? 250 :200,
          decoration: BoxDecoration(
            color: color.withOpacity(0.6),
            border:scale>0.7? Border.all(color: Colors.grey.withOpacity(0.6)):Border.all(color: Colors.black.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:const  EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              scale >0.7 ? Image.asset(imageUrl, width: 80,height: 80,): Image.asset(imageUrl,width:40 ,height: 40),
                const SizedBox(height: 8.0),
                scale >0.7 ? textWidgetBig(text: "IndCoins" ): textWidget(text: "IndCoins"),
                scale >0.7 ?textWidgetBig(text: "unlocked" ):textWidget(text: "unlocked" ),
                const SizedBox(height: 8.0),
                scale >0.7 ?  _claimRewardBig: _claimReward

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget  textWidget({required String text}) => Text(
    text , style: const TextStyle(
    color: Colors.white ,
    fontSize: 16 ,
    fontWeight: FontWeight.bold



  ),);

  Widget  textWidgetBig({required String text}) => Text(
    text , style: const TextStyle(
      color: Colors.white ,
      fontSize: 22 ,
      fontWeight: FontWeight.bold



  ),);
  Widget  textWidgetBlack({required String text}) => Text(
    text , style: const TextStyle(
      color: Colors.black ,
      fontSize: 16 ,
      fontWeight: FontWeight.bold



  ),);

  Widget  textWidgetBlackSmall({required String text}) => Text(
    text , style: const TextStyle(
      color: Colors.white ,
      fontSize: 12 ,
      fontWeight: FontWeight.bold



  ),);

  Widget get _claimReward => Container(
    padding:const  EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.3),
      borderRadius: BorderRadius.circular(10),
    ),
    child: textWidgetBlackSmall(text: "Claim Reward" ),
  );

  Widget get _claimRewardBig => Container(
    padding:const  EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: textWidgetBlack(text: "Claim Reward" ),
  );
}