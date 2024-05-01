
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/shared/constant/test_styles_manager.dart';
import 'package:untitled/shared/constant/values_manager.dart';



import 'color_manager.dart';
import 'fonst_manager.dart';

ThemeData getApplicationTheme(context) {
  return ThemeData(
    // main colors
      primaryColor: ColorManager.primary,

      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorManager.primary,
          secondary: ColorManager.primary
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: Colors.white,
        shadowColor: ColorManager.primary,
        surfaceTintColor: Colors.white,
          shape: Border.all(color:ColorManager.primary, )
        // Set background color for PopupMenuButton
      ),
    // cardview theme
    cardTheme: CardTheme(
      elevation: AppSize.s4,
      color: ColorManager.white,
      shadowColor: ColorManager.grey



  ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s0,

      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: TextStyle(color: ColorManager.lightPrimary,fontSize: 18,fontWeight: FontWeight.bold),//Theme.of(context).textTheme.headline1,
      iconTheme: IconThemeData(color: ColorManager.primary),
        actionsIconTheme: IconThemeData(color: ColorManager.primary),

        systemOverlayStyle: SystemUiOverlayStyle(


          statusBarBrightness: Brightness.light,
              statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark
        ),
    //  backgroundColor: ColorManager.white,
      foregroundColor:  ColorManager.white,
      surfaceTintColor: ColorManager.white,





    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManager.white,
      ),

    // button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
         disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.lightPrimary,
    ),scaffoldBackgroundColor: ColorManager.white,
    iconTheme: IconThemeData(color: ColorManager.primary),


    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
           // primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green, // Set the FAB color
    ),
    // text theme
    textTheme: TextTheme(
        // displayLarge: getLightStyle(color: ColorManager.white, fontSize: FontSize.s22),
        displayLarge: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16,),
        displayMedium: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
        titleMedium: getMediumStyle(color: ColorManager.grey1, fontSize: FontSize.s14,height: 1.5),
        bodySmall: getRegularStyle(color: ColorManager.grey1),
        bodyLarge: getRegularStyle(color: ColorManager.grey)),
    //input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        focusColor: ColorManager.primary,
      suffixIconColor: ColorManager.primary,

        // hint style
        hintStyle:getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        labelStyle:getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),)

        // enabled border style
        // enabledBorder: OutlineInputBorder(
        //     borderSide:
        //     BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        //
        // // focused border style
        // focusedBorder: OutlineInputBorder(
        //     borderSide:
        //     BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        //
        // // error border style
        // errorBorder: OutlineInputBorder(
        //     borderSide:
        //     BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // // focused border style
        // focusedErrorBorder: OutlineInputBorder(
        //     borderSide:
        //     BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),



   );
}
