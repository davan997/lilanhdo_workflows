import 'package:get/get.dart';

double getHeight(double value) {
  double convert = 812 / value;
  double result = Get.height / convert;
  return result;
}

double getWidth(double value) {
  double convert = 375 / value;
  double result = Get.width / convert;
  return result;
}

double getBorderRadius(double value) {
  double height = getHeight(value);
  double width = getWidth(value);
  double result = (height + width) / 2;
  return result;
}
