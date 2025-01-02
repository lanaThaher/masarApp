import 'package:flutter/material.dart';
import 'package:masar_app/constant.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.onTap, required this.text});

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(95)),
      textColor: kBackGroundColor,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      color: kPrimaryColor,
      onPressed: onTap,
      child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 20,
              color: kBackGroundColor,
              fontWeight: FontWeight.bold)),
    );
  }
}
