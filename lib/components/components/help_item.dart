import 'package:flutter/material.dart';
import 'package:magd_soft_task/shared/cubit/cubit.dart';
import '../../shared/styles/colors.dart';

class HelpItem extends StatelessWidget {
  const HelpItem({
    Key? key,
    required this.onTap,
    required this.question,
    required this.answer, required this.index,
  }) : super(key: key);
  final void Function()? onTap;
  final String question;
  final String answer;
  final int index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 3),
              blurRadius: 5,
              spreadRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  question,
                  style: const TextStyle(
                    fontSize: 17,
                    color: defaultColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppCubit.get(context).isDown[index]
                    ? const SizedBox()
                    : SizedBox(
                        height: height * 0.06,
                      ),
                Icon(
                  AppCubit.get(context).isDown[index]
                      ? Icons.keyboard_arrow_down_outlined
                      : Icons.keyboard_arrow_up_outlined,
                  size: 28,
                )
              ],
            ),
            !AppCubit.get(context).isDown [index]

                ? Text(
                    answer,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color(0xff464646),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
