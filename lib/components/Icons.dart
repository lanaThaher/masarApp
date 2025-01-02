import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:masar_app/constant.dart';

class Service extends StatelessWidget {
  const Service({
    super.key,
    required this.icon,
    required this.onTap,
    required this.num,
  });

  final Widget icon;
  final Function() onTap;
  final String num;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(0, 0, 0, 0.1),
            ),
            child: IconButton(
              highlightColor: Colors.transparent,
              onPressed: onTap,
              iconSize: 85,
              icon: icon,
              color: kPrimaryColor,
            )),
        const SizedBox(height: 15),
        Text(
          num.tr,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
