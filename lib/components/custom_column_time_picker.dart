import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/constant.dart';

class CustomColumnTimePicker extends StatefulWidget {
  const CustomColumnTimePicker(
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
  State<CustomColumnTimePicker> createState() => _CustomColumnTimePickerState();
}

class _CustomColumnTimePickerState extends State<CustomColumnTimePicker> {
  TimeOfDay? time; // Make time nullable

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("60".tr,
            style: const TextStyle(color: kPrimaryTextColor, fontSize: 25)),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () async {
            widget.onTap();
            // // Open the time picker here
            // TimeOfDay? picked = await showTimePicker(
            //   context: context,
            //   initialTime: TimeOfDay.now(),
            // );
            // if (picked != null) {
            //   setState(() {
            //     time = picked;
            //     // Update time once picked
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
                      padding: const EdgeInsets.only(bottom: 6, left: 15),
                      child: Icon(
                        widget.icon,
                        size: 28,
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
