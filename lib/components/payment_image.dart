import 'package:flutter/material.dart';

class PaymentImage extends StatelessWidget {
  const PaymentImage({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.only(left: 30, top: 100),
            child: Image.asset(path, height:260, width:270, fit: BoxFit.cover,));
  }
}