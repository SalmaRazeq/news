import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/color_manager.dart';
import 'package:news_app/core/utils/string_manager.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/categories-tab.dart';
import 'package:news_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:news_app/presentation/screens/home/widget/home_drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget selectedWidget = CategoriesTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsManager.pattern),),
        color: ColorsManager.white
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringsManager.appTitle,
            style: AppStyle.appBarTile,
          ),
        ),
        drawer: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  onDrawerItemClicked(MenuItem item) {
    switch (item) {
      case MenuItem.categories : {
        selectedWidget = CategoriesTab();
      }
      case MenuItem.settings : {
        selectedWidget = SettingsTab() ;
      }
    }
    Navigator.pop(context);
    setState(() {

    });
  }
}
