part of 'themes.dart';

class DBottomSheetTheme {
  DBottomSheetTheme._(); // Private constructor

  // Light BottomSheetThemeData
  static BottomSheetThemeData light = BottomSheetThemeData(
    backgroundColor: AppColors.light().backgroundColor,
    modalBackgroundColor: AppColors.light().backgroundColor,
    elevation: 16,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
  );

  // Dark BottomSheetThemeData
  static BottomSheetThemeData dark = BottomSheetThemeData(
    backgroundColor: AppColors.dark().backgroundColor,
    modalBackgroundColor: AppColors.dark().backgroundColor,
    elevation: 16,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
  );
}