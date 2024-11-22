import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
class MyThemeData {
  static final ThemeData lightTheme = ThemeData( ///final : we use it when the output abber with running time
    primaryColor: AppColors.primaryLight
       , scaffoldBackgroundColor: AppColors.backGroundColorLightMode

     , appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryLight,
    elevation: 0, /// for remove Edges from appbar
  )
      ,textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(
        fontSize: 22
           , fontWeight: FontWeight.bold
         , color: AppColors.whiteColor
      )
        ,  titleMedium:  GoogleFonts.poppins(
      fontSize: 18
      , fontWeight: FontWeight.bold
      , color: AppColors.blackColor
  )
  , bodyLarge:  GoogleFonts.poppins(
  fontSize: 20
  , fontWeight: FontWeight.w500
  , color: AppColors.blackColor
  ),
    bodyMedium:  GoogleFonts.poppins(
        fontSize: 18
        , fontWeight: FontWeight.w400
        , color: AppColors.blackColor
    ),
  )

     , bottomNavigationBarTheme: BottomNavigationBarThemeData(
       selectedItemColor: AppColors.primaryLight,
    unselectedItemColor: AppColors.grayColor,
    backgroundColor: Colors.transparent
      ,elevation: 0 /// for remove shadow from BottomNavigationBarThemeData
  )

  ,floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
    /// for add border in add to do button + :
      /// 1) we can use StadiumBorder() and give it side:BorderSide like widget number 2
      /// 2) we can use RoundedRectangleBorder()
    shape:
    RoundedRectangleBorder( ///
      borderRadius: BorderRadius.circular(35),
        side: BorderSide(color: AppColors.whiteColor , width: 4)
    )
  )

     , bottomSheetTheme: BottomSheetThemeData( ///curve for task sheet in add button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16)
          ,topLeft: Radius.circular(16)
      )
    )
  )
  );
}