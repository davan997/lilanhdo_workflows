import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  static Color primary = const Color(0xff246BFD);
  static Color background = const Color(0xff181A20);
  static Color background2 = const Color(0xff262A34);
  static Color border = const Color(0xff494C54);
  static Color deActive = const Color(0xff5E6272);
  static Color colorFul1 = const Color(0xffA06AF9);
  static Color colorFul2 = const Color(0xffFBA3FF);
  static Color colorFul4 = const Color(0xff94F0F0);
}

class AppGradient {
  const AppGradient._();

  static LinearGradient inReview = const LinearGradient(
    stops: [0, 1],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xffFFEBA2),
      Color(0xffFF8669),
    ],
  );

  static LinearGradient wip = const LinearGradient(
    transform: GradientRotation(6.6),
    stops: [0, 0.3889, 0.674, 1],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [
      Color(0xffFFB8E0),
      Color(0xffBE9EFF),
      Color(0xff88C0FC),
      Color(0xff86FF99),
    ],
  );

  static LinearGradient wireFraming = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, .1672, .1809, .3339, .5005, .6657, .8332, 1],
    colors: [
      Color(0xffFFAFAF),
      Color(0xffFFB07B),
      Color(0xffFFB37A),
      Color(0xffFFECB7),
      Color(0xffD6FFAA),
      Color(0xff0091FF),
      Color(0xff6236FF),
      Color(0xffB620E0),
    ],
  );
}
