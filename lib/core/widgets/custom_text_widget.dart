import 'package:flutter/material.dart';

class CustomLabelText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign alignment;
  final EdgeInsetsGeometry padding;

  const CustomLabelText({
    Key? key,
    required this.text,
    this.style,
    this.alignment = TextAlign.start,
    this.padding = const EdgeInsets.only(bottom: 8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          textAlign: alignment,
          style: style ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
        ),
      ),
    );
  }
}
