import 'package:music/gen/fonts.gen.dart';
import 'package:music/utils/theme_style.dart';
import 'package:flutter/material.dart';



const double lowRadius = 6;
class AppTheme {



  static ThemeData get light => ThemeData(
    useMaterial3: true,
    fontFamily: FontFamily.diodrumArabic,
    dividerColor: Colors.black,
    canvasColor: Colors.white,
    primaryColorLight: Colors.black,
    primaryColor: Color(0xFF45BB6D),
    splashColor: Color(0x11000000),
    cardColor: Colors.white,
    popupMenuTheme: PopupMenuThemeData(
      color: Color(0xFFFFFFFF),
      iconColor: Color(0xFF45BB6D),
      textStyle: ThemeStyle.normalStyle.copyWith(
          fontSize: 14
      ),
      labelTextStyle: WidgetStateProperty.all<TextStyle>(ThemeStyle.normalStyle.copyWith(
          color: Colors.black,
          fontSize: 14
      )),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(lowRadius * 1.5),side: BorderSide(color: Colors.black38.withAlpha(30),width: 0.8)),
      iconSize: 25,
      surfaceTintColor: Colors.white,
      position: PopupMenuPosition.under,
      enableFeedback: true,
      shadowColor: Colors.black38,
    ),

    scrollbarTheme: ScrollbarThemeData(
      radius: Radius.circular(lowRadius),

    ),
    primaryTextTheme: TextTheme(
      bodyLarge: ThemeStyle.normalStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black),
      bodyMedium: ThemeStyle.normalStyle
          .copyWith(fontSize: 13, color: Colors.black),
      bodySmall: ThemeStyle.normalStyle
          .copyWith(fontSize: 12, color: Colors.black),
    ),
    primarySwatch: Colors.blue,
    chipTheme: ChipThemeData(
      elevation: 0,
      secondarySelectedColor: Colors.brown,
      showCheckmark: true,
      backgroundColor: Color(0xFFFAFAFA),
      secondaryLabelStyle: ThemeStyle.normalStyle.copyWith(
          fontSize: 14
      ),
      labelPadding: EdgeInsets.only(top: 2,left: 10,right: 10),
      color: WidgetStatePropertyAll<Color>(Colors.white),
      iconTheme: IconThemeData(color: Colors.white,size: 20),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(lowRadius * 7)),
      side: BorderSide(color: Color(0xFF5E5E5E).withAlpha(26)),
      labelStyle: ThemeStyle.normalStyle.copyWith(
        color: Color(0xFF5E5E5E).withAlpha(150),
      ),
      checkmarkColor: Colors.black,
      pressElevation: 0,
      selectedShadowColor: Colors.transparent,
      surfaceTintColor: Colors.orange,
      selectedColor: Colors.black.withAlpha(30),
    ),
    primaryColorDark:Color(0xFF127740),
    checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(lowRadius / 2)),
        visualDensity: VisualDensity.comfortable,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        overlayColor: WidgetStatePropertyAll<Color>(Color(0xFFFFFFFF)),
        checkColor: WidgetStatePropertyAll<Color>(Colors.white),
        mouseCursor: WidgetStatePropertyAll<MouseCursor>(MouseCursor.uncontrolled),
        side: BorderSide(width: 2,color: Colors.black54.withAlpha(200)),
        splashRadius: 100
    ),
    brightness: Brightness.dark,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFFAFAFA), elevation: 0),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: Color(0xFFFAFAFA),
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            disabledBackgroundColor: Color(0x5545BB6D),
            foregroundColor: Color(0xFF5E5E5E),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(lowRadius)),
            backgroundColor: Colors.transparent)),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: ThemeStyle.normalStyle.copyWith(
        color: Color(0xFFE8E8E8),
        fontSize: 12,
      ),
      contentPadding: EdgeInsets.zero,
      isDense: true,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      elevation: 4,
      titleTextStyle: ThemeStyle.normalStyle,

      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(lowRadius)),
    ),
    hintColor: Color(0xFFE8E8E8),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Colors.black,
        circularTrackColor: Color(0xFFFAFAFA),
        linearTrackColor: Colors.black,
        refreshBackgroundColor: Color(0xFFFAFAFA),
        linearMinHeight: 0),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(lowRadius)),
            elevation: 0
        )
    ),
    iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            animationDuration: Durations.long1,
            iconSize: 25
        )
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 22,
    ),
    textTheme: TextTheme(
      bodyLarge: ThemeStyle.normalStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black),
      bodyMedium: ThemeStyle.normalStyle
          .copyWith(fontSize: 13, color: Colors.black),
      bodySmall: ThemeStyle.normalStyle
          .copyWith(fontSize: 12, color: Colors.black),
    ),
    switchTheme: SwitchThemeData(
      overlayColor: WidgetStatePropertyAll<Color>(Colors.white),
      thumbColor: WidgetStatePropertyAll<Color>(Colors.white),
      trackColor: WidgetStatePropertyAll<Color>(Color(0xFF45BB6D)),
      trackOutlineColor: WidgetStatePropertyAll<Color>(Colors.white),
    ),
    sliderTheme: SliderThemeData(
      thumbColor: Colors.white,
      overlayColor: Colors.white12,
      activeTickMarkColor: Colors.white24,
      activeTrackColor: Colors.white,
      disabledActiveTickMarkColor: Colors.blueGrey,
      disabledActiveTrackColor: Colors.blueGrey,
      disabledInactiveTickMarkColor: Colors.blueGrey,
      disabledInactiveTrackColor: Colors.blueGrey,
      disabledSecondaryActiveTrackColor: Colors.blueGrey,
      inactiveTickMarkColor: Colors.white,
      inactiveTrackColor: Colors.white24,
      secondaryActiveTrackColor: Color(0xFFC74337),
      valueIndicatorColor: Colors.orange,


    ),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      secondary: Colors.black,
      error: Color(0xFFFF4D4F),
      seedColor: Color(0xFF45BB6D),
      onSecondary: Color(0xFF45BB6D),
      inversePrimary: Color(0xFF45BB6D),
      secondaryFixed: Color(0xFF45BB6D),
      onPrimaryFixed: Color(0xFF45BB6D),
      onSurface: Colors.white,
      onSecondaryContainer: Color(0xFF45BB6D),
      primary: Color(0xFF45BB6D),
      // background: Color(0xFFFAFAFA),
      // onBackground: Color(0xFFFAFAFA),
      primaryContainer: Color(0xFFFAFAFA),
    ),
    extensions: [
      SuperTheme(
        warningColor: Color(0xFFFAAD14),
        infoColor: Color(0xFF1890FF),
        errorColor: Color(0xFFC74337),
        textColor: Colors.black54,
        successColor: Color(0xFF52C41A),
        green: Color(0xFF28B805),
        orange: Color(0xFFEC7E00),
        purple: Color(0xFF9A4CFF),
      ),
    ],
  );
  static ThemeData get night => ThemeData(
    useMaterial3: true,
    fontFamily: FontFamily.diodrumArabic,
    dividerColor: Colors.white,
    canvasColor: Color(0xFF121212),
    primaryColorLight: Colors.white,
    primaryColor: Colors.amberAccent,
    splashColor: Color(0x11000000),
    cardColor: Color(0xFF1E1E1E),
    popupMenuTheme: PopupMenuThemeData(
      color: Color(0xFF1E1E1E),
      iconColor: Colors.amberAccent,
      textStyle: ThemeStyle.normalStyle.copyWith(
        fontSize: 14,
        color: Colors.white,
      ),
      labelTextStyle: WidgetStateProperty.all<TextStyle>(
        ThemeStyle.normalStyle.copyWith(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(lowRadius * 1.5),
        side: BorderSide(color: Colors.white38.withAlpha(30), width: 0.8),
      ),
      iconSize: 25,
      surfaceTintColor: Color(0xFF1E1E1E),
      position: PopupMenuPosition.under,
      enableFeedback: true,
      shadowColor: Colors.black38,
    ),
    scrollbarTheme: ScrollbarThemeData(
      radius: Radius.circular(lowRadius),
    ),
    primaryTextTheme: TextTheme(
      bodyLarge: ThemeStyle.normalStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white,
      ),
      bodyMedium: ThemeStyle.normalStyle.copyWith(
        fontSize: 13,
        color: Colors.white,
      ),
      bodySmall: ThemeStyle.normalStyle.copyWith(
        fontSize: 12,
        color: Colors.white,
      ),
    ),
    primarySwatch: Colors.blue,
    chipTheme: ChipThemeData(
      elevation: 0,
      secondarySelectedColor: Colors.brown,
      showCheckmark: true,
      backgroundColor: Color(0xFF333333),
      secondaryLabelStyle: ThemeStyle.normalStyle.copyWith(
        fontSize: 14,
        color: Colors.white,
      ),
      labelPadding: EdgeInsets.only(top: 2, left: 10, right: 10),
      color: WidgetStatePropertyAll<Color>(Color(0xFF121212)),
      iconTheme: IconThemeData(color: Colors.white, size: 20),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(lowRadius * 7),
      ),
      side: BorderSide(color: Color(0xFF5E5E5E).withAlpha(26)),
      labelStyle: ThemeStyle.normalStyle.copyWith(
        color: Colors.white70,
      ),
      checkmarkColor: Colors.black,
      pressElevation: 0,
      selectedShadowColor: Colors.transparent,
      surfaceTintColor: Colors.orange,
      selectedColor: Colors.black.withAlpha(30),
    ),
    primaryColorDark: Colors.amber,
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(lowRadius / 2),
      ),
      visualDensity: VisualDensity.comfortable,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      overlayColor: WidgetStatePropertyAll<Color>(Color(0xFFFFFFFF)),
      checkColor: WidgetStatePropertyAll<Color>(Colors.white),
      mouseCursor: WidgetStatePropertyAll<MouseCursor>(MouseCursor.uncontrolled),
      side: BorderSide(width: 2, color: Colors.white54.withAlpha(200)),
      splashRadius: 100,
    ),
    brightness: Brightness.dark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF333333),
      elevation: 0,
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: Color(0xFF333333),
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        disabledBackgroundColor: Color(0x1000C2A8),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        backgroundColor: Colors.transparent,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: ThemeStyle.normalStyle.copyWith(
        color: Color(0xFFE8E8E8),
        fontSize: 12,
      ),
      contentPadding: EdgeInsets.zero,
      isDense: true,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 4,
      titleTextStyle: ThemeStyle.normalStyle.copyWith(color: Colors.white),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(lowRadius),
      ),
    ),
    hintColor: Color(0xFF000000),
    scaffoldBackgroundColor: Color(0xFF121212),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.white,
      circularTrackColor: Color(0xFF333333),
      linearTrackColor: Colors.white,
      refreshBackgroundColor: Color(0xFF333333),
      linearMinHeight: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(lowRadius),
        ),
        elevation: 0,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        animationDuration: Durations.long1,
        iconSize: 25,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 22,
    ),
    textTheme: TextTheme(
      bodyLarge: ThemeStyle.normalStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white,
      ),
      bodyMedium: ThemeStyle.normalStyle.copyWith(
        fontSize: 13,
        color: Colors.white,
      ),
      bodySmall: ThemeStyle.normalStyle.copyWith(
        fontSize: 12,
        color: Colors.white,
      ),
    ),
    switchTheme: SwitchThemeData(
      overlayColor: WidgetStatePropertyAll<Color>(Colors.white),
      thumbColor: WidgetStatePropertyAll<Color>(Colors.white),
      trackColor: WidgetStatePropertyAll<Color>(Colors.amberAccent),
      trackOutlineColor: WidgetStatePropertyAll<Color>(Colors.white),
    ),
    sliderTheme: SliderThemeData(
      thumbColor: Colors.white,
      overlayColor: Colors.white12,
      activeTickMarkColor: Colors.white24,
      activeTrackColor: Colors.white,
      disabledActiveTickMarkColor: Colors.blueGrey,
      disabledActiveTrackColor: Colors.blueGrey,
      disabledInactiveTickMarkColor: Colors.blueGrey,
      disabledInactiveTrackColor: Colors.blueGrey,
      disabledSecondaryActiveTrackColor: Colors.blueGrey,
      inactiveTickMarkColor: Colors.white,
      inactiveTrackColor: Colors.white24,
      secondaryActiveTrackColor: Color(0xFFC74337),
      valueIndicatorColor: Colors.orange,
    ),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      secondary: Colors.black,
      error: Color(0xFFFF4D4F),
      seedColor: Colors.amberAccent,
      onSecondary: Colors.amberAccent,
      inversePrimary: Colors.amberAccent,
      secondaryFixed: Colors.amberAccent,
      onPrimaryFixed: Colors.amberAccent,
      onSurface: Colors.white,
      onSecondaryContainer: Colors.amberAccent,
      primary: Colors.amberAccent,
      primaryContainer: Color(0xFF121212),
    ),
    extensions: [
      SuperTheme(
        warningColor: Color(0xFFFAAD14),
        infoColor: Color(0xFF1890FF),
        errorColor: Color(0xFFC74337),
        textColor: Colors.white,
        successColor: Color(0xFF52C41A),
        green: Color(0xFF28B805),
        orange: Color(0xFFEC7E00),
        purple: Color(0xFF9A4CFF),
      ),
    ],
  );



}

