
import '../utils/extensions/textstyle_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import '../constants/app_sizes.dart';
part 'date_picker_themedata.dart';
part 'elevated_button_themes.dart';
part 'floating_action_button_theme.dart';
part 'progress_indicator_theme.dart';
part 'appbar_theme.dart';
part 'bottom_appbar_theme.dart';
part 'bottom_navigation_bar_theme.dart';
part 'bottomsheet_theme.dart';
part 'button_theme.dart';
part 'card_theme.dart';
part 'checkbox_theme.dart';
part 'divider_theme.dart';
part 'icon_theme.dart';
part 'input_decoration_theme.dart';
part 'navigationbar_theme.dart';
part 'switch_theme.dart';
part 'tabbar_theme.dart';
part 'text_theme.dart';
part 'text_selection_theme.dart';
part 'slider_theme.dart';
class AppTheme {
  AppTheme();

  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.light().primaryColor,
      primaryTextTheme: DTextTheme.light,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.light().primaryColor,
        ),
      ),
      primaryColorLight: AppColors.light().primaryColor.withAlpha(100),
      primaryColorDark: AppColors.light().primaryColor,
      splashColor: AppColors.light().splashColor,
      highlightColor: AppColors.light().splashColor,
      hoverColor: AppColors.light().splashColor,
      focusColor: AppColors.light().splashColor,
      shadowColor: AppColors.light().shadowColor,
      dividerColor: AppColors.light().dividerColor,
      cardColor: AppColors.light().tileColor,
      
      useMaterial3: true,
      fontFamily: 'Public Sans',
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.light().primaryColor,
        brightness: Brightness.light,
        surface: AppColors.light().backgroundColor,
      ).copyWith(
        outline: AppColors.light().borderColor,
        outlineVariant: AppColors.light().dividerColor,
      ),
      scaffoldBackgroundColor: AppColors.light().backgroundColor,
      textTheme: DTextTheme.light,
      textSelectionTheme: DTextSelectionTheme.light,
      switchTheme: SwitchThemes.light,
      appBarTheme: DAppBarTheme.light,
      bottomAppBarTheme: DBottomAppBarTheme.light,
      inputDecorationTheme: DInputDecorationTheme.light,
      iconTheme: DIconTheme.light,
      buttonTheme: DButtonTheme.light,
      bottomSheetTheme: DBottomSheetTheme.light,
      checkboxTheme: DCheckboxTheme.light,
      cardTheme: DCardTheme.light,
      bottomNavigationBarTheme: DBottomNavigationBarThemes.light,
      navigationBarTheme: DNavigationBarTheme.light,
      tabBarTheme: DTabBarTheme.light,
      listTileTheme: ListTileThemeData(
        selectedTileColor: AppColors.light().splashColor,
        
      ),
      dividerTheme: DDividerTheme.light,
      progressIndicatorTheme: ProgressIndicatorThemes.light,
      datePickerTheme: DatePickerThemes.light,
      elevatedButtonTheme: ElevatedButtonThemes.light,
      floatingActionButtonTheme: FloatingActionButtonThemes.light,
      sliderTheme: AppSliderTheme.light
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.dark().primaryColor,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.dark().primaryColor,
        ),
      ),
      primaryTextTheme: DTextTheme.dark,
      primaryColorLight: AppColors.dark().primaryColor.withAlpha(100),
      primaryColorDark: AppColors.dark().primaryColor,
      splashColor: AppColors.dark().splashColor,
      highlightColor: AppColors.dark().primaryColor.withAlpha(175),
      hoverColor: AppColors.dark().primaryColor.withAlpha(175),
      focusColor: AppColors.dark().primaryColor.withAlpha(175),
      shadowColor: AppColors.dark().shadowColor,
      dividerColor: AppColors.dark().dividerColor,
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.dark().primaryColor,
        brightness: Brightness.dark,
        surface: AppColors.dark().backgroundColor,
      ).copyWith(
        outline: AppColors.dark().borderColor,
        outlineVariant: AppColors.dark().dividerColor,
      ),
      scaffoldBackgroundColor: AppColors.dark().backgroundColor,
      textTheme: DTextTheme.dark,
      switchTheme: SwitchThemes.dark,
      appBarTheme: DAppBarTheme.dark,
      bottomAppBarTheme: DBottomAppBarTheme.dark,
      inputDecorationTheme: DInputDecorationTheme.dark,
      iconTheme: DIconTheme.dark,
      textSelectionTheme: DTextSelectionTheme.dark,
      buttonTheme: DButtonTheme.dark,
      bottomSheetTheme: DBottomSheetTheme.dark,
      checkboxTheme: DCheckboxTheme.dark,
      cardTheme: DCardTheme.dark,
      tabBarTheme: DTabBarTheme.dark,
      bottomNavigationBarTheme: DBottomNavigationBarThemes.dark,
      dividerTheme: DDividerTheme.dark,
      progressIndicatorTheme: ProgressIndicatorThemes.dark,
      datePickerTheme: DatePickerThemes.dark,
      elevatedButtonTheme: ElevatedButtonThemes.dark,
      sliderTheme: AppSliderTheme.dark,
      navigationBarTheme: DNavigationBarTheme.dark,
    );
  }
}
