import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/screens/models/top_headlines_model.dart';
import 'package:news_app/core/styles/text_styles.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;
  String get formattedDate => article.publishedAt == null
      ? "Unknown Date"
      : DateFormat('MMM dd, yyyy').format(DateTime.parse(article.publishedAt!));
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: 430.w,
              height: 316.h,
              child: Image.network(
                article.urlToImage ??
                    "https://tse2.mm.bing.net/th/id/OIP.gfNfaNsfQ3-DJ1dAjks6CwHaEK?pid=Api&P=0&h=220",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 290.h,
              child: Container(
                height: 400.h,
                width: 430.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? "No Title",
                        style: TextStyles.headline1,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "${article.author ?? "Unknown Author"} • $formattedDate",
                        style: TextStyles.articleAuthorDateTextStyle,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        article.description ?? "No Description",
                        style: TextStyles.articleDescriptionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
