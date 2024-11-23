import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/color_manager.dart';
import 'package:news_app/core/utils/constant_manager.dart';
import 'package:news_app/core/utils/string_manager.dart';

class CategoryDM {
  String id;
  String title;
  Color bgColor;
  String imagePath;

  CategoryDM(
      {required this.id,
      required this.title,
      required this.bgColor,
      required this.imagePath});

  static List<CategoryDM> getAllCategories() => [
        CategoryDM(
          id: ConstantManager.sportId,
          title: StringsManager.sport,
          bgColor: ColorsManager.darkGreen,
          imagePath: AssetsManager.sport,
        ),
        CategoryDM(
          id: ConstantManager.generalId,
          title: StringsManager.general,
          bgColor: ColorsManager.darkBlue,
          imagePath: AssetsManager.general,
        ),
        CategoryDM(
          id: ConstantManager.healthId,
          title: StringsManager.health,
          bgColor: ColorsManager.pink,
          imagePath: AssetsManager.health,
        ),
        CategoryDM(
          id: ConstantManager.businessId,
          title: StringsManager.business,
          bgColor: ColorsManager.orange,
          imagePath: AssetsManager.business,
        ),
        CategoryDM(
          id: ConstantManager.entertainmentId,
          title: StringsManager.entertainment,
          bgColor: ColorsManager.red,
          imagePath: AssetsManager.entertainment,
        ),
        CategoryDM(
          id: ConstantManager.scienceId,
          title: StringsManager.science,
          bgColor: ColorsManager.yellow,
          imagePath: AssetsManager.science,
        ),
        CategoryDM(
          id: ConstantManager.techId,
          title: StringsManager.technology,
          bgColor: ColorsManager.blue,
          imagePath: AssetsManager.technology,
        ),
      ];
}
