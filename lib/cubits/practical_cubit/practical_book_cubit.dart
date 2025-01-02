import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar_app/cubits/practical_cubit/practical_book_state.dart';

class PracticalBookCubit extends Cubit<PracticalBookState> {
  PracticalBookCubit() : super(PracticalBookInitialState());
  static PracticalBookCubit get(context) => BlocProvider.of(context);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> bookPracticalAppointment(DateTime date, TimeOfDay time) async {
    // Check if the user is logged in
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      emit(PracticalBookingFailureState("User not logged in."));
      return;
    }

    final String userId = currentUser.uid;

    // Not Friday or Saturday
    if (date.weekday == DateTime.friday || date.weekday == DateTime.saturday) {
      emit(PracticalBookingFridayOrSaturdayState(
          "Booking is not allowed on Fridays and Saturdays."));
      return;
    }

    final startOfDay = const TimeOfDay(hour: 8, minute: 0);
    final cutOffTime = const TimeOfDay(hour: 15, minute: 0);
    if (time.hour < startOfDay.hour ||
        (time.hour == startOfDay.hour && time.minute < startOfDay.minute)) {
      emit(PracticalBookingInvalidAfter3TimeState(
          "Booking is not allowed before 8:00 AM."));
      return;
    }
    if (time.hour > cutOffTime.hour ||
        (time.hour == cutOffTime.hour && time.minute > cutOffTime.minute)) {
      emit(PracticalBookingInvalidBefore8TimeState(
          "Booking is not allowed after 3:00 PM."));
      return;
    }

    final String dateString = "${date.year}-${date.month}-${date.day}";
    final DocumentReference bookingDoc =
        firestore.collection('bookingsPractialAppointments').doc(dateString);

    try {
      await firestore.runTransaction((transaction) async {
        final snapshot = await transaction.get(bookingDoc);

        if (snapshot.exists) {
          final data = snapshot.data() as Map<String, dynamic>;
          final timeSlots = Map<String, dynamic>.from(data['time_slots'] ?? {});
          final userBookings =
              Map<String, dynamic>.from(data['user_bookings'] ?? {});

          final String formattedTime =
              "${time.hour}:${time.minute.toString().padLeft(2, '0')}";
          final int currentCount = timeSlots[formattedTime] ?? 0;
          final int dailyCount = timeSlots.values.fold(0, (a, b) => b + a);

          if (currentCount >= 10) {
            emit(PracticalBookingMoreThan10SameTime(
                "This time slot is fully booked."));
            return;
          }
          if (dailyCount >= 400) {
            emit(PracticalBookingMoreThan400SameDay(
                "The daily booking limit has been reached."));
            return;
          }

          // Add booking for the user
          timeSlots[formattedTime] = currentCount + 1;
          userBookings[userId] = formattedTime;
          transaction.update(bookingDoc, {
            'time_slots': timeSlots,
            'user_bookings': userBookings,
          });
        } else {
          final String formattedTime =
              "${time.hour}:${time.minute.toString().padLeft(2, '0')}";
          transaction.set(bookingDoc, {
            'time_slots': {formattedTime: 1},
            'user_bookings': {userId: formattedTime},
          });
        }
      });

      emit(PracticalBookingSuccessState());
    } catch (e) {
      emit(PracticalBookingFailureState(e.toString()));
    }
  }
}
