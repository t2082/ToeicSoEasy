import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toeicsoeasy/utils/colors.dart';

Widget socialMediaBuild() {
    return Column(
      children: [
        Row(
          spacing: 5.w,
          children: [
            Expanded(
                child: _socialMediaItem(Icon(
              Icons.facebook,
              color: AppColors.buttonColor,
              size: 30,
            ))),
            Expanded(
                child: _socialMediaItem(Icon(
              Icons.g_mobiledata_outlined,
              color: AppColors.buttonColor,
              size: 30,
            ))),
          ],
        ),
      ],
    );
  }

Widget _socialMediaItem(Icon icon) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: AppColors.dark10,
      borderRadius: BorderRadius.circular(8), // Rounded corners
    ),
    child: Center(child: icon),
  );
}
