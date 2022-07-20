import 'package:flutter_application_2/Data/api/api_client.dart' as api;
import 'package:flutter_application_2/Data/repository/cart_repo.dart';
import 'package:flutter_application_2/Data/repository/popular_product_repo.dart';
import 'package:flutter_application_2/controllers/cart_controller.dart';
import 'package:flutter_application_2/controllers/popular_product_controller.dart';
import 'package:flutter_application_2/data/api/api_client.dart';
import 'package:flutter_application_2/utils/appConstants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Data/api/api_client.dart' as api;
import '../Data/repository/recommended_product_repo.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(
      () => CartController(cartRepo: Get.find()));
}
