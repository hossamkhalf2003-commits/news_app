import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static const TextStyle headline1 = TextStyle(
    fontFamily: "inter",
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: Color(0xff231F20),
  );
  static TextStyle headline2 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle bodyText1 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
  static TextStyle categoriesText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: const Color.fromARGB(255, 0, 0, 0),
  );
  static TextStyle articleAuthorDateTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: const Color(0xff231F20),
  );
  static TextStyle articleDescriptionTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: const Color(0xff231F20),
  );
}
