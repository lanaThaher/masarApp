abstract class RegisterUserState {}

class RegisterUserInitialState extends RegisterUserState {}

class RegisterUserLoadingState extends RegisterUserState {}

class RegisterPasswordVisibilityState extends RegisterUserState {}

class CreateUserSuccessState extends RegisterUserState {}

class CreateUserFailureState extends RegisterUserState {}

class RegisterUserSuccessState extends RegisterUserState {}

class RegisterUserfaliuerState extends RegisterUserState {
  final String errMessage;

  RegisterUserfaliuerState(this.errMessage);
}
