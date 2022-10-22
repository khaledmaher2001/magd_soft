import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class BackGroundGradiant extends StatelessWidget {
  const BackGroundGradiant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(
      height: height * 0.5,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            defaultColor.withOpacity(0.85),
            defaultColor.withOpacity(0),
          ],
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
        ),
      ),
    );
  }
}
