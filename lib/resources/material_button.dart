import 'package:flutter/material.dart';
import 'package:indtubes_1/resources/color_constants.dart';
class MaterialButtons extends StatefulWidget {

  final String text ;
  final double? width ;
  final double? fontSize ;
  final VoidCallback onTap ;
  const MaterialButtons({Key? key , required this.text , required this.onTap , this.width , this.fontSize}) : super(key: key);

  @override
  State<MaterialButtons> createState() => _MaterialButtonState();
}

class _MaterialButtonState extends State<MaterialButtons> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width:widget.width?? 120,
        height: 40,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              ColorConstants.bgWallet.withOpacity(0.8) , Colors.black
            ]
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.yellowAccent , width: 1),
          boxShadow:const  [BoxShadow(blurStyle: BlurStyle.inner,  color: Colors.yellowAccent , blurRadius: 2 , spreadRadius: 2 )]
          ),
        child: Center(
          child: Text(widget.text , style:  TextStyle(
            color: Colors.white ,
            fontSize:widget.fontSize?? 12 ,
            fontWeight: FontWeight.w500 ,
          ),),
        ),
      ),
    );
  }
}
