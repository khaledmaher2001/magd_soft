import 'package:flutter/material.dart';

class CustomBannerItem extends StatelessWidget {
  const CustomBannerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(

      width: width,
      margin: const EdgeInsets.symmetric(
          horizontal: 30, vertical: 16),
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 16),
      height: 180,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/Acer-Predator-Helios-300-2021 2.png",
          ),
        ),
      ),
      child: const Align(
        alignment: AlignmentDirectional.bottomStart,
        child: Text(
          "New Release \nAcer Predator Helios 300",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
