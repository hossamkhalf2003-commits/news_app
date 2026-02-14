import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/text_styles.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final Function onTap;

  const CategoryWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.r),
      child: Material(
        color: Colors.transparent, // Required for Ink to show
        child: Ink(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(56.r),
            border: Border.all(color: const Color(0xffE9EEFA), width: 1.r),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(56.r),
            onTap: onTap as void Function()?,
            splashColor: const Color(0xffE9EEFA),
            highlightColor: Colors.grey.withOpacity(0.1),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 6.r),
              alignment: Alignment.center,
              child: Text(title, style: TextStyles.categoriesText),
            ),
          ),
        ),
      ),
    );
  }
}
