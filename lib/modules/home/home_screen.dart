import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magd_soft_task/shared/cubit/cubit.dart';
import '../../components/components/app_bar_item.dart';
import '../../components/components/back_ground_gradiant.dart';
import '../../components/components/category_item.dart';
import '../../components/components/custom_banner_item.dart';
import '../../components/components/custom_bottom_bar.dart';
import '../../components/components/default_text_form_field.dart';
import '../../components/components/product_item.dart';
import '../../components/constants/constant.dart';
import '../../models/category_model.dart';
import '../../shared/cubit/states.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "homeScreen";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getProductsData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Stack(
                children: [
                  // this widget is a reusable components for back ground gradiant
                  const BackGroundGradiant(),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: DefaultTextFormField(
                                  suffixIcon: Icons.search_rounded,
                                  controller: searchController,
                                  type: TextInputType.text,
                                  hintText: "Search"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppBarItem(
                              onPress: () {},
                              icon: Icons.filter_list_alt,
                            )
                          ],
                        ),
                      ),
                      // this widget is a reusable components for banner
                      const CustomBannerItem(),

                      Expanded(
                        child: state is GetProductsLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            :Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                height: 45,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => CategoryItem(
                                      onTap: () {
                                        if (index != 0) {
                                          Navigator.pushNamed(context, "category",
                                              arguments:
                                              Category.categories[index]);
                                        }
                                      },
                                      image: Category.categories[index].image,
                                      text: Category.categories[index].name,
                                      color: Colors.white,
                                      textColor: Colors.black,
                                      index: index,
                                    ),
                                    separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    itemCount: 4),
                              ),
                            ),
                            Expanded(
                              child:  Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: StaggeredGridView.countBuilder(
                                  physics: const BouncingScrollPhysics(),
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  itemCount:
                                  productModel.products.length + 1,
                                  itemBuilder: (context, index) {
                                    return index == 0
                                        ? const Text(
                                      "Recommended for You",
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    )
                                        : ProductItem(
                                      index: index,
                                      company: productModel
                                          .products[index - 1].company,
                                      name: productModel
                                          .products[index - 1].name,
                                      price: productModel
                                          .products[index - 1].price,
                                      image: productModel
                                          .products[index - 1].image,
                                      favIconPress: () {
                                        cubit.changeFav(index: index);
                                      },
                                      itemTap: () {
                                        productId = productModel
                                            .products[index - 1].id;
                                        Navigator.pushNamed(
                                          context,
                                          "productDetails",
                                          arguments: productModel,
                                        );
                                      },
                                    );
                                  },
                                  staggeredTileBuilder: (index) {
                                    return index == 0
                                        ? const StaggeredTile.count(
                                        1, .5) //For Text
                                        : const StaggeredTile.count(
                                        1, 1.5); // others item
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              isExtended: true,
              onPressed: () {},
              elevation: 10,
              child: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar:const CustomBottomBar(),
          );
        },
      ),
    );
  }
}
