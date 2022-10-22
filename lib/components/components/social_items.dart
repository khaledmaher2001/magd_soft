import 'package:flutter/material.dart';

class SocialItems extends StatelessWidget {
  const SocialItems({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(2, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Image.asset(image),
    );
  }
}
