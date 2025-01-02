abstract class LoginUserState {}

class LoginUserInitialState extends LoginUserState {}

class LoginPasswordVisibilityState extends LoginUserState {}

class LoginUserLoadingState extends LoginUserState {}

class LoginUserSuccessState extends LoginUserState {}

class LoginUserFailureState extends LoginUserState {
  final String errMessage;

  LoginUserFailureState(this.errMessage);
}
