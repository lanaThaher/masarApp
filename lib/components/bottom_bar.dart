import 'package:flutter/material.dart';
import 'package:masar_app/constant.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Container(
              alignment: Alignment.lerp(Alignment.centerRight, Alignment.centerLeft, 0),
              padding: const EdgeInsets.only(right: 40, top:50 ),
              child: Image.asset("assets/images/car.jpeg", width:50, fit: BoxFit.fill, )),
              Container(
                height:2.0,
                color: kPrimaryColor,
              ),
      ]
    );
  }
}