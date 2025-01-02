import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:masar_app/constant.dart';

class CustomColumnDatePicker extends StatefulWidget {
  const CustomColumnDatePicker(
      {super.key,
      required this.details,
      required this.icon,
      required this.text,
      required this.onTap});
  final String text;
  final IconData icon;
  final String details;
  final VoidCallback onTap;

  @override
  State<CustomColumnDatePicker> createState() => _CustomColumnDatePickerState();
}

class _CustomColumnDatePickerState extends State<CustomColumnDatePicker> {
  DateTime? date; // Make date nullable

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("59".tr,
            style: const TextStyle(color: kPrimaryTextColor, fontSize: 25)),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () async {
            widget.onTap();
            // DateTime? picked = await showDatePicker(
            //   context: context,
            //   initialDate: DateTime.now(),
            //   firstDate: DateTime(2000),
            //   lastDate: DateTime(2025),
            // );
            // if (picked != null) {
            //   setState(() {
            //     date = picked;
            //   });
            //   widget.onTap();
            // }
          },
          child: Container(
            height: 60,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryBackGroundColor,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.details,
                      style: const TextStyle(
                          fontSize: 20, color: kPrimaryTextColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 6,
                        left: 15,
                      ),
                      child: Icon(
                        widget.icon,
                        size: 25,
                        color: kPrimaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
