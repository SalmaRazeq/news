import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/color_manager.dart';
import 'package:news_app/core/utils/string_manager.dart';

typedef OnDrawerItemClicked = void Function(MenuItem);

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onDrawerItemClicked});

  OnDrawerItemClicked onDrawerItemClicked;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 120.h,
            width: double.infinity,
            color: ColorsManager.green,
            child: Text(
              StringsManager.drawerTitle,
              style: AppStyle.drawerTile,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: REdgeInsets.all(8.0),
            child: Column(
              children: [
                buildDrawerItem(
                  icon: Icons.list,
                  text: StringsManager.categories,
                  onClicked: onDrawerItemClicked,
                  item: MenuItem.categories
                ),
                SizedBox(
                  height: 10.h,
                ),
                buildDrawerItem(
                  icon: Icons.settings,
                  text: StringsManager.settings,
                  onClicked: onDrawerItemClicked,
                  item: MenuItem.settingsgit add
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

buildDrawerItem(
    {IconData? icon,
    required String text,
    required MenuItem item,
    required OnDrawerItemClicked onClicked}) {
  return InkWell(
    onTap: () {
      onClicked(item);
    },
    child: Row(
      children: [
        Icon(
          icon,
          size: 38.sp,
        ),
        SizedBox(
          width: 12.w,
        ),
        Text(
          text,
          style: AppStyle.drawerBody,
        )
      ],
    ),
  );
}

enum MenuItem {
  categories, //0
  settings //1
}
