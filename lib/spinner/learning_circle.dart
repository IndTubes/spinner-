
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:indtubes_1/resources/asset_constants.dart';
class LearningCircle extends StatefulWidget {
  const LearningCircle({Key? key}) : super(key: key);

  @override
  State<LearningCircle> createState() => _LearningCircleState();
}

class _LearningCircleState extends State<LearningCircle> with SingleTickerProviderStateMixin {
  
  
  late AnimationController animationController ; 
  late Animation<double> animation ;
  List<String> sectors =['innovate' , 'teaching' , 'and' , 'learning', 'with' , 'TECH'];
  List<double> sectorRadians = [] ;
  int randomSectorIndex = -1 ;
  int duration = 3 ; 
  double angle = 0 ;

  void generateSectorRadian(){
    double sectorRadian = 2*pi / sectors.length ;
    for(int i=0 ; i<sectors.length ; i++){
      sectorRadians.add((i+1)* sectorRadian) ;
    }
  }


  @override
  void initState() {
    generateSectorRadian() ;
   animationController = AnimationController(vsync: this , duration:Duration(seconds: duration) );
   Tween<double> tween = Tween(begin: 0 , end: 1);
   CurvedAnimation curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.decelerate);
   animation = tween.animate(curvedAnimation) ; 
    super.initState();
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ; 
    return circularWheel(size);
  }
  Widget   circularWheel(Size size) => AnimatedBuilder(
      animation: animation, 
      builder: (context , child){
        return Transform.rotate(
            angle: animationController.value *angle,
          child: Image.asset(AssetConstants.icCircle),
        
        );
      }); 


}
