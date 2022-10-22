import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magd_soft_task/shared/styles/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  CustomAppBar(
      Key? key,
      this.title,
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: defaultColor.withOpacity(0.85),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0.0,
      title: Text(title,style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 30
      )),

    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}