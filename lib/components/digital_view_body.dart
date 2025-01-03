import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:masar_app/constant.dart';

class DigitalViewBody extends StatelessWidget {
  const DigitalViewBody({super.key});

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("No user is logged in");
      }

      print('Fetching data for user ID: ${user.uid}');
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        print('User document found: ${userDoc.data()}');
        return userDoc.data() as Map<String, dynamic>?;
      } else {
        throw Exception("No document found for the user");
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Image section
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[
                /* Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: Image.asset('assets/images/Qr.png',
                      width: 90.0, height: 90.0, fit: BoxFit.cover),
                ),*/
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              color: const Color.fromRGBO(0, 0, 0, 0.01),
              child: FutureBuilder<Map<String, dynamic>?>(
                future: getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const Center(child: Text('No data found'));
                  }

                  Map<String, dynamic> userData = snapshot.data!;
                  return Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(200),
                      1: FlexColumnWidth(),
                    },
                    children: [
                      _buildTableRow(
                          "62".tr,
                          userData['FirstName'] + " " + userData['LastName'] ??
                              'N/A'),
                      _buildTableRow("64".tr, "65".tr),
                      // _buildTableRow("Email", userData['email'] ?? 'N/A'),
                      _buildTableRow(
                          "66".tr, userData['Date of Birth'] ?? 'N/A'),
                      _buildTableRow("68".tr, userData['City'] ?? 'N/A'),
                      _buildTableRow("70".tr, "71".tr),
                      _buildTableRow("72".tr, "73".tr),
                      _buildTableRow("74".tr, "75".tr),
                      _buildTableRow("76".tr, "77".tr),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(
    String label,
    String value,
  ) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Text(
            "$label:",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: kPrimaryTextColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Text(
            value,
            style: const TextStyle(fontSize: 22, color: kPrimaryTextColor),
          ),
        ),
      ],
    );
  }
}
