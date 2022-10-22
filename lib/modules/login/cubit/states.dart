import 'package:magd_soft_task/models/login_model.dart';
import 'package:magd_soft_task/models/otp_model.dart';

abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel model;

  LoginSuccessState(this.model);
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class OtpLoadingState extends LoginStates {}

class OtpSuccessState extends LoginStates {
  final OtpModel model;

  OtpSuccessState(this.model);
}

class OtpErrorState extends LoginStates {
  final String error;

  OtpErrorState(this.error);
}
