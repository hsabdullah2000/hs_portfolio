import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'screens/home_screen.dart';
import 'constants/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set web renderer to auto to handle both HTML and CanvasKit renderers
  // This improves compatibility across different browsers
  if (kIsWeb) {
    // Web-specific configurations can be added here
  }

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syed Muhammad Abdullah | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Constants.primaryColor,
        scaffoldBackgroundColor: Constants.bgColor,
        colorScheme: ColorScheme.dark(
          primary: Constants.primaryColor,
          secondary: Constants.secondaryColor,
          tertiary: Constants.accentColor,
          background: Constants.bgColor,
          surface: Constants.lightBgColor,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onBackground: Constants.textColor,
          onSurface: Constants.textColor,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Constants.textColor,
            displayColor: Constants.textColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Constants.primaryColor,
          ),
        ),
        cardTheme: CardTheme(
          color: Constants.lightBgColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      builder:
          (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
      home: const HomeScreen(),
    );
  }
}
