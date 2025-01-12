// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RichtextWidget extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final List<TextSpan> children;
  final VoidCallback? onPressed;

  const RichtextWidget({
    super.key,
    required this.title,
    this.style,
    required this.children,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = DefaultTextStyle.of(context).style.copyWith(
          color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
        );

    return GestureDetector(
      onTap: onPressed,
      child: RichText(
        text: TextSpan(
          text: title,
          style: style?.copyWith(
                color: style?.color ?? defaultStyle.color,
              ) ??
              defaultStyle,
          children: children,
        ),
      ),
    );
  }
}
