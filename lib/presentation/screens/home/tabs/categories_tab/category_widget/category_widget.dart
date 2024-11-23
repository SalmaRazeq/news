import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/data_model/category_DM.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, required this.categoryDM, required this.index});

  CategoryDM categoryDM;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDM.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomRight: Radius.circular(index.isEven ? 0 : 25),
            bottomLeft: Radius.circular(index.isEven ? 25 : 0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryDM.imagePath, width: 125, height: 122,),
          Text(categoryDM.title, style: AppStyle.categories,),
        ],
      ),
    );
  }
}
