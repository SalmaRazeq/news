import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/color_manager.dart';
import 'package:news_app/core/utils/string_manager.dart';

class SettingsTab extends StatelessWidget {
  SettingsTab({super.key});

  var langController = TextEditingController();
  Languages selectedLang = Languages(lang: 'English');

  List<Languages> languages = [
    Languages(lang: 'English'),
    Languages(lang: 'العربية'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(StringsManager.language, style: AppStyle.language,),
          SizedBox(height: 18.h,),
          Padding(
            padding: REdgeInsets.only(left: 25),
            child: DropdownMenu<Languages>(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsManager.green, width: 1.w)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsManager.green, width: 1.w)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsManager.green, width: 1.w)),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onPrimary,
              ),
              initialSelection: Languages(lang: 'English'),
              width: 320.w,
              controller: langController,
              hintText: selectedLang.lang,
              textStyle: AppStyle.selectedLang,
              requestFocusOnTap: false,
              enableFilter: true,
              onSelected: (Languages? lang) {
                selectedLang = lang ?? Languages(lang: 'English');
              },
              dropdownMenuEntries:
              languages.map<DropdownMenuEntry<Languages>>((Languages language) {
                return DropdownMenuEntry<Languages>(
                  value: language,
                  label: language.lang,
                );
              }).toList(),
            ),
          ),

        ],
      ),
    );
  }
}
class Languages {
  String lang;
  Languages({required this.lang});
}

