import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/custom_button.dart';
import 'package:masar_app/components/custom_form_field.dart';
import 'package:masar_app/constant.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<ResetPassword> {
  bool obscureText = true;
  bool obscureTextConfirm = true;
  var formKey = GlobalKey<FormState>();
  TextEditingController NewPassword =  TextEditingController();
  TextEditingController code =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        iconTheme: const IconThemeData(color:kPrimaryColor,)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Form(
            key: formKey,
              child: Column(
                children: [
                  const Icon(
                    Icons.lock,
                    size: 120,
                    color: kPrimaryColor,
                  ),
                  Text("49".tr,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: fontColor,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text("50".tr,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color: fontColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  CustomFormField(
                    controller: NewPassword,
                      hintText: "39".tr,
                      isObscureText: obscureText,
                      keyboardType: TextInputType.visiblePassword,
                      validatorMessage: "45".tr,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CustomFormField(
                      hintText: "47".tr,
                      controller: code,
                      isObscureText: obscureText,
                      keyboardType: TextInputType.visiblePassword,
                      validatorMessage: "45".tr,
                      ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Center(
                    child: Button(
                      onTap: () {
                        if (formKey.currentState!.validate()) {

                          
                          //FirebaseAuth.instance.confirmPasswordReset(
                            //code: code.text,
                            //newPassword: NewPassword.text );

                            //FirebaseAuth.instance.verifyPasswordResetCode(code.text);

                          //Get.toNamed("verification");
                        }
                      },
                      text: "51".tr,
                    ),
                  ),
                ],
              ),
          ),
      ),
    );
  }
}
