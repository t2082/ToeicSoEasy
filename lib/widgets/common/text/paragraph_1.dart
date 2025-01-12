import 'package:flutter/material.dart';

Widget paragraph_1(
    String firstText,
    TextStyle firstTextStyle,
    String secondText,
    TextStyle secondTextStyle,
    BuildContext context,
    void Function()? onTap) {
  return GestureDetector(
    onTap:
        onTap, // Không cần sử dụng ?? onTap nữa vì nó đã là optional (nullable)
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        Text(firstText, style: firstTextStyle),
        Text(secondText, style: secondTextStyle)
      ],
    ),
  );
}

Widget twoTextOneRow(
    String firstText,
    TextStyle firstTextStyle,
    String secondText,
    TextStyle secondTextStyle,
    BuildContext context,
    void Function()? onTap) {
  return GestureDetector(
    onTap:
        onTap, // Không cần sử dụng ?? onTap nữa vì nó đã là optional (nullable)
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        Text(firstText, style: firstTextStyle),
        Text(secondText, style: secondTextStyle)
      ],
    ),
  );
}
