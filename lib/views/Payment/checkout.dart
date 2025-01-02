import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:masar_app/components/app_bar.dart';
import 'package:masar_app/components/credit_card_componentt/card_input_formatter.dart';
import 'package:masar_app/components/credit_card_componentt/card_string.dart';
import 'package:masar_app/components/credit_card_componentt/card_type.dart';
import 'package:masar_app/components/credit_card_componentt/card_utils.dart';
import 'package:masar_app/components/credit_card_componentt/month_formatter.dart';
import 'package:masar_app/components/custom_button.dart';
import 'package:masar_app/components/custom_form_field.dart';
import 'package:masar_app/components/navigation_bar.dart';
import 'package:masar_app/components/radio_button.dart';

import '../../constant.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cardNumberControl = TextEditingController();

  TextEditingController dateControl = TextEditingController();

  CardType cardType = CardType.Invalid;

  void getCardTypeFrmNumber() {
    // based on the first 6 digit we can identify the type
    if (cardNumberControl.text.length <= 6) {
      String cardNum = CardUtils.getCleanedNumber(cardNumberControl.text);
      CardType type = CardUtils.getCardTypeFrmNumber(cardNum);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  void initState() {
    cardNumberControl.addListener(
      () {
        getCardTypeFrmNumber();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: App_Bar(title: "14".tr),
      bottomNavigationBar: const bottomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "15".tr,
                style: const TextStyle(
                    color: fontColor,
                    fontSize: 23,
                    fontWeight: FontWeight.w400),
              ),
              const RadioButton(),
              const SizedBox(height: 20),

              Text("18".tr,
                  style: const TextStyle(
                      color: fontColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      height: 2)),
              //Card Holder Name
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                  LengthLimitingTextInputFormatter(26),
                ],
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.fieldReq;
                  } else if (value!.length <= 15) {
                    return Strings.incompleteName;
                  }
                },
                decoration: InputDecoration(
                  hintText: "92".tr,
                  hintStyle: const TextStyle(
                      color: fontColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset("assets/icon/user.svg"),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  filled: true,
                  fillColor: const Color.fromRGBO(232, 232, 232, 1.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Text("19".tr,
                  style: const TextStyle(
                      color: fontColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      height: 2)),
              //Card Number
              TextFormField(
                controller: cardNumberControl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.fieldReq;
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                  CardInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "93".tr,
                  hintStyle: const TextStyle(
                      color: fontColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                  suffixIcon: cardType == CardType.Invalid
                      ? null
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CardUtils.getCardIcon(cardType),
                        ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SvgPicture.asset("assets/icon/card.svg"),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  filled: true,
                  fillColor: const Color.fromRGBO(232, 232, 232, 1.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("20".tr,
                        style: const TextStyle(
                            color: fontColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            height: 2)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 53),
                    child: Text("21".tr,
                        style: const TextStyle(
                            color: fontColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            height: 2)),
                  )
                ],
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //date
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        final errorMessage = CardUtils.validateDate(value);
                        return errorMessage;
                      }
                    },
                    controller: dateControl,
                    // keyboardType: TextInputType.datetime,
                    // inputFormatters: [
                    // FilteringTextInputFormatter.digitsOnly,
                    //LengthLimitingTextInputFormatter(8),
                    // CardMonthInputFormatter() ],
                    decoration: InputDecoration(
                      hintText: "94".tr,
                      hintStyle: const TextStyle(
                          color: fontColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                      prefixIcon: IconButton(
                          onPressed: () => showDatePicker(
                                context: context,
                                initialDate: DateTime.now()
                                    .subtract(const Duration(days: 6570)),
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2050),
                              ),
                          icon: const Icon(
                            Icons.calendar_today_rounded,
                            color: Color.fromARGB(121, 0, 0, 0),
                          )),
                      //Padding(
                      //  padding: const EdgeInsets.all(8.0),
                      //child: SvgPicture.asset("assets/icon/calender.svg"),),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      filled: true,
                      fillColor: const Color.fromRGBO(232, 232, 232, 1.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),

                //cvv
                Expanded(
                    child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Strings.fieldReq;
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  decoration: InputDecoration(
                      hintText: "95".tr,
                      hintStyle: const TextStyle(
                          color: fontColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset("assets/icon/Cvv.svg"),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(232, 232, 232, 1.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                )),
              ]),
              const SizedBox(height: 40),
              Align(
                  alignment: Alignment.center,
                  child: Button(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          Get.toNamed("verification");
                        }
                      },
                      text: "35".tr)),
            ],
          ),
        ),
      ),
    );
  }
}
