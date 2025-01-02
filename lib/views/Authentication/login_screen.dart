import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar_app/components/custom_button.dart';
import 'package:masar_app/components/custom_form_field.dart';
import 'package:masar_app/components/localization_button.dart';
import 'package:masar_app/constant.dart';
import 'package:masar_app/cubits/login_user_cubit/login_user_state.dart';
import 'package:masar_app/cubits/login_user_cubit/login_user_cubit.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginUserCubit(),
      child: BlocConsumer<LoginUserCubit, LoginUserState>(
          listener: (context, state) {},
          builder: (context, State) {
            return Scaffold(
              backgroundColor: kBackGroundColor,
              appBar: AppBar(
                backgroundColor: kBackGroundColor,
              ),
              // for the button of localization, it's working
              // DON'T CHANGE OR TOUCH
              floatingActionButton: const FloatButton(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startTop,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Image.asset(
                          kLogo,
                          width: 228,
                          height: 139,
                        ),
                        const SizedBox(height: 140.0),
                        CustomFormField(
                          hintText: "38".tr,
                          keyboardType: TextInputType.emailAddress,
                          validatorMessage: "44".tr,
                          controller: email,
                        ),
                        const SizedBox(height: 15.0),
                        CustomFormField(
                          controller: password,
                          hintText: "39".tr,
                          isObscureText: LoginUserCubit.get(context).isPassword,
                          keyboardType: TextInputType.visiblePassword,
                          validatorMessage: "8".tr,
                          suffixIcon: LoginUserCubit.get(context).suffix,
                          suffixPressed: () {
                            LoginUserCubit.get(context)
                                .changePasswordVisibility();
                          },
                        ),
                        Container(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: TextButton(
                            onPressed: () async {
                              LoginUserCubit.get(context).resetPassword(
                                  context: context, email: email.text);
                              // try {
                              //   if (email.text == "") {
                              //     AwesomeDialog(
                              //       context: context,
                              //       dialogType: DialogType.error,
                              //       animType: AnimType.rightSlide,
                              //       title: 'Error',
                              //       desc: 'please enter your email first.',
                              //     ).show();
                              //     return;
                              //   }
                              //   FirebaseAuth.instance
                              //       .sendPasswordResetEmail(email: email.text);
                              //   AwesomeDialog(
                              //     context: context,
                              //     dialogType: DialogType.success,
                              //     animType: AnimType.rightSlide,
                              //     title: 'Attention',
                              //     desc:
                              //         'A password reset email has been sent to your address. Please check your inbox and follow the instructions to reset your password.',
                              //   ).show();
                              // } catch (e) {
                              //   AwesomeDialog(
                              //     context: context,
                              //     dialogType: DialogType.error,
                              //     animType: AnimType.rightSlide,
                              //     title: 'Error',
                              //     desc:
                              //         'please make sure you have enteres the correct email.',
                              //   ).show();
                              //   print(e);
                              // }
                            },
                            child: Text(
                              "40".tr,
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: kPrimaryTextColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50.0),
                        // BlocListener<LoginUserCubit, LoginUserState>(
                        //   listener: (context, state) {
                        //     if (state is LoginUserLoading) {
                        //       // Optionally show a loading indicator
                        //     } else if (state is LoginUserSuccess) {
                        //       // Navigate to the next screen, e.g., OtpScreen
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => OtpScreen(), // must change
                        //         ),
                        //       );
                        //     } else if (state is LoginUserFailure) {
                        //       // Show error message
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(content: Text(state.errMessage),),
                        //       );
                        // }
                        // },
                        Button(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              LoginUserCubit.get(context).loginUser(
                                  context: context,
                                  email: email.text,
                                  password: password.text);
                            }
                          },
                          text: "41".tr,
                        ),
                        const SizedBox(height: 40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "42".tr,
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed("SignUp");
                              },
                              child: Text(
                                "43".tr,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
