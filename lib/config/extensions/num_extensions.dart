// import 'package:firstock_trading_app/utils/app_tools.dart';
// import 'package:firstock_trading_app/utils/theme/app_colors.dart';
// import 'package:flutter/material.dart' show BuildContext, Color;

// extension NumExtensions on num {
//   String toIndianFormat({int decimalDigits = 2, bool showSymbol = false}) {
//     return AppTools.currencyFormatter(
//       decimalDigits: decimalDigits,
//       showSymbol: showSymbol,
//     ).format(this);
//   }

//   Color toSignBasedColor(BuildContext context, {bool isSecondary = false}) {
//     if (this == 0) {
//       return isSecondary ? context.appColors.black600 : context.appColors.black800;
//     } else if (isNegative) {
//       return context.appColors.red500;
//     } else {
//       return context.appColors.green500;
//     }
//   }
// }

// extension FigmaDimension on num {
//   double toFigmaHeight(double fontSize) {
//     return this / fontSize;
//   }
// }
