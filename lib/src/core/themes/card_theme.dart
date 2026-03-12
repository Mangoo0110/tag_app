part of 'themes.dart';

class DCardTheme {
  DCardTheme._(); // Private constructor

  // Light CardTheme
  static CardThemeData light = CardThemeData(
    color: AppColors.light().tileColor, // Background color of the card
    //shadowColor: Colors.black.withOpacity(0.2), // Color of the shadow
    elevation: 4, // Elevation of the card
    margin: const EdgeInsets.symmetric(horizontal: 4), // Margin around the card
    shape: RoundedRectangleBorder( // Shape of the card
      borderRadius: AppSizes.mediumBorderRadius,
    ),
    clipBehavior: Clip.antiAlias, // Clipping behavior of the card
    surfaceTintColor: AppColors.light().backgroundColor, // Tint for Material 3 surfaces
  );

  // Dark CardTheme
  static CardThemeData dark = CardThemeData(
    color: AppColors.dark().invertTextColor,
    //shadowColor: Colors.white.withOpacity(0.4), // Color of the shadow
    elevation: 4, // Elevation of the card
    margin: const EdgeInsets.symmetric(horizontal: 4), // Margin around the card
    shape: RoundedRectangleBorder( // Shape of the card
      borderRadius: AppSizes.mediumBorderRadius,
    ),
    clipBehavior: Clip.antiAlias, // Clipping behavior of the card
    //surfaceTintColor: AppColors.dark().backgroundColor, // Tint for Material 3 surfaces
  );
}