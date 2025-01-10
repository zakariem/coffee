import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
import 'button_primary.dart';
class AdsBannerWidget extends StatelessWidget {
  const AdsBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color:kWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset('assets/coffee_baner.png',width: double.infinity,
               height: 170,),
              ],
            ),
          ),
        ),
        // Image.asset('assets/banner.png',width:100),
      ]),
    );
  }
}
