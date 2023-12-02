import 'package:flutter/material.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFFF6600),
    primary: Color(0xFFFF6600),
    secondary: Color(0xFF444444),
    tertiary: Color(0xFF333333),
  ),
  useMaterial3: true
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFA33E00),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDBCD),
  onPrimaryContainer: Color(0xFF360F00),
  secondary: Color(0xFF006874),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF97F0FF),
  onSecondaryContainer: Color(0xFF001F24),
  tertiary: Color(0xFF006874),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF97F0FF),
  onTertiaryContainer: Color(0xFF001F24),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFAFDFD),
  onBackground: Color(0xFF191C1D),
  outline: Color(0xFF6F797A),
  onInverseSurface: Color(0xFFEFF1F1),
  inverseSurface: Color(0xFF2E3132),
  inversePrimary: Color(0xFFFFB596),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFA33E00),
  outlineVariant: Color(0xFFBFC8CA),
  scrim: Color(0xFF000000),
  surface: Color(0xFFF8FAFA),
  onSurface: Color(0xFF191C1D),
  surfaceVariant: Color(0xFFDBE4E6),
  onSurfaceVariant: Color(0xFF3F484A),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB596),
  onPrimary: Color(0xFF581E00),
  primaryContainer: Color(0xFF7C2E00),
  onPrimaryContainer: Color(0xFFFFDBCD),
  secondary: Color(0xFF4FD8EB),
  onSecondary: Color(0xFF00363D),
  secondaryContainer: Color(0xFF004F58),
  onSecondaryContainer: Color(0xFF97F0FF),
  tertiary: Color(0xFF4FD8EB),
  onTertiary: Color(0xFF00363D),
  tertiaryContainer: Color(0xFF004F58),
  onTertiaryContainer: Color(0xFF97F0FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1D),
  onBackground: Color(0xFFE1E3E3),
  outline: Color(0xFF899294),
  onInverseSurface: Color(0xFF191C1D),
  inverseSurface: Color(0xFFE1E3E3),
  inversePrimary: Color(0xFFA33E00),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB596),
  outlineVariant: Color(0xFF3F484A),
  scrim: Color(0xFF000000),
  surface: Color(0xFF101415),
  onSurface: Color(0xFFC4C7C7),
  surfaceVariant: Color(0xFF3F484A),
  onSurfaceVariant: Color(0xFFBFC8CA),
);

final ColorScheme myColorScheme = ColorScheme(
  primary: orange, // Typically the color of widgets like AppBar
  // primaryVariant: orangeDark, // Typically darker shade of the primary color
  secondary: green, // Typically used for FABs, buttons, etc.
  // secondaryVariant: green, // Typically darker shade of the secondary color
  surface: darkGrey, // Typically the background color of cards, dialogs, etc.
  background: background, // Typically the background color of the entire app
  error: red, // Typically the color used to indicate errors
  onPrimary: Colors.white, // Text color on primary color
  onSecondary: Colors.white, // Text color on secondary color
  onSurface: Colors.white, // Text color on surface color
  onBackground: Colors.white, // Text color on background color
  onError: Colors.white, // Text color on error color
  brightness: Brightness.dark, // Use dark or light theme
  errorContainer: red
);


// Colors
const Color red = Color(0xFFe43c40);
const Color darkGrey = Color(0xFF333333);
const Color lightGrey = Color(0xFF444444);
const Color lighterGrey = Color(0xFF717171);
const Color orange= Color(0xFFFF6600);
const Color orangeDark = Color(0xFFFF4500);
const Color green = Color(0xFF008080);
const Color background = Color(0xFF222222);