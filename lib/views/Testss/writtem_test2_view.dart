import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/custom_button.dart';
import 'package:masar_app/constant.dart';
import 'package:masar_app/components/custom_column_date_picker.dart';
import 'package:masar_app/components/custom_column_time_picker.dart';
import 'package:masar_app/cubits/book_cubit/book_cubit.dart';
import 'package:masar_app/cubits/book_cubit/book_states.dart';
import 'package:masar_app/cubits/practical_cubit/practical_book_cubit.dart';
import 'package:masar_app/cubits/practical_cubit/practical_book_state.dart';

class WrittenTest2View extends StatefulWidget {
  const WrittenTest2View({super.key});

  @override
  State<WrittenTest2View> createState() => _WrittenTest2ViewState();
}

class _WrittenTest2ViewState extends State<WrittenTest2View> {
  DateTime? selectedDate; // Use DateTime instead of String
  TimeOfDay? selectedTime; // Use TimeOfDay instead of String
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(),
      child: BlocListener<BookingCubit, BookStates>(
        listener: (context, state) {
          if (state is BookingSuccessState) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.topSlide,
              title: "99".tr,
              desc: "98".tr,
              btnOkOnPress: () {
                Get.toNamed("Credit");
              },
            ).show();
          } else if (state is BookingFridayOrSaturdayState) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.topSlide,
              title: "102".tr,
              desc: "103".tr,
              btnOkOnPress: () {},
            ).show();
          } else if (state is BookingMoreThan10SameTime) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.topSlide,
              title: 'Slot Full',
              desc: state.message,
              btnOkOnPress: () {},
            ).show();
          } else if (state is BookingInvalidTimeAfter3State) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.topSlide,
              title: "101".tr,
              desc: "101".tr,
              btnOkOnPress: () {},
            ).show();
          } else if (state is BookingInvalidTimeBefore8State) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.topSlide,
              title: "100".tr,
              desc: "100".tr,
              btnOkOnPress: () {},
            ).show();
          } else if (state is BookingMoreThan400SameDay) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.topSlide,
              title: 'Daily Limit Reached',
              desc: state.message,
              btnOkOnPress: () {},
            ).show();
          } else if (state is BookingFailureState) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.topSlide,
              title: 'Booking Failed',
              desc: state.errMessage,
              btnOkOnPress: () {},
            ).show();
          }
        },
        child: Scaffold(
          backgroundColor: kBackGroundColor,
          appBar: AppBar(
            backgroundColor: kBackGroundColor,
            iconTheme: const IconThemeData(color: kPrimaryColor),
          ),
          body: Builder(
            builder: (context) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "56".tr,
                      style: const TextStyle(
                        color: fontColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "97".tr,
                      style: const TextStyle(
                        color: kPrimaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomColumnDatePicker(
                          onTap: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2026),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                selectedDate = pickedDate;
                                print("Selected Date: $selectedDate");
                              });
                            }
                          },
                          text: "59".tr,
                          details: selectedDate != null
                              ? DateFormat('MMM d, yyyy').format(selectedDate!)
                              : "78".tr,
                          icon: Icons.calendar_today,
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: CustomColumnTimePicker(
                            onTap: () async {
                              final pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  selectedTime = pickedTime;
                                  print("Selected Time: $selectedTime");
                                });
                              }
                            },
                            text: "60".tr,
                            details: selectedTime != null
                                ? selectedTime!.format(context)
                                : "61".tr,
                            icon: Icons.schedule,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    Center(
                      child: Button(
                        onTap: () {
                          if (selectedDate != null && selectedTime != null) {
                            BlocProvider.of<BookingCubit>(context)
                                .bookAppointment(
                              selectedDate!,
                              selectedTime!,
                            );
                          } else {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.topSlide,
                              title: 'Incomplete Selection',
                              desc: 'Please select both a date and time.',
                              btnOkOnPress: () {},
                            ).show();
                          }
                        },
                        text: "29".tr,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
