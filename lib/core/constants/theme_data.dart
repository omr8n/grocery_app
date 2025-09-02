// import 'package:flutter/material.dart';

// import '../utils/app_colors.dart';

// class Styles {
//   static ThemeData themeData(
//       {required bool isDarkTheme, required BuildContext context}) {
//     return ThemeData(
//       scaffoldBackgroundColor:
//           //0A1931  // white yellow 0xFFFCF8EC
//           isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
//       primaryColor: Colors.blue,
//       //
//       colorScheme: ThemeData().colorScheme.copyWith(
//             secondary:
//                 isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDFD),
//             brightness: isDarkTheme ? Brightness.dark : Brightness.light,
//           ),
//       //
//       cardColor:
//           isDarkTheme ? const Color(0xFF0a0d2c) : const Color(0xFFF2FDFD),
//       //
//       canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
//       //
//       buttonTheme: Theme.of(context).buttonTheme.copyWith(
//           colorScheme: isDarkTheme
//               ? const ColorScheme.dark()
//               : const ColorScheme.light()),
//       brightness: isDarkTheme ? Brightness.dark : Brightness.light,
//       appBarTheme: AppBarTheme(
//         iconTheme: IconThemeData(
//           color: isDarkTheme ? Colors.white : Colors.black,
//         ),
//         backgroundColor: isDarkTheme
//             ? AppColors.darkScaffoldColor
//             : AppColors.lightScaffoldColor,
//         elevation: 0,
//         centerTitle: false,
//         titleTextStyle: TextStyle(
//           color: isDarkTheme ? Colors.white : Colors.black,
//         ),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         contentPadding: const EdgeInsets.all(10),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//             width: 1,
//             color: Colors.transparent,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             width: 1,
//             color: isDarkTheme ? Colors.white : Colors.black,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             width: 1,
//             color: Theme.of(context).colorScheme.error,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             width: 1,
//             color: Theme.of(context).colorScheme.error,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class Styles {
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context,
  }) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
          ? AppColors.darkScaffoldColor
          : AppColors.lightScaffoldColor,
      cardColor:
          isDarkTheme ? AppColors.lightPrimary : AppColors.lightCardColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: isDarkTheme ? Colors.white : AppColors.darkScaffoldColor),
        backgroundColor: isDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: isDarkTheme ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
