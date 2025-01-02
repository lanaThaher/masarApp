import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar_app/cubits/book_cubit/book_states.dart';

class BookingCubit extends Cubit<BookStates> {
  BookingCubit() : super(BookingInitialState());

  static BookingCubit get(context) => BlocProvider.of(context);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> bookAppointment(DateTime date, TimeOfDay time) async {
    // Check if the user is logged in
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      emit(BookingFailureState("User not logged in."));
      return;
    }

    final String userId = currentUser.uid;

    // Not Friday or Saturday
    if (date.weekday == DateTime.friday || date.weekday == DateTime.saturday) {
      emit(BookingFridayOrSaturdayState(
          "Booking is not allowed on Fridays and Saturdays."));
      return;
    }

    final startOfDay = const TimeOfDay(hour: 8, minute: 0);
    final cutOffTime = const TimeOfDay(hour: 15, minute: 0);
    if (time.hour < startOfDay.hour ||
        (time.hour == startOfDay.hour && time.minute < startOfDay.minute)) {
      emit(BookingInvalidTimeAfter3State(
          "Booking is not allowed before 8:00 AM."));
      return;
    }
    if (time.hour > cutOffTime.hour ||
        (time.hour == cutOffTime.hour && time.minute > cutOffTime.minute)) {
      emit(BookingInvalidTimeBefore8State(
          "Booking is not allowed after 3:00 PM."));
      return;
    }

    final String dateString = "${date.year}-${date.month}-${date.day}";
    final DocumentReference bookingDoc =
        firestore.collection('bookingsAppointments').doc(dateString);

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
            emit(BookingMoreThan10SameTime("This time slot is fully booked."));
            return;
          }
          if (dailyCount >= 400) {
            emit(BookingMoreThan400SameDay(
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

      emit(BookingSuccessState());
    } catch (e) {
      emit(BookingFailureState(e.toString()));
    }
  }
}
