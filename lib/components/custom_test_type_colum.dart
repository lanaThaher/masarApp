import 'package:flutter/material.dart';
import 'package:masar_app/constant.dart';
import 'package:masar_app/components/test_type_container.dart';

// ignore: must_be_immutable
class CustomTestTypeColumn extends StatelessWidget {
  CustomTestTypeColumn(
                      {super.key,
                      required this.icon,
                      required this.title, 
                      required this.onTap});
  final IconData icon;
  final String title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
          width: 200,
          height: 230,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryBackGroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TestTypeContainer(icon: icon, onTap: onTap,),
              const SizedBox(height: 10,),
              Text(title, style: const TextStyle(color: kPrimaryTextColor,
                    fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
    );
  }
}
