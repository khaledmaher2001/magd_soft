import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.image, required this.text, required this.color, required this.textColor,required this.onTap, required this.index}) : super(key: key);
  final String image;
  final String text;
  final Color color;
  final Color textColor;
  final Function()? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 4),
        decoration: BoxDecoration(
          color: index == 0 ? defaultColor : color,
          borderRadius: BorderRadius.circular(30),

        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: Colors.white,

              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Image.asset(

                image,
                height: 35,
                width: 35,

              ),
            ),
            const SizedBox(width: 5,),
            Text(
              text,
              style: TextStyle(
                color: index == 0? Colors.white : textColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
