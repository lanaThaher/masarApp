// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:get/get.dart';
// import 'package:masar_app/components/app_bar.dart';
// import 'package:masar_app/components/custom_button.dart';
// import 'package:masar_app/components/navigation_bar.dart';
// import 'package:masar_app/constant.dart';

// class Creditcard extends StatefulWidget {
//   const Creditcard({super.key});

//   @override
//   State<Creditcard> createState() => _CreditcardState();
// }

// class _CreditcardState extends State<Creditcard> {
//   GlobalKey<FormState> formstate = GlobalKey();

//   String cardHolderName = "";
//   String cardNumber = "";
//   String cvvCode = "";
//   String expiryDate = "";
//   bool showBackView = false;

//   void onCreditModel(CreditCardModel creditCardModel) {
//     cardHolderName = creditCardModel.cardHolderName;
//     cardNumber = creditCardModel.cardNumber;
//     cvvCode = creditCardModel.cvvCode;
//     expiryDate = creditCardModel.expiryDate;
//     showBackView = creditCardModel.isCvvFocused;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBackGroundColor,
//       appBar: App_Bar(title: "14".tr),
//       bottomNavigationBar: const bottomAppBar(),
//       body: SafeArea(
//           child: Column(
//         children: [
//           const SizedBox(height: 10),
//           CreditCardWidget(
//             height: 250,
//             cardNumber: cardNumber,
//             expiryDate: expiryDate,
//             cardHolderName: cardHolderName,
//             cvvCode: cvvCode,
//             showBackView: showBackView,
//             obscureCardCvv: false,
//             obscureCardNumber: false,
//             isHolderNameVisible: true,
//             cardBgColor: kPrimaryColor,
//             animationDuration: const Duration(milliseconds: 1200),
//             onCreditCardWidgetChange: (p0) {},
//             textStyle: const TextStyle(
//                 color: bbblack, fontSize: 23, fontWeight: FontWeight.bold),
//           ),
//           Expanded(
//               child: SingleChildScrollView(
//             child: CreditCardForm(
//                 cardNumber: cardNumber,
//                 expiryDate: expiryDate,
//                 cardHolderName: cardHolderName,
//                 cvvCode: cvvCode,
//                 onCreditCardModelChange: onCreditModel,
//                 formKey: formstate),
//           )),
//           Padding(
//               padding: const EdgeInsets.only(bottom: 80),
//               child: Button(
//                   onTap: () {
//                     Get.toNamed("Verification");
//                   },
//                   text: "35".tr))
//         ],
//       )),
//     );
//   }
// }
