import 'package:arduino_ctrl/home/home.dart';
import 'package:arduino_ctrl/home/home_controlller.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_utils/sisitech_themes/theme_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(HomeController());

  var customTheme = CustomFlexThemeData(
    scheme: FlexScheme.indigo,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.play().fontFamily,
  );
  Get.put(
    ThemeController(
      defaultLightTheme: customTheme,
      defaultDarkTheme: customTheme,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetMaterialApp(
          title: 'Arduino Controller',
          debugShowCheckedModeBanner: false,
          theme: themeController.lightTheme.value,
          darkTheme: themeController.darkTheme.value,
          themeMode: ThemeMode.system,
          home: const HomeScreen(),
        );
      },
    );
  }
}
