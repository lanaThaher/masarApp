import 'package:flutter/material.dart';
import 'package:masar_app/constant.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.Icon,
    required this.text,
    required this.color,
    required this.onTap,
  });

  final Widget Icon;
  final String text;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kPrimaryBackGroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            IconButton(
                color: color, icon: Icon, iconSize: 30, onPressed: onTap),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(text,
                    style: const TextStyle(
                        fontSize: 25,
                        color: kPrimaryTextColor,
                        fontWeight: FontWeight.w500))),
          ],
        ),
      ),
    );
  }
}
