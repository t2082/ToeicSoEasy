import 'package:flutter/material.dart';
import 'package:toeicsoeasy/utils/colors.dart';

Widget orDivider() {
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: Colors.grey,
          thickness: 1,
          endIndent: 10,
          indent: 10,
          height: 20,
        ),
      ),
      Text(
        'Or',
        style: TextStyle(
          color: AppColors.textPrimaryColor,
          fontSize: 16,
        ),
      ),
      Expanded(
        child: Divider(
          color: Colors.grey,
          thickness: 1,
          endIndent: 10,
          indent: 10,
          height: 20,
        ),
      )
    ],
  );
}
