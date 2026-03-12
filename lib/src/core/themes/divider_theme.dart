part of 'themes.dart';

class DDividerTheme {
  DDividerTheme._(); // Private constructor

  // Light DividerThemeData
  static DividerThemeData light = DividerThemeData(
    color: AppColors.light().dividerColor, // Assuming you have this color defined
    thickness: 1.0, // Define the thickness of the divider
    indent: 16.0, // Define the starting indent of the divider
    endIndent: 16.0, // Define the ending indent of the divider
  );

  // Dark DividerThemeData
  static DividerThemeData dark = DividerThemeData(
    color: AppColors.dark().dividerColor, // Assuming you have this color defined
    thickness: 1.0, // Define the thickness of the divider
    indent: 16.0, // Define the starting indent of the divider
    endIndent: 16.0, // Define the ending indent of the divider
  );
}
