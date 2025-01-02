import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/views/Authentication/login_screen.dart';
import 'package:masar_app/views/Authentication/register_screen.dart';
import 'package:masar_app/views/License/issue_license.dart';
import 'package:masar_app/views/License/renew_license.dart';
import 'package:masar_app/views/MainPage/home_page.dart';
import 'package:masar_app/views/Manual/drivers_manual.dart';
import 'package:masar_app/views/Payment/checkout.dart';
import 'package:masar_app/views/Payment/failed_payment.dart';
import 'package:masar_app/views/Payment/success_payment.dart';
import 'package:masar_app/views/SplashScreen/splash_screen.dart';
import 'package:masar_app/views/Testss/practical_test_view.dart';
import 'package:masar_app/views/Testss/test_types_view.dart';
import 'package:masar_app/views/Testss/writtem_test2_view.dart';
import 'package:masar_app/views/Testss/written_test1_view.dart';
import 'package:masar_app/views/Verification/otp_verification.dart';
import 'package:masar_app/views/profile/digital_view.dart';
import 'package:masar_app/views/profile/profile.dart';
import 'package:masar_app/views/ResetPassword/reset_password.dart';
import 'package:masar_app/views/QR/generate_qr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:masar_app/language_controller/locale_controller.dart';
import 'package:masar_app/language_controller/locale.dart';

SharedPreferences? sharepref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharepref = await SharedPreferences.getInstance();
  runApp(const MasarApp());
}

class MasarApp extends StatefulWidget {
  const MasarApp({super.key});

  @override
  State<MasarApp> createState() => _MasarAppState();
}

class _MasarAppState extends State<MasarApp> {
  // @override
  //void initState() {
  //FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //if (user == null) {
  //  print('User is currently signed out!');
  //} else {
  //  print('User is signed in!');
  //  }
//  });
  //  super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    MylocaleController controller = Get.put(MylocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "spalshScreen",
      locale: controller.intialLang,
      translations: MyLocale(),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: "/spalshScreen",  page: () => const SplashScreen()),
        GetPage(name: "/SignUp",        page: () => const RegisterScreen()),
        GetPage(name: "/login",         page: () => const LoginScreen()),
        GetPage(name: "/homepage",      page: () => const HomePage()),
        GetPage(name: "/TestType",      page: () => const TestTypesView()),
        GetPage(name: "/practicalTest", page: () => const PracticalTestView()),
        GetPage(name: "/writtenTest1",  page: () => const WrittenTest1View()),
        GetPage(name: "/writtenTest2",  page: () => const WrittenTest2View()),
        GetPage(name: "/issueLicense",  page: () => const IssueLicense()),
        GetPage(name: "/digitaLicense", page: () => const DigitalView()),
        GetPage(name: "/renewLicense",  page: () => const RenewLicense()),
        GetPage(name: "/driverManual",  page: () => const DriverManual()),
        GetPage(name: "/profile",       page: () => const ProfileView()),
        GetPage(name: "/verification",  page: () => const OtpVerification()),
        GetPage(name: "/sucessful",     page: () => const SuccessPayment()),
        GetPage(name: "/unsuccessfull", page: () => const FailedPayment()),
        GetPage(name: "/ResetPass",     page: () => const ResetPassword()),
        GetPage(name: "/generate",      page: ()=> const generateQR()),
        GetPage(name: "/Credit",        page: ()=> const CheckOut()),

      ],
    );
  }
}
