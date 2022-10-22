import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/modules/login/cubit/states.dart';
import 'package:magd_soft_task/shared/styles/colors.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../components/components/back_ground_gradiant.dart';
import '../../components/components/default_button.dart';
import '../../components/components/toast.dart';
import '../../components/constants/constant.dart';
import '../login/cubit/cubit.dart';

class VerifyPhoneScreen extends StatelessWidget {
  VerifyPhoneScreen({Key? key, required this.phone,})
      : super(key: key);

  static const String routeName = "verifyPhoneScreen";

  var pinCodeController = TextEditingController();
 final String phone;


  static Route route({
  required String phone
}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => VerifyPhoneScreen(phone: phone,),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is OtpSuccessState) {
            if (state.model.status == 200) {
              toast(text: state.model.message, color: defaultColor);
              Navigator.pushNamedAndRemoveUntil(context, "helpScreen", (route) => false);
            } else {
              toast(text: state.model.message, color: Colors.red);
            }
          } else if (state is OtpErrorState) {
            toast(
              text: state.error,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    // this widget is a reusable components for back ground gradiant
                    const BackGroundGradiant(),
                    SizedBox(
                      width: width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.07),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Verify Phone",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: height * 0.2,
                            ),
                            PinCodeTextField(
                              length: 4,
                              animationType: AnimationType.fade,
                              boxShadows: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(
                                      2, 3), // changes position of shadow
                                ),
                              ],
                              keyboardType: TextInputType.number,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                selectedFillColor: Colors.white,
                                activeColor: Colors.white,
                                inactiveColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                fieldHeight: 70,
                                fieldWidth: 60,
                                activeFillColor: Colors.white,
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              backgroundColor: Colors.transparent,
                              enableActiveFill: true,
                              controller: pinCodeController,
                              onCompleted: (v) {
                                pinCodeController.text = v;
                                if (kDebugMode) {
                                  print("pin code : ${pinCodeController.text}");
                                }
                              },
                              beforeTextPaste: (text) {
                                return true;
                              },
                              appContext: context,
                              onChanged: (String value) {},
                            ),
                            SizedBox(
                              height: height * 0.09,
                            ),
                            TextButton(
                              onPressed: () {
                                LoginCubit.get(context)
                                    .userLogin(phone: phone, name: name);
                              },
                              child: const Text(
                                "Resend Code",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: defaultColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.1,
                            ),
                            state is OtpLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : DefaultButton(
                                    onPress: () {
                                      if (pinCodeController.text.isEmpty) {
                                        toast(
                                            text: "Pin Code is Empty",
                                            color: Colors.red);
                                      } else if (pinCodeController
                                              .text.isNotEmpty &&
                                          pinCodeController.text.length < 4) {
                                        toast(
                                            text:
                                                "Pin Code is less than 4 digits",
                                            color: Colors.red);
                                      } else {
                                        LoginCubit.get(context).otp(
                                          phone: phone,
                                          code: "6523",
                                        );
                                      }
                                    },
                                    text: "Verify",
                                  )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
