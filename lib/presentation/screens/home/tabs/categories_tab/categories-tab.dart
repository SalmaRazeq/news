import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/data_model/category_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_details/categories_details.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/category_widget/category_widget.dart';

typedef OnCategoryItemClicked = void Function(CategoryDM);
class CategoriesTab extends StatelessWidget {
  CategoriesTab({super.key, required this.onCategoryItemClicked,});

  OnCategoryItemClicked onCategoryItemClicked;

  List<CategoryDM> categoryList = CategoryDM.getAllCategories();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(22),
      child: Column(
        children: [
          Text(
            'Pick your category \nof interest',
            style: AppStyle.pickCategory,
          ),
          SizedBox(
            height: 4.h,
          ),
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                  ),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        onCategoryItemClicked(categoryList[index]);
                      },
                      child: CategoryWidget(
                          categoryDM: categoryList[index], index: selectedIndex = index )))),
        ],
      ),
    );
  }
}
