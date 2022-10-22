import 'package:magd_soft_task/models/help_model.dart';

import '../../models/products_model.dart';

abstract class AppStates {}

class AppInitState extends AppStates {}

class GetHelpLoadingState extends AppStates {}

class GetHelpSuccessState extends AppStates {
  final HelpModel model;

  GetHelpSuccessState(this.model);
}

class GetHelpErrorState extends AppStates {
  final String error;

  GetHelpErrorState(this.error);
}
class GetProductsLoadingState extends AppStates {}

class GetProductsSuccessState extends AppStates {
  final ProductsModel model;

  GetProductsSuccessState(this.model);
}

class GetProductsErrorState extends AppStates {
  final String error;

  GetProductsErrorState(this.error);
}


class ChangeIconState extends AppStates {}
class ChangeFavState extends AppStates {}
class GetCacheState extends AppStates {}
