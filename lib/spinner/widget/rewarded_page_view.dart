
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:indtubes_1/spinner/widget/expandle_page_view.dart';
import 'package:indtubes_1/spinner/widget/rewarded_item.dart';
class RewardedPageView extends StatefulWidget {
  final List<Color> colorList ;
  final List<String> imageUrl ;
  const RewardedPageView({required this.colorList , required this.imageUrl , Key? key}) : super(key: key);

  @override
  State<RewardedPageView> createState() => _RewardedPageViewState();
}

class _RewardedPageViewState extends State<RewardedPageView> {
  double viewPortFraction = 0.7;
  int currentPage =1 ;
  late PageController pageController ;
  double FULL_SCALE = 1.0;
  double PAGER_HEIGHT = 200.0;
  double SCALE_FRACTION = 0.7;
  double page =1.0 ;

  @override
  void initState() {
   pageController = PageController(initialPage:currentPage , viewportFraction: viewPortFraction);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        child: ExpandablePageView.builder(
          itemCount: widget.colorList.length,
          controller: pageController,
            onPageChanged: (pos){
              setState(() {
                currentPage = pos ;
              });
            },
            itemBuilder: (context , index){
             final scale = max(SCALE_FRACTION, (FULL_SCALE - (index - page).abs()) + viewPortFraction);
             debugPrint(scale.toString());
              return RewardedItem(color: widget.colorList[index], imageUrl: widget.imageUrl[index], scale: scale);
            }));
  }


}
