import 'package:flutter/material.dart';
import 'package:bumpyj/core/utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;
  final void Function()? onSuffixTap;
  final IconData? suffixIcon;

  const CustomTextField({
    required this.labelText,
    required this.controller,
    required this.focusNode,
    this.obscureText = false,
    this.onSuffixTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: context.colorScheme.secondary,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: context.colorScheme.primary,
            width: 2.0,
          ),
        ),
        suffix: suffixIcon != null
            ? InkWell(onTap: onSuffixTap, child: Icon(suffixIcon))
            : null,
      ),
    );
  }
}
