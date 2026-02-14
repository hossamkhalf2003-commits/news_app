import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/screens/models/top_headlines_model.dart';
import 'package:news_app/core/screens/services/search_result_screen_services.dart';
import 'package:news_app/core/styles/text_styles.dart';
import 'package:news_app/core/widgets/article_card_widget.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key, required this.qurey});
  final String qurey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9EEFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffE9EEFA),
        toolbarHeight: 120.h,
        title: Text(
          "Search Result".tr(),
          style: TextStyles.headline1.copyWith(fontSize: 24.sp),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SearchResultScreenServices().searchItemByName(qurey),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xff231F20)),
            );
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text(asyncSnapshot.error.toString()));
          } else if (asyncSnapshot.hasData) {
            TopHeadlinesModel topHeadlinesModel =
                asyncSnapshot.data as TopHeadlinesModel;
            if (topHeadlinesModel.totalResults == 0) {
              return Center(child: Text("no_data".tr()));
            }
            return Column(
              children: [
                SizedBox(height: 24.r),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.r),
                    child: ListView.builder(
                      itemCount: topHeadlinesModel.articles!.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ArticleCard(
                          article: topHeadlinesModel.articles![index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
