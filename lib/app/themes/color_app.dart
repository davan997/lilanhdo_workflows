import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  static Color primary = const Color(0xff246BFD);
  static Color secondary = const Color(0xffC25FFF);
  static Color background = const Color(0xff181A20);
  static Color background2 = const Color(0xff262A34);
  static Color border = const Color(0xff494C54);
  static Color deActive = const Color(0xff5E6272);
  static Color deActiveDark = const Color(0xff3A3D46);
  static Color lightModeActive = const Color(0xff200745);
  static Color colorFul1 = const Color(0xffA06AF9);
  static Color colorFul2 = const Color(0xffFBA3FF);
  static Color colorFul3 = const Color(0xff8E96FF);
  static Color colorFul4 = const Color(0xff94F0F0);
  static Color colorFul5 = const Color(0xffA5F59C);
  static Color colorFul6 = const Color(0xffFFDD72);
}

class AppGradient {
  const AppGradient._();
  static RadialGradient gradient_1 = const RadialGradient(
    radius: 1.5,
    center: Alignment(0.6, 0.7),
    stops: [0, 0.3889, 0.674, 1],
    colors: [
      Color(0xffFFB8E0),
      Color(0xffBE9EFF),
      Color(0xff88C0FC),
      Color(0xff86FF99),
    ],
  );
  static LinearGradient gradient_2 = const LinearGradient(
    stops: [0, 1],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xffC393FF),
      Color(0xffE42A6C),
    ],
  );
  static LinearGradient gradient_3 = const LinearGradient(
    stops: [0, 1],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xffFFEBA2),
      Color(0xffFF8669),
    ],
  );
  static LinearGradient gradient_4 = const LinearGradient(
    stops: [0, 1],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff9ADB7F),
      Color(0xff6EA95C),
    ],
  );
  static RadialGradient gradient_5 = const RadialGradient(
    radius: 0.875,
    stops: [0, 0.4643, 1],
    center: Alignment(0.55, -0.55),
    colors: [
      Color(0xffFFF9B0),
      Color(0xffD3FFFA),
      Color(0xffFFC4FA),
    ],
  );
  static LinearGradient gradient_7 = const LinearGradient(
    stops: [0, 1],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffBBFFE7),
      Color(0xff86FFCA),
    ],
  );
  static LinearGradient gradient_8 = const LinearGradient(
    stops: [0, 1],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffFFB28E),
      Color(0xffFF7A55),
    ],
  );
  static LinearGradient gradient_9 = const LinearGradient(
    stops: [0, 1],
    colors: [
      Color(0xff353843),
      Color(0xff181A20),
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
