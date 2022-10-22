import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/modules/login/cubit/cubit.dart';
import 'package:magd_soft_task/modules/login/cubit/states.dart';
import 'package:magd_soft_task/shared/network/local/cache_helper.dart';
import 'package:magd_soft_task/shared/styles/colors.dart';

import '../../components/components/default_button.dart';
import '../../components/components/default_text_form_field.dart';
import '../../components/components/social_items.dart';
import '../../components/components/toast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "loginScreen";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName,),
      builder: (_) => LoginScreen(),
    );
  }

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.model.status == 200) {
              CacheHelper.saveData(key: "status", value: state.model.status);
              if(state.model.message=="Account Created Successfully"){
                toast(text: state.model.message, color: defaultColor);
                Navigator.pushNamed(context, "verifyPhoneScreen",arguments: phoneController.text);
              }else if(state.model.message=="Account Verified"){
                toast(text: state.model.message, color: defaultColor);
                Navigator.pushNamedAndRemoveUntil(context, "homeScreen", (route) => false);
              }

              if (kDebugMode) {
                print("from cache :${CacheHelper.getData(key: "status")}");
              }

            } else {
              toast(text: state.model.message, color: Colors.red);
            }
          } else if (state is LoginErrorState) {
            toast(text: state.error, color: Colors.red);
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Stack(
                  children: [
                    Image.asset("assets/images/bg1.png"),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 40),
                        height: height * 0.61,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    height: 2,
                                    color: const Color(0xff639FD7),
                                  )),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("OR",
                                        style: TextStyle(
                                            color: Color(0xff639FD7))),
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: 2,
                                    color: const Color(0xff639FD7),
                                  )),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SocialItems(image: "assets/images/f.png"),
                                SocialItems(image: "assets/images/ios 2.png"),
                                SocialItems(
                                    image:
                                        "assets/images/Google__G__Logo 2.png"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: height * 0.2,
                          left: width * 0.06,
                          right: width * 0.06,
                          bottom: height * 0.31,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          // height: height * 0.45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(2, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Welcome",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 5),
                                width: double.infinity,
                                height: 3.3,
                                color: defaultColor.withOpacity(0.7),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              DefaultTextFormField(
                                controller: nameController,
                                type: TextInputType.text,
                                hintText: "Enter Your Full Name",
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "Name Must Not be Empty";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DefaultTextFormField(
                                controller: phoneController,
                                type: TextInputType.phone,
                                hintText: "Enter Your Phone Number",
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "Phone Must Not be Empty";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              state is LoginLoadingState ? const Center(child: CircularProgressIndicator()) : DefaultButton(
                                text: "Login",
                                onPress: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      phone: phoneController.text,
                                      name: nameController.text,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
