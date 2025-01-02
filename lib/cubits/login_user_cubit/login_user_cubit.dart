import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:masar_app/cubits/login_user_cubit/login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit() : super(LoginUserInitialState());

  static LoginUserCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  GlobalKey formKey = GlobalKey<FormState>();
  IconData suffix = Icons.visibility_off;
  bool isPassword = true;

  void loginUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    emit(LoginUserLoadingState());

    try {
      isLoading = true;
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = false;
      if (credential.user!.emailVerified) {
        Get.offAndToNamed("homepage");
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          title: "105".tr,
          desc: "104".tr,
          btnOkOnPress: () {},
        ).show();
      }
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "106".tr,
          desc: "107".tr,
          btnOkOnPress: () {},
        ).show();
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "106".tr,
          desc: "108".tr,
          btnOkOnPress: () {},
        ).show();
      }
    }

    /*FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginUserSuccessState());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage())
      );
    }).catchError((e) {
      emit(LoginUserFailureState(e.toString()));

      if (e is FirebaseAuthException) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'Incorrect email or password',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
      }});*/
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(LoginPasswordVisibilityState());
  }

  void resetPassword(
      {required BuildContext context, required String email}) async {
    if (email == "") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        btnOkOnPress: () {
          close();
        },
        dismissOnTouchOutside: false,
        title: 'No Email Provided',
        desc: 'Please input your email address before continuing.',
      ).show();
    } else if (email != "") {
      try {
        isLoading = true;
        final credential =
            await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        isLoading = false;
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.topSlide,
          showCloseIcon: true,
          btnOkOnPress: () {
            close();
          },
          dismissOnTouchOutside: false,
          title: 'Attention',
          desc:
              'A password reset email has been sent to your address. Please check your inbox and follow the instructions to reset your password.',
        ).show();
      } on FirebaseAuthException catch (e) {
        isLoading = false;
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          showCloseIcon: true,
          btnOkOnPress: () {
            close();
          },
          dismissOnTouchOutside: false,
          title: 'Invalid Email',
          desc: 'Please confirm that the email provided is correct.',
        ).show();
        print(e);
      }
    }
  }
}// class ending
