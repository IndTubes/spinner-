import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class GifAsset extends StatefulWidget {
  final ImageProvider assetImage ;
  final Widget?   placeholder ;
  const GifAsset({Key? key , required this.assetImage , this.placeholder }) : super(key: key);

  @override
  State<GifAsset> createState() => _GifAssetState();
}

class _GifAssetState extends State<GifAsset> with SingleTickerProviderStateMixin {

  late final GifController gifController ;
  @override
  void initState() {
    gifController = GifController(vsync: this) ;
    super.initState();
  }

  @override
  void dispose() {
   gifController.dispose() ;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Gif(image:widget.assetImage ,
      autostart: Autostart.loop,
      placeholder:(context)=>SizedBox(
        width: 20 ,
          height: 20,
          child: widget.placeholder ??  CircularProgressIndicator()) ,

    );
  }
}
