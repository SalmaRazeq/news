import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/color_manager.dart';

class AppStyle {
  static TextStyle appBarTile = GoogleFonts.exo(fontSize: 22.sp, fontWeight: FontWeight.w400, color: ColorsManager.white);
  static TextStyle drawerTile = GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle drawerBody = GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w700, color: ColorsManager.black);
  static TextStyle pickCategory = GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w700, color: ColorsManager.darkGray);
  static TextStyle language = GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w700, color: ColorsManager.black);
  static TextStyle selectedLang = GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w700, color: ColorsManager.green);
  static TextStyle categories = GoogleFonts.exo(fontSize: 22.sp, fontWeight: FontWeight.w500, color: ColorsManager.white);

}