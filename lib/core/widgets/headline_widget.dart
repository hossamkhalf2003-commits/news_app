import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/text_styles.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({
    super.key,
    required this.title,
    required this.authorName,
    required this.date,
    this.imageUrl,
    this.width,
    this.height,
  });
  final String title;
  final String authorName;
  final String date;
  final String? imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            height: height ?? 206.h,
            width: width ?? double.infinity,
            imageUrl:
                imageUrl ??
                "https://tse2.mm.bing.net/th/id/OIP.gfNfaNsfQ3-DJ1dAjks6CwHaEK?pid=Api&P=0&h=220",
          ),
        ),
        SizedBox(height: 16.r),
        Text(title, style: TextStyles.headline2),
        SizedBox(height: 12.r),
        Text("$authorName-$date", style: TextStyles.bodyText1),
      ],
    );
  }
}
