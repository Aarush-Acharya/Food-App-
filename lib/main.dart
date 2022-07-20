import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Cart/cart_page.dart';
import 'package:flutter_application_2/Pages/Food/recommended_food_details.dart';
import 'package:flutter_application_2/Pages/Home/main_food_page.dart';
import 'package:flutter_application_2/Pages/home/food_page_body.dart';
import 'package:flutter_application_2/controllers/popular_product_controller.dart';
import 'package:flutter_application_2/routes/route_helper.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

import 'package:get/get.dart';

import 'Pages/Food/popular_food_detail.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      initialRoute: RouteHelper.getInitial(),
       getPages: RouteHelper.routes,
    );
  }
}
