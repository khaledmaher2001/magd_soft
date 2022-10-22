import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/components/constants/constant.dart';
import 'package:magd_soft_task/models/products_model.dart';
import 'package:magd_soft_task/shared/cubit/states.dart';
import 'package:magd_soft_task/shared/network/remote/dio_helper.dart';
import '../../models/help_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  late HelpModel helpModel;
  List<bool> isDown = [];
  List<Map<dynamic, dynamic>> favorites = [
    {1: false},
    {2: false},
    {3: false},
    {4: false},
    {5: false},
    {6: false},
  ];

  // this function to change color of favorites icon

  changeFav({required int index}) {
    favorites[index - 1][index] = !favorites[index - 1][index];
    emit(ChangeFavState());
  }

  // this function to get help data and display it in ui
  getHelpData() {
    emit(GetHelpLoadingState());
    DioHelper.getData(
      url: "getHelp",
    ).then((value) {
      helpModel = HelpModel.fromJson(value.data);
      isDown.clear();
      for (int i = 0; i < helpModel.help.length; i++) {
        isDown.add(true);
      }
      if (kDebugMode) {
        print(helpModel.message);
      }
      emit(GetHelpSuccessState(helpModel));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetHelpErrorState(error.toString()));
    });
  }

  // this function to get Products data and display it in ui
  getProductsData() {
    emit(GetProductsLoadingState());
    DioHelper.getData(
      url: "getProducts",
    ).then((value) {
      productModel = ProductsModel.fromJson(value.data);
      if (kDebugMode) {
        print(productModel.message);
      }
      emit(GetProductsSuccessState(productModel));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetProductsErrorState(error.toString()));
    });
  }

  // this function to change ui for one help item in help Screen
  void changeHelpItem(int index) {
    isDown[index] = !isDown[index];

    emit(ChangeIconState());
  }
}
