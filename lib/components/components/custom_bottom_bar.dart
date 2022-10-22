import 'package:flutter/material.dart';

import '../../shared/network/local/cache_helper.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return  BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.grey,
            ),
            onPressed: () {
              CacheHelper.removeData(key: "status");
              Navigator.pushNamedAndRemoveUntil(
                  context, "loginScreen", (route) => false);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.23),
            child: IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
