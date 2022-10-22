import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/models/login_model.dart';
import 'package:magd_soft_task/models/otp_model.dart';
import 'package:magd_soft_task/modules/login/cubit/states.dart';
import 'package:magd_soft_task/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;
  late OtpModel otpModel;


  // this function to user login and confirm if the user phone is verified or not
  userLogin({
    required String phone,
    required String name,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: "verifyPhone", data: {
      "phone": phone,
      "name": name,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel.status);
      print(loginModel.message);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  // this function to send an otp to the user to verify his phone number
  otp({
    required String phone,
    required String code,
  }) {
    emit(OtpLoadingState());
    DioHelper.postData(url: "otp", data: {
      "phone": phone,
      "code": code,
    }).then((value) {
      otpModel = OtpModel.fromJson(value.data);
      print(otpModel.status);
      print(otpModel.message);
      emit(OtpSuccessState(otpModel));
    }).catchError((error) {
      print(error.toString());
      emit(OtpErrorState(error.toString()));
    });
  }
}
