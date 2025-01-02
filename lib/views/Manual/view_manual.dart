import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:masar_app/constant.dart';

class ManualViewPage extends StatefulWidget {
  final File file;
  const ManualViewPage({super.key, required this.file});

  @override
  State<ManualViewPage> createState() => _ManualViewPageState();
}

class _ManualViewPageState extends State<ManualViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        title: Text('91'.tr),
        backgroundColor: kBackGroundColor,
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("homepage");
            },
            icon: const Icon(Icons.arrow_back)),
        iconTheme: const IconThemeData(size: 25, color: kPrimaryColor),
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Container(
            height: 2.0,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}
