import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:masar_app/components/app_bar.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../constant.dart';

class generateQR extends StatefulWidget {
  const generateQR({super.key});

  @override
  State<generateQR> createState() => _generateQRState();
}

class _generateQRState extends State<generateQR> {
  //String qrData = "https://drive.google.com/drive/folders/1TUAQ5MaEAGlVbhMGr4QCwD7_4lIq7mvP?usp=drive_link";
  //bool showCorner = false;

  final CollectionReference digitalLicense =
      FirebaseFirestore.instance.collection("digitalLicense");
  String data =
      "https://drive.google.com/drive/folders/1TUAQ5MaEAGlVbhMGr4QCwD7_4lIq7mvP?usp=drive_link";
  String qrdata = "";
  bool showQR = false;

  addDigigtalLicense() async {
    try {
      DocumentReference response = await digitalLicense.add({
        "Link": data,
      });
      Get.toNamed("QR");
    } catch (e) {
      print(e);
    }
  }

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot = await digitalLicense.get();
      if (querySnapshot.docs.isNotEmpty) {
        qrdata = querySnapshot.docs.first
            .get('Link'); // Fetching the first document's Link field
      } else {
        qrdata = "No data available";
      }
      setState(() {});
    } catch (e) {
      print("Error fetching data: $e");
      qrdata = "Error fetching data";
      setState(() {});
    }
  }

  @override
  void initState() {
    addDigigtalLicense();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackGroundColor,
        appBar: const App_Bar(title: ""),
        body: Center(
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (qrdata.isNotEmpty &&
                    qrdata != "No data available" &&
                    qrdata != "Error fetching data")
                  PrettyQrView.data(data: qrdata)
                else
                  Text(
                    qrdata,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                const SizedBox(
                  height: 25,
                ),
                const Center(
                    child: Text(
                  "Scan me",
                  style: TextStyle(
                      fontSize: 30,
                      color: bbblack,
                      fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
        ));
  }
}
