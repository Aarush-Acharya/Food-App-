import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Cart/cart_page.dart';
import 'package:flutter_application_2/controllers/cart_controller.dart';
import 'package:flutter_application_2/controllers/popular_product_controller.dart';
import 'package:flutter_application_2/routes/route_helper.dart';
import 'package:flutter_application_2/utils/appConstants.dart';
import 'package:flutter_application_2/utils/dimension.dart';
import 'package:flutter_application_2/widget/app_column.dart';
import 'package:flutter_application_2/widget/app_icon.dart';
import 'package:flutter_application_2/widget/expandable_text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../widget/Small_text.dart';
import '../../widget/big_text.dart';
import '../../widget/icon_and_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.PopularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.BASE_URL +
                            AppConstants.UPLOAD_URL +
                            product.img!))),
              )),
          //icon widgets
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (page == "cartpage") {
                        Get.toNamed(RouteHelper.getCartPage());
                      }else{
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios),
                  ),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (controller.totalItems >= 1)
                                Get.toNamed(RouteHelper.getCartPage());
                            },
                            child: AppIcon(
                              icon: Icons.shopping_cart_outlined,
                            )),
                        controller.totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RouteHelper.getCartPage());
                                    },
                                    child: AppIcon(
                                      icon: Icons.circle,
                                      size: Dimensions.radius20,
                                      iconColor: Colors.transparent,
                                      backgroundColor: Color(0xff89dad0),
                                    )))
                            : Container(),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: 3,
                                top: 3,
                                child: BigText(
                                  text: Get.find<PopularProductController>()
                                      .totalItems
                                      .toString(),
                                  size: 12,
                                  color: Colors.white,
                                ))
                            : Container(),
                      ],
                    );
                  })
                ],
              )),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.PopularFoodImgSize - 20,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: ExpandableTextWidget(
                                text: product.description!)))
                  ],
                )),
          )
          //expandable text widget
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
          height: Dimensions.height120,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20),
          decoration: BoxDecoration(
              color: Color(0xFFf7f6f4),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(
                        Icons.remove,
                        color: Color(0xFFA9A29F),
                        size: Dimensions.iconSize26,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add,
                            color: Color(0xFFA9A29F),
                            size: Dimensions.iconSize26))
                  ],
                )),
            GestureDetector(
                onTap: () {
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: const Color(0xFF89dad0),
                  ),
                  child: BigText(
                    text: "\$ ${product.price!} | Add to cart",
                    color: Colors.white,
                  ),
                ))
          ]),
        );
      }
      ),
    );
  }
}
