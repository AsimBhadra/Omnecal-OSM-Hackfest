import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omnecal/src/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData();
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      textTheme: GoogleFonts.dmSansTextTheme()
          .apply(
            bodyColor: Colors.white,
            displayColor: AppColors.whiteColor,
          )
          .copyWith(
            headline1: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteColor,
            ),
            headline2: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: AppColors.whiteColor,
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: AppColors.whiteColor,
            ),
          ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColors.whiteColor,
        suffixIconColor: AppColors.whiteColor,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor.withOpacity(0.8),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.whiteColor,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.whiteColor,
            width: 2,
          ),
        ),
      ),
      primarySwatch: AppColors.mainSwatch,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: AppBarTheme(
          color: AppColors.backgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.whiteColor,
          )),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColors.mainSwatch,
          ),
        ),
      ),
    );
  }
}
