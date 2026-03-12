part of 'themes.dart';

class DNavigationBarTheme {
  DNavigationBarTheme._();

  static NavigationBarThemeData lightNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: AppColors.light().bottomNavigationBarColor,
    indicatorColor: AppColors.light().primaryColor,
    elevation: 8,
    shadowColor: AppColors.light().shadowColor,
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            color: Colors.white,
            size: 24,
          );
        }
        return IconThemeData(color: Colors.grey.shade600, size: 24);
      },
    ),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            color: AppColors.light().primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          );
        }
        return TextStyle(
          color: Colors.grey.shade600,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        );
      },
    ),
  );

  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: Colors.black,
    elevation: 8,
    shadowColor: AppColors.dark().shadowColor,
    indicatorColor: AppColors.dark().primaryColor,
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            color: Colors.white,
            size: 24,
          );
        }
        return IconThemeData(
          color: AppColors.dark().grey,
          size: 24,
        );
      },
    ),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            color: AppColors.dark().primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          );
        }
        return TextStyle(
          color: AppColors.dark().grey,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        );
      },
    ),
  );
}
