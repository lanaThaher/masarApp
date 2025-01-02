import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/bottom_bar.dart';
import 'package:masar_app/components/navigation_bar.dart';
import 'package:masar_app/components/profile_container.dart';
import 'package:masar_app/constant.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
        Map<String, dynamic>? data = userDoc.data() as Map<String, dynamic>?;
        if (data != null) {
          return {
            "FirstName": data["FirstName"],
            "LastName": data["LastName"],
          };
        } else {
          throw Exception("No data found in the document");
        }
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
    return Scaffold(
      backgroundColor: kBackGroundColor,
      bottomNavigationBar: const bottomAppBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            "81".tr,
            style: TextStyle(fontSize: 27),
          ),
        ),
        centerTitle: true,
        backgroundColor: kBackGroundColor,
        //iconTheme: const IconThemeData(color: kPrimaryColor),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage(kProfile),
            ),
            const SizedBox(height: 30),
            FutureBuilder<Map<String, dynamic>?>(
              future: getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}',
                      style: const TextStyle(fontSize: 23),
                      textAlign: TextAlign.center);
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('No data found',
                      style: TextStyle(fontSize: 23),
                      textAlign: TextAlign.center);
                }

                Map<String, dynamic> userData = snapshot.data!;
                String fullName =
                    "${userData['FirstName'] ?? 'N/A'} ${userData['LastName'] ?? 'N/A'}";
                return Text(fullName,
                    style: const TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.visible);
              },
            ),
            const BottomBar(),
            const SizedBox(height: 50),
            ProfileContainer(
              Icon: const Icon(Icons.settings),
              text: "80".tr,
              color: kPrimaryColor,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ProfileContainer(
              Icon: const Icon(Icons.logout),
              text: "79".tr,
              color: Colors.red,
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed("login");
              },
            )
          ],
        ),
      ),
    );
  }
}
