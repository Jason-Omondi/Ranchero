import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
// ignore_for_file: deprecated_member_use

class AppTheme {
  const AppTheme._();
  // Light Theme
  static final dark = FlexThemeData.dark(
    scheme: FlexScheme.deepBlue,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
    blendLevel: 20,
    appBarStyle: FlexAppBarStyle.background,
    appBarOpacity: 0.90,
    appBarElevation: 0,
    transparentStatusBar: true,
    tabBarStyle: FlexTabBarStyle.universal,
    tooltipsMatchBackground: true,
    swapColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.nunito().fontFamily,
    subThemesData: const FlexSubThemesData(
      useTextTheme: true,
      fabUseShape: true,
      interactionEffects: true,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarOpacity: 1,
      navigationBarOpacity: 1,
      navigationBarMutedUnselectedIcon: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      blendOnColors: true,
      blendTextTheme: true,
      popupMenuOpacity: 0.90,
    ),
  );

  static final light = FlexThemeData.light(
    scheme: FlexScheme.tealM3,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
    blendLevel: 40,
    appBarStyle: FlexAppBarStyle.primary,
    appBarOpacity: 0.95,
    appBarElevation: 0,
    transparentStatusBar: true,
    tabBarStyle: FlexTabBarStyle.forBackground,
    tooltipsMatchBackground: true,
    swapColors: true,
    lightIsWhite: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.nunito().fontFamily,
    subThemesData: const FlexSubThemesData(
      useTextTheme: true,
      fabUseShape: true,
      interactionEffects: true,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarOpacity: 1,
      navigationBarOpacity: 1,
      navigationBarMutedUnselectedIcon: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      blendOnColors: true,
      blendTextTheme: true,
      popupMenuOpacity: 0.95,
    ),
  );
}
