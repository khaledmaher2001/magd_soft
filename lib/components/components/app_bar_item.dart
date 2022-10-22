import 'package:flutter/material.dart';

class AppBarItem extends StatelessWidget {
  const AppBarItem({Key? key, required this.icon, required this.onPress}) : super(key: key);
  final IconData icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            spreadRadius: 1,
            offset: Offset(0,3),
          ),
        ],
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(icon,color: Colors.grey,),
      ),
    );
  }
}
