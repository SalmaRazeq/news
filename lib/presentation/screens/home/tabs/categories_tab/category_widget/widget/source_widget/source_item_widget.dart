import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/color_manager.dart';
import 'package:news_app/data/model/sources_response/sources.dart';

class SourceItemWidget extends StatelessWidget {
   SourceItemWidget({super.key, required this.source, required this.isSelected});

  Source source;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: 12, horizontal: 5),
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.green : Colors.transparent,
        border: Border.all(color: ColorsManager.green, width: 2.w),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Text(source.name ?? '', style: GoogleFonts.exo(color: isSelected ? ColorsManager.white : ColorsManager.green, fontWeight: FontWeight.w500, fontSize: 15.sp),),
    );
  }
}
