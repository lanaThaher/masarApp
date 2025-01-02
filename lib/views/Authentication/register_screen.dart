//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:masar_app/components/custom_button.dart';
import 'package:masar_app/components/custom_form_field.dart';
import 'package:masar_app/constant.dart';
import 'package:masar_app/cubits/register_cubit/register_user_cubit.dart';
import 'package:masar_app/cubits/register_cubit/register_user_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool obscureText = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController birthdayDate = TextEditingController();
  TextEditingController cityContrller = TextEditingController();
  String? selectedCity;
  List<String> cities = [
    'Amman',
    'Aqaba',
    'Madaba',
    'Irbid',
    'Jerash',
    'Zarqa',
    'Karak',
    'Mafraq',
    'Ajloun',
    'Balqa',
    'Tafileh',
    'Maan'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterUserCubit(),
      child: BlocConsumer<RegisterUserCubit, RegisterUserState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: kBackGroundColor,
              appBar: AppBar(
                backgroundColor: kBackGroundColor,
                iconTheme: const IconThemeData(color: kPrimaryColor),
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/masar_logo.png',
                          width: 210,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        CustomFormField(
                          controller: firstName,
                          hintText: '85'.tr,
                          keyboardType: TextInputType.text,
                          validatorMessage: '86'.tr,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        CustomFormField(
                          controller: lastName,
                          hintText: '87'.tr,
                          keyboardType: TextInputType.text,
                          validatorMessage: '88'.tr,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        CustomFormField(
                            controller: birthdayDate,
                            hintText: '89'.tr,
                            validatorMessage: '83'.tr,
                            keyboardType: TextInputType.none,
                            suffixIcon: Icons.calendar_today_rounded,
                            suffixPressed: () => showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now()
                                      .subtract(const Duration(days: 6570)),
                                  firstDate: DateTime.now()
                                      .subtract(const Duration(days: 14600)),
                                  lastDate: DateTime.now()
                                      .subtract(const Duration(days: 6570)),
                                ).then((dateValue) {
                                  birthdayDate.text =
                                      DateFormat.yMMMd().format(dateValue!);
                                })),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 68,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: kPrimaryBackGroundColor,
                          ),
                          child: DropdownButton<String>(
                            hint: Text("90".tr,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: kPrimaryTextColor,
                                )),
                            isExpanded: true,
                            value: selectedCity,
                            underline: const SizedBox(),
                            padding: const EdgeInsetsDirectional.only(
                                start: 20.0, end: 15.0, top: 5.0),
                            iconSize: 30.0,
                            style:
                                const TextStyle(color: bbblack, fontSize: 20.0),
                            items: cities.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedCity = newValue;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        CustomFormField(
                          controller: email,
                          hintText: "38".tr,
                          keyboardType: TextInputType.emailAddress,
                          validatorMessage: "44".tr,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        CustomFormField(
                          controller: password,
                          hintText: "39".tr,
                          isObscureText:
                              RegisterUserCubit.get(context).isPassword,
                          keyboardType: TextInputType.visiblePassword,
                          validatorMessage: "45".tr,
                          suffixIcon: RegisterUserCubit.get(context).suffix,
                          suffixPressed: () {
                            RegisterUserCubit.get(context)
                                .changePasswordVisibility();
                          },
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Center(
                          child: Button(
                              text: "43".tr,
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  // RegisterUserCubit.get(context).createUser(
                                  //     email: email.text,
                                  //     password: password.text,
                                  //     FirstName: firstName.text,
                                  //     LastName: lastName.text,
                                  //     DOB: birthdayDate.text,
                                  //     City: selectedCity.toString());
                                  RegisterUserCubit.get(context).userRegister(
                                    context: context,
                                    email: email.text,
                                    password: password.text,
                                    City: selectedCity.toString(),
                                    DOB: birthdayDate.text,
                                    FirstName: firstName.text,
                                    LastName: lastName.text,
                                  );
                                  Future.delayed(Duration(seconds: 5),
                                      () => Get.offAllNamed("login"));
                                }
                              }),
                        )
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
