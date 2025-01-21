import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final String placeholder;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final double radius;
  final Color? titleColor;
  final Color? placeholderColor;
  final bool? filled;
  final Color? fillColor;
  final Icon? suffixIcon;
  final Color? suffixIconColor;


  const TextFieldWidget({
    super.key,
    required this.title,
    required this.placeholder,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.radius = 0.0,
    this.titleColor = Colors.black,
    this.placeholderColor = Colors.grey,
    this.fillColor,
    this.filled = true, this.suffixIcon, this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 8),
        // TextField
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(
              color: Colors.black26,
              fontSize: 16,
            ),
            filled: filled,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon: suffixIcon,
            suffixIconColor: suffixIconColor,
          ),
        ),
      ],
    );
  }
}
