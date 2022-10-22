import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/shared/cubit/cubit.dart';
import 'package:magd_soft_task/shared/cubit/states.dart';
import 'package:magd_soft_task/shared/styles/colors.dart';

import '../constants/constant.dart';

class ProductItem extends StatelessWidget {
  final String company;
  final String name;
  final String price;
  final String image;
  final int index;
  final void Function()? favIconPress;
  final void Function()? itemTap;

  ProductItem({
    required this.company,
    required this.name,
    required this.price,
    required this.image,
    required this.favIconPress,
    required this.itemTap, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return GestureDetector(
          onTap: itemTap,
          child: Card(
            color: Colors.white,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.19,
                      left: width * 0.02,
                      right: width * 0.02,
                      bottom: height * 0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company,
                        style: const TextStyle(
                          fontSize: 18,
                          color: defaultColor,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff464646),
                          ),
                        ),
                      ),
                      Text(
                        "$price EGP",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff464646),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.18,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 3),
                          blurRadius: 7),
                    ],
                  ),
                  child: Image.network(image),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: IconButton(
                    onPressed: favIconPress,
                    icon:cubit.favorites[index-1][index]?const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ) : const Icon(
                      Icons.favorite_border_outlined,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors:[
                          defaultColor,
                          defaultColor.withOpacity(0),
                        ],
                      ),
                      borderRadius:const BorderRadius.only(
                        topLeft: Radius.circular(30),
                      )
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.add,color: Colors.white,),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
