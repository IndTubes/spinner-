import 'package:flutter/material.dart';
import 'package:indtubes_1/resources/color_constants.dart';
class MaterialButtons extends StatefulWidget {

  final String text ;
  final double? width ;
  final double? fontSize ;
  final List<Color>? colorList ;
  final BoxBorder? border ;
  final VoidCallback onTap ;
  final List<BoxShadow>? boxShadow ;
  const MaterialButtons({Key? key , required this.text , required this.onTap ,this.boxShadow ,  this.width ,this.border ,  this.fontSize, this.colorList}) : super(key: key);

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
            colors: widget.colorList??[
              ColorConstants.bgWallet.withOpacity(0.8) , Colors.black
            ]
          ),
          borderRadius: BorderRadius.circular(10),
          border:widget.border?? Border.all(color: Colors.yellowAccent , width: 1),
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
