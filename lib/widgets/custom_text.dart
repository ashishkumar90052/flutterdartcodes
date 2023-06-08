import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const CustomTextWidget({
    Key? key,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
