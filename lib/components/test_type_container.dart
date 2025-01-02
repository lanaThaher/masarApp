import 'package:flutter/material.dart';
import 'package:masar_app/constant.dart';

// ignore: must_be_immutable
class TestTypeContainer extends StatelessWidget {
  TestTypeContainer({
    super.key,
    required this.icon,
    required this.onTap
  });

  final IconData icon;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: kPrimaryColor),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: kBackGroundColor,
          size: 100,
        ),
      ),
    );
  }
}
