import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/utils/colors.dart';

Widget socialMediaBuild() {
  return Column(
    children: [
      Row(
        spacing: 5.w,
        children: [
          Expanded(
              child: _socialMediaItem(
            Image.asset(
              'assets/images/icons/facebook.png',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          )),
          Expanded(
            child: _socialMediaItem(
              Image.asset(
                'assets/images/icons/google.png',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _socialMediaItem(Image image) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: AppColors.dark10,
      borderRadius: BorderRadius.circular(8), // Rounded corners
    ),
    child: Center(child: image),
  );
}