class SuperTheme extends ThemeExtension<SuperTheme> {
  final Color? warningColor;
  final Color? infoColor;
  final Color? errorColor;
  final Color? textColor;
  final Color? successColor;
  final Color? green;
  final Color? orange;
  final Color? purple;

  SuperTheme({
    required this.warningColor,
    required this.successColor,
    required this.errorColor,
    required this.textColor,
    required this.infoColor,
    required this.green,
    required this.orange,
    required this.purple,
  });

  @override
  SuperTheme copyWith({Color? warning, Color? info}) {
    return SuperTheme(
      warningColor: warning ?? this.warningColor,
      textColor: warning ?? this.textColor,
      infoColor: info ?? this.infoColor,
      errorColor: info ?? this.errorColor,
      successColor: info ?? this.successColor,
      purple: info ?? this.successColor,
      orange: info ?? this.successColor,
      green: info ?? this.successColor,
    );
  }

  @override
  SuperTheme lerp(ThemeExtension<SuperTheme>? other, double t) {
    if (other is! SuperTheme) {
      return this;
    }
    return SuperTheme(
      warningColor: Color.lerp(warningColor, other.warningColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      infoColor: Color.lerp(infoColor, other.infoColor, t),
      successColor: Color.lerp(successColor, other.successColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      green: Color.lerp(green, other.green, t),
      orange: Color.lerp(orange, other.orange, t),
      purple: Color.lerp(purple, other.purple, t),
    );
  }
}


extension LogPrint on String {
   void get logRed => print('\x1B[31m$this\x1B[0m');
  void get logGreen => print('\x1B[32m$this\x1B[0m');
  void logGreen2(String purple,String normal) => print('\x1B[32m$this\x1B[0m \x1B[35m$purple\x1B[0m ${normal}');
  void get logYellow => print('\x1B[33m$this\x1B[0m');
  void get logBlue => print('\x1B[34m$this\x1B[0m');
  void get logPurple =>print('\x1B[35m$this\x1B[0m');
  void get toP => print('\x1B[34m$this\x1B[0m');
}

