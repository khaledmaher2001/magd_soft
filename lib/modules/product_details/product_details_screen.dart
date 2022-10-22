import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/models/products_model.dart';
import 'package:magd_soft_task/modules/home/home_screen.dart';
import 'package:magd_soft_task/shared/cubit/cubit.dart';
import '../../components/components/app_bar_item.dart';
import '../../components/components/back_ground_gradiant.dart';
import '../../components/constants/constant.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/colors.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({ required this.model});

  static const String routeName = "productDetails";
  final ProductsModel model;


  static Route route({required ProductsModel model}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductDetailsScreen(model: model),
    );
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  // this widget is a reusable components for back ground gradiant
                  const BackGroundGradiant(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.04,
                          ),
                          AppBarItem(
                            icon: Icons.arrow_back_ios,
                            onPress: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                  (route) => false);
                            },
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            model.products[productId-1].name,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            "Type: ${model.products[productId-1].type}",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Container(
                            width: width,
                            padding:const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                    spreadRadius: 1),
                              ],
                            ),
                            child: Image.network(
                              model.products[productId-1].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: width * 0.25,
                            padding:const EdgeInsets.all(5),
                            margin: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                    spreadRadius: 1),
                              ],
                            ),
                            child: Image.network(
                              model.products[productId-1].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: width,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(0, 3),
                                    spreadRadius: 1),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset(
                                    "assets/images/acer-logo-0 1.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${model.products[productId-1].company} Official Store",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff464646),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.005,
                                      ),
                                     const  Text(
                                        "View More",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff464646),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Price",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffB1B1B1),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      "${model.products[productId-1].price} EGP",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff464646),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * .015),
                                    child: const Text(
                                      "Add To Card",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: height * 0.04),
                              width: width / 1.4,
                              height: 2,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                 const  Text(
                                    "Over View",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.008,
                                  ),
                                  const CircleAvatar(
                                    radius: 4,
                                    backgroundColor: defaultColor,
                                  ),
                                ],
                              ),
                             const  Text(
                                "Spesification",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB1B1B1),
                                ),
                              ),
                             const Text(
                                "Review",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB1B1B1),

                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: height*0.04,),
                          Text(model.products[productId-1].description,style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xffB1B1B1)
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
