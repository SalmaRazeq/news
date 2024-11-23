import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/color_manager.dart';

class Apptheme {
  static final ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: ColorsManager.green,
        toolbarHeight: 67,
        iconTheme: IconThemeData(
          color: ColorsManager.white,
          size: 34,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),),
    ),
    scaffoldBackgroundColor: Colors.transparent
  );
}
