
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:maymunas_collection/Screen/user_panel/all-categories-screen.dart';
import 'package:maymunas_collection/Utils/app_constant.dart';
import 'package:maymunas_collection/widgets/banner-widget.dart';

import '../../widgets/all-products-widget.dart';
import '../../widgets/category-widget.dart';
import '../../widgets/custom-drawer-widget.dart';
import '../../widgets/flash-sale-widget.dart';
import '../../widgets/heading-widget.dart';
import 'all-flash-sale-products.dart';
import 'all-products-screen.dart';
import 'cart-screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppConstant.appScendoryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName, style: TextStyle(color: AppConstant.appTextColor),),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: ()=> Get.to (() => CartScreen()),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(Icons.shopping_cart),
              ))
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),
              BannerWidget(),
              //heading
              HeadingWidget(
                headingTitle: "ক্যাটগরিজ",
                headingSubTitle: "আপনার বাজেট অনুসারে",
                onTap: () => Get.to(() => AllCategoriesScreen()),
                buttonText: "আরও দেখুন >",
              ),
              CategoriesWidget(),
              //heading
              HeadingWidget(
                headingTitle: "ফ্লাশ সেলস",
                headingSubTitle: "আপনার বাজেট অনুসারে",
                onTap: () => Get.to(() => AllFlashSaleProductScreen()),
                buttonText: "আরও দেখুন>",
              ),
              FlashSaleWidget(),
              HeadingWidget(
                headingTitle: "সব প্রডাক্টস",
                headingSubTitle: "আপনার বাজেট অনুসারে",
                onTap: () => Get.to(() => AllProductsScreen()),
                buttonText: "আরও দেখুন>",
              ),
              AllProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
