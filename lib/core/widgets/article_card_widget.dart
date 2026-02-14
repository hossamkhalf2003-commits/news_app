// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/screens/models/top_headlines_model.dart';
import 'package:news_app/core/styles/text_styles.dart';

class ArticleCard extends StatelessWidget {
  final Article? article;
  final double? width;
  final double? height;
  String get formattedDate => article?.publishedAt == null
      ? "Unknown Date"
      : DateFormat(
          'MMM dd, yyyy',
        ).format(DateTime.parse(article!.publishedAt!));
  const ArticleCard({
    super.key,
    required this.article,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          InkWell(
            onTap: () {
              GoRouter.of(
                context,
              ).pushNamed(AppRoutes.articleDetails, extra: article);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: SizedBox(
                    width: 250.w,
                    child: Text(
                      article?.title ?? "No Title",
                      maxLines: 2,
                      style: TextStyles.headline2,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250.w,
                  child: Text(
                    "${article?.author ?? "Unknown Author"} • $formattedDate",
                    style: TextStyles.bodyText1,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              width: width ?? 100.w,
              height: height ?? 80.h,
              fit: BoxFit.fill,
              imageUrl:
                  article?.urlToImage ??
                  "https://tse2.mm.bing.net/th/id/OIP.gfNfaNsfQ3-DJ1dAjks6CwHaEK?pid=Api&P=0&h=220",
            ),
          ),
        ],
      ),
    );
  }
}
