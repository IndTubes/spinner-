
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
      alignment: Alignment.topCenter,
      child: Padding(
        padding: scale>0.7? const EdgeInsets.only(right: 10.0 )  :const EdgeInsets.only(right: 10.0, top: 22),
        child: AnimatedContainer(
          duration:const  Duration(milliseconds: 450),
          width: scale>0.7? 250 :200 ,
          height: scale>0.7? 250 :200,
          decoration: BoxDecoration(
            color: scale>0.7 ?color.withOpacity(0.88): color.withOpacity(0.1),
            border:scale>0.7? Border.all(color: Colors.grey.withOpacity(0.6)):Border.all(color: Colors.black.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:const  EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                scale >0.7 ? Image.asset(imageUrl, width: 80,height: 80,): Image.asset(imageUrl,width:40 ,height: 40),
                const SizedBox(height: 20.0),
                scale >0.7 ? textWidgetBig(text: "IndCoins" ): textWidget(text: "IndCoins"),
                scale >0.7 ?textWidgetBig(text: "unlocked" ):textWidget(text: "unlocked" ),
                const SizedBox(height: 20.0),
                scale >0.7 ?  Expanded(child: _claimRewardBig): _claimReward,
                const SizedBox(height: 8.0),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget  textWidget({required String text}) => Text(
    text , style: const TextStyle(
    color: Colors.grey ,
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
      color: Colors.grey ,
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
    padding:const  EdgeInsets.symmetric(horizontal: 8 , vertical: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(child: textWidgetBlack(text: "Claim Reward" )),
  );
}