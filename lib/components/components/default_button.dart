import 'package:flutter/material.dart';
import 'package:magd_soft_task/shared/styles/colors.dart';

class DefaultButton extends StatelessWidget {
  const  DefaultButton({Key? key, required this.onPress, required this.text})
      : super(key: key);
  final void Function()? onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: width / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              defaultColor,
              defaultColor.withOpacity(0.5),
              defaultColor.withOpacity(0.27),
            ],
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
          ),
          borderRadius: BorderRadius.circular(width * .12),
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: onPress,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * .015),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
