
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/components/components/product_item.dart';
import 'package:magd_soft_task/models/products_model.dart';
import 'package:magd_soft_task/shared/cubit/cubit.dart';
import 'package:magd_soft_task/shared/cubit/states.dart';

import '../../components/components/back_ground_gradiant.dart';
import '../../models/category_model.dart';
import '../../components/constants/constant.dart';
import '../../components/components/custom_app_bar.dart';


class CategoryScreen extends StatelessWidget {
  static const String routeName = 'category';

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CategoryScreen(
          category: category,
        ));
  }

  final Category category;

  const CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final List<Products> categoryProducts = productModel.products.where((product) => product.company == category.name).toList();

          return  Scaffold(
            appBar: CustomAppBar(key, category.name),
            body: Stack(
              children: [
                const BackGroundGradiant(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                      mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.64
                      ),
                      itemCount: categoryProducts.length,
                      itemBuilder: (BuildContext context,int index){
                        return ProductItem(
                          index: index+1,
                          name: categoryProducts[index].name,
                          image:categoryProducts[index].image ,
                          company: categoryProducts[index].company,
                          favIconPress: (){
                            AppCubit.get(context).changeFav(index: index+1);
                          },
                          itemTap: (){},
                          price: categoryProducts[index].price,
                        );
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }}