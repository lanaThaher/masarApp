abstract class PracticalBookState {}

class PracticalBookInitialState extends PracticalBookState {}

class PracticalBookingSuccessState extends PracticalBookState {}

class PracticalBookingMoreThan10SameTime extends PracticalBookState {
  final String message;
  PracticalBookingMoreThan10SameTime(this.message);
}

class PracticalBookingMoreThan400SameDay extends PracticalBookState {
  final String message;
  PracticalBookingMoreThan400SameDay(this.message);
}

class PracticalBookingFridayOrSaturdayState extends PracticalBookState {
  final String message;
  PracticalBookingFridayOrSaturdayState(this.message);
}

class PracticalBookingInvalidAfter3TimeState extends PracticalBookState {
  final String message;
  PracticalBookingInvalidAfter3TimeState(this.message);
}

class PracticalBookingInvalidBefore8TimeState extends PracticalBookState {
  final String message;
  PracticalBookingInvalidBefore8TimeState(this.message);
}

class PracticalBookingFailureState extends PracticalBookState {
  final String errMessage;
  PracticalBookingFailureState(this.errMessage);
}
