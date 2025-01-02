abstract class BookStates {}

class BookingInitialState extends BookStates {}

class BookingSuccessState extends BookStates {}

class BookingMoreThan10SameTime extends BookStates {
  final String message;
  BookingMoreThan10SameTime(this.message);
}

class BookingMoreThan400SameDay extends BookStates {
  final String message;
  BookingMoreThan400SameDay(this.message);
}

class BookingFridayOrSaturdayState extends BookStates {
  final String message;
  BookingFridayOrSaturdayState(this.message);
}

class BookingInvalidTimeAfter3State extends BookStates {
  final String message;
  BookingInvalidTimeAfter3State(this.message);
}

class BookingInvalidTimeBefore8State extends BookStates {
  final String message;
  BookingInvalidTimeBefore8State(this.message);
}

class BookingFailureState extends BookStates {
  final String errMessage;
  BookingFailureState(this.errMessage);
}
