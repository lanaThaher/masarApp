import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/digital_view_body.dart';
import 'package:masar_app/constant.dart';

class DigitalView extends StatelessWidget {
  const DigitalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 94, 221, 212),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("generate");
              },
              icon: const Icon(
                Icons.qr_code,
                size: 50,
              )),
        ],
      ),
      body: const DigitalViewBody(),
    );
  }
}
