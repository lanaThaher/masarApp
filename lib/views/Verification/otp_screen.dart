/*import 'package:flutter/material.dart';
import 'package:masar_app/components/custom_button.dart';
import 'package:masar_app/components/custom_form_field.dart';
import 'package:masar_app/generated/l10n.dart';
import 'package:masar_app/views/reset_password.dart';

class OtpScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(0, 0, 0, 0.25),
            size: 20.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.square_rounded,
                      color: Color.fromRGBO(249, 167, 53, 1.0),
                      size: 130.0,
                    ),
                    Icon(
                      Icons.key_sharp,
                      color: Colors.white,
                      size: 80.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text(
                  S.of(context).confirmPhoneNumvber,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 0.61),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  S.of(context).otpDescription,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 0.61),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomFormField(
                        hintText: '',
                        validatorMessage: '',
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: CustomFormField(
                        hintText: '',
                        validatorMessage: '',
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: CustomFormField(
                        hintText: '',
                        validatorMessage: '',
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: CustomFormField(
                        hintText: '',
                        validatorMessage: '',
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 70.0,
                ),
                Text(
                  S.of(context).didntReciveOtp,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 0.61),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(S.of(context).resendOtp,
                      style: const TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(249, 167, 53, 1.0),
                      )),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: Button(
                    onTap: () {
                      if (formKey.currentState!.validate()) {}
                      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPassword(),
                          ));
                    },
                    text: S.of(context).verifyBtn,
                  ),
                )
                // CustomButton(
                //   text: S.of(context).verifyBtn,
                //   onPressed: (){
                // if(formKey.currentState!.validate()){};
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => CreateNewPassword(),
                //     )
                //   );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/