import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/components/config/base_data.dart';
import '../../app/data/local/my_shared_pref.dart';

class MyTheme {
  static ThemeMode themeLight = ThemeMode.light;
  static ThemeMode themeDark = ThemeMode.dark;
  static final theme = Theme.of(Get.context!);

  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.amber,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 20.0,
      inputDecoratorRadius: 20.0,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    // To use the Playground font, add GoogleFonts package and uncomment
    fontFamily: FontFamilyType.primary,
  );

  static ThemeData dark = FlexThemeData.dark(
    colors: FlexColor.schemes[FlexScheme.shark]!.light.defaultError
        .toDark(16, false),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    darkIsTrueBlack: true,
    swapColors: true,
    surfaceTint: const Color(0xfffcebdc),
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 20.0,
      inputDecoratorRadius: 20.0,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    // To use the Playground font, add GoogleFonts package and uncomment
    fontFamily: FontFamilyType.primary,
  );
  // FlexThemeData.dark(
  //   scheme: FlexScheme.amber,
  //   surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  //   blendLevel: 13,
  //   subThemesData: const FlexSubThemesData(
  //     blendOnLevel: 20,
  //     useTextTheme: true,
  //     useM2StyleDividerInM3: true,
  //     defaultRadius: 20.0,
  //     inputDecoratorRadius: 16.0,
  //     alignedDropdown: true,
  //     useInputDecoratorThemeInDialogs: true,
  //   ),
  //   useMaterial3ErrorColors: true,
  //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
  //   useMaterial3: true,
  //   swapLegacyOnMaterial3: true,
  //   // To use the Playground font, add GoogleFonts package and uncomment
  //   // fontFamily: GoogleFonts.notoSans().fontFamily,
  // );

  // static getThemeData({required bool isLight}) {
  //   return ThemeData(
  //       // main color (app bar,tabs..etc)
  //       primaryColor: isLight
  //           ? LightThemeColors.primaryColor
  //           : DarkThemeColors.primaryColor,

  //       // secondary & background color
  //       colorScheme: ColorScheme.fromSwatch(
  //         accentColor: isLight
  //             ? LightThemeColors.accentColor
  //             : DarkThemeColors.accentColor,
  //         backgroundColor: isLight
  //             ? LightThemeColors.backgroundColor
  //             : DarkThemeColors.backgroundColor,
  //         brightness: isLight ? Brightness.light : Brightness.dark,
  //       ).copyWith(
  //         secondary: isLight
  //             ? LightThemeColors.accentColor
  //             : DarkThemeColors.accentColor,
  //       ),

  //       // color contrast (if the theme is dark text should be white for example)
  //       brightness: isLight ? Brightness.light : Brightness.dark,

  //       // card widget background color
  //       cardColor:
  //           isLight ? LightThemeColors.cardColor : DarkThemeColors.cardColor,

  //       // hint text color
  //       hintColor: isLight
  //           ? LightThemeColors.hintTextColor
  //           : DarkThemeColors.hintTextColor,

  //       // divider color
  //       dividerColor: isLight
  //           ? LightThemeColors.dividerColor
  //           : DarkThemeColors.dividerColor,

  //       // app background color
  //       scaffoldBackgroundColor: isLight
  //           ? LightThemeColors.scaffoldBackgroundColor
  //           : DarkThemeColors.scaffoldBackgroundColor,

  //       // progress bar theme
  //       progressIndicatorTheme: ProgressIndicatorThemeData(
  //         color: isLight
  //             ? LightThemeColors.primaryColor
  //             : DarkThemeColors.primaryColor,
  //       ),

  //       // appBar theme
  //       appBarTheme: MyStyles.getAppBarTheme(isLightTheme: isLight),

  //       // elevated button theme
  //       elevatedButtonTheme:
  //           MyStyles.getElevatedButtonTheme(isLightTheme: isLight),

  //       // text theme
  //       textTheme: MyStyles.getTextTheme(isLightTheme: isLight),

  //       // chip theme
  //       chipTheme: MyStyles.getChipTheme(isLightTheme: isLight),

  //       // icon theme
  //       iconTheme: MyStyles.getIconTheme(isLightTheme: isLight),

  //       // list tile theme
  //       listTileTheme: MyStyles.getListTileThemeData(isLightTheme: isLight),

  //       // custom themes
  //       extensions: [
  //         MyStyles.getHeaderContainerTheme(isLightTheme: isLight),
  //         MyStyles.getEmployeeListItemTheme(isLightTheme: isLight),
  //       ]);
  // }

  /// update app theme and save theme type to shared pref
  /// (so when the app is killed and up again theme will remain the same)
  static changeTheme() {
    // *) check if the current theme is light (default is light)
    bool isLightTheme = MySharedPref.getThemeIsLight();

    // *) store the new theme mode on get storage
    MySharedPref.setThemeIsLight(!isLightTheme);

    // *) let GetX change theme
    Get.changeThemeMode(!isLightTheme ? ThemeMode.light : ThemeMode.dark);
  }

  /// check if the theme is light or dark
  bool get getThemeIsLight => MySharedPref.getThemeIsLight();
}
