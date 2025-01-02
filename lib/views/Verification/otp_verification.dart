import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/bottom_bar.dart';
import 'package:masar_app/components/custom_button.dart';
import 'package:masar_app/components/text_field.dart';
import 'package:masar_app/constant.dart';
import 'package:masar_app/icons/key_icon.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});


  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

TextEditingController mycontrol = TextEditingController();
var formKey = GlobalKey<FormState>();

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        iconTheme: const IconThemeData(color:kPrimaryColor),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const KeyIcon(),
                const SizedBox(height: 25.0),
                Text( "31".tr, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: fontColor)),
                const SizedBox(height: 10.0),
                Text( "36".tr, style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: fontColor)),
                Text( "37".tr, style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: fontColor)),
                const SizedBox(height: 30.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField(),
                      CustomTextField(),
                      CustomTextField(),
                      CustomTextField(),
                    ],), 
                  ),
                
                const SizedBox(height: 50.0,),
                Text("33".tr, style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: fontColor)),              
                const SizedBox(height: 15.0,),
                TextButton(
                  onPressed: (){},
                  child: Text("34".tr, style: const TextStyle( fontSize: 17.0, fontWeight: FontWeight.bold, color: kPrimaryColor)),
                ),
                const SizedBox(height: 30.0,),           
                Button(
                  onTap: (){
                    Get.toNamed("unsuccessfull");
                  },
                text: "32".tr),
                const SizedBox(height: 50.0,),
                const BottomBar(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}