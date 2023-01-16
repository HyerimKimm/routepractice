import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.widthSize})
      : super(key: key);

  final Widget text;
  final VoidCallback onPressed;
  final double widthSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          minimumSize: Size(widthSize, 40.0)),
      onPressed: onPressed,
      child: text,
    );
  }
}
