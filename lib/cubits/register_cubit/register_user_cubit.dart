import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:masar_app/cubits/register_cubit/register_user_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit() : super(RegisterUserInitialState());

  static RegisterUserCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  IconData suffix = Icons.visibility_off;
  bool isPassword = true;

  void createUser({
    required String email,
    required String password,
    required String FirstName,
    required String LastName,
    required String DOB,
    required String City,
  }) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      String userID = FirebaseAuth.instance.currentUser!.uid;
      isLoading = true;
      await users.doc(userID).set({
        "email": email,
        "password": password,
        "FirstName": FirstName,
        "LastName": LastName,
        "Date of Birth": DOB,
        "City": City,
        "id": userID,
      });
      print("User document created with ID: $userID");
      emit(CreateUserSuccessState());
    } catch (e) {
      isLoading = false;
      emit(CreateUserFailureState());
      print("Error creating user document: $e");
    }
  }

  // Registration
  void userRegister({
    required BuildContext context,
    required String email,
    required String password,
    required String FirstName,
    required String LastName,
    required String DOB,
    required String City,
  }) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final String userID = credential.user!.uid;
      FirebaseAuth.instance.currentUser!.sendEmailVerification();

      // Create the user document in Firestore with the user ID
      createUser(
        email: email,
        password: password,
        FirstName: FirstName,
        LastName: LastName,
        DOB: DOB,
        City: City,
      );

      print("User registered with ID: $userID");

      // Notify user to check their email
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        btnOkOnPress: () {},
        dismissOnTouchOutside: false,
        title: "109".tr,
        desc: "110".tr,
      ).show();
      emit(RegisterUserSuccessState());
      // Start checking for email verification after a short delay
      Future.delayed(
          const Duration(seconds: 5), () => checkEmailVerification(context));
    } on FirebaseAuthException catch (e) {
      emit(RegisterUserfaliuerState(e.toString()));
      handleFirebaseAuthErrors(e, context);
    }
  }

  void checkEmailVerification(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    // Continuously reload and check the user status
    if (user != null) {
      await user.reload();
      if (user.emailVerified) {
        print("Email verified for user ID: ${user.uid}");
        Get.offAllNamed("login");
      } else {
        Future.delayed(
            const Duration(seconds: 5), () => checkEmailVerification(context));
      }
    } else {
      print("No user is logged in");
    }
  }

  void handleFirebaseAuthErrors(FirebaseAuthException e, BuildContext context) {
    if (e.code == 'weak-password') {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        btnOkOnPress: () {},
        dismissOnTouchOutside: false,
        title: "111".tr,
        desc: "112".tr,
      ).show();
    } else if (e.code == 'email-already-in-use') {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        btnOkOnPress: () {},
        dismissOnTouchOutside: false,
        title: "113".tr,
        desc: "114".tr,
      ).show();
    }
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(RegisterPasswordVisibilityState());
  }
}
