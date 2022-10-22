import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/shared/cubit/cubit.dart';

import '../../components/components/back_ground_gradiant.dart';
import '../../components/components/default_button.dart';
import '../../components/components/help_item.dart';
import '../../shared/cubit/states.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);
  static const String routeName = "helpScreen";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(
        name: routeName,
      ),
      builder: (_) => const HelpScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getHelpData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  // this widget is a reusable components for back ground gradiant
                  const BackGroundGradiant(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.07,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Help",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: state is GetHelpLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) => HelpItem(
                                    index: index,
                                    question:
                                        cubit.helpModel.help[index].question,
                                    answer: cubit.helpModel.help[index].answer,
                                    onTap: () {
                                      AppCubit.get(context)
                                          .changeHelpItem(index);
                                    },
                                  ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: height * 0.03,
                                  ),
                                  itemCount: cubit.helpModel.help.length,
                                ),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DefaultButton(
                              onPress: () {
                                Navigator.pushNamedAndRemoveUntil(context, "homeScreen", (route) => false);
                              },
                              text: "Continue"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
