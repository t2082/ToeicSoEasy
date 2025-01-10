import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool isLoading;
  final IconData? icon;

  const ButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 48.0,
    this.borderRadius = 8.0,
    this.isLoading = false,
    this.icon,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      color: textColor ?? Colors.white,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: textStyle ??
                        TextStyle(
                          color: textColor ?? Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
