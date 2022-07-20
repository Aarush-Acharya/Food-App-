// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/home/food_page_body.dart';
import 'package:flutter_application_2/utils/dimension.dart';
import 'package:flutter_application_2/widget/Small_text.dart';
import 'package:flutter_application_2/widget/big_text.dart';




class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("Current height is " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
              child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Bangladesh", color: Color(0xFF89dad0)),
                    Row(
                      children: [
                        SmallText(text: "Narsingdi", color: Colors.black54),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          size: Dimensions.iconSize24,
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  width: Dimensions.width45,
                  height: Dimensions.height45,
                  child: Icon(Icons.search,
                      color: Colors.white, size: Dimensions.iconSize24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Color(0xFF89dad0)),
                )
              ],
            ),
          )),
          Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
