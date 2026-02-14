import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/screens/models/top_headlines_model.dart';
import 'package:news_app/core/screens/services/home_screen_services.dart';
import 'package:news_app/core/styles/text_styles.dart';
import 'package:news_app/core/widgets/article_card_widget.dart';
import 'package:news_app/core/widgets/category_widget.dart';
import 'package:news_app/core/widgets/headline_widget.dart';
import 'package:news_app/core/widgets/search_text_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE9EEFA),
        toolbarHeight: 120.h,
        title: Text("explore".tr(), style: TextStyles.headline1),
        actions: [
          SearchTextFieldWidget(),
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == "en") {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
            },
            icon: Icon(Icons.language_outlined, color: Colors.black),
          ),
        ],
      ),
      body: FutureBuilder(
        future: HomeScreenServices().getTopHeadLines(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xff231F20)),
            );
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text("error".tr()));
          } else if (asyncSnapshot.hasData) {
            TopHeadlinesModel topHeadlinesModel =
                asyncSnapshot.data as TopHeadlinesModel;
            if (topHeadlinesModel.totalResults == 0) {
              return Center(child: Text("no_data".tr()));
            }
            return Column(
              children: [
                SizedBox(height: 16.r),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 32.r),
                  child: SizedBox(
                    height: 40.h,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        CategoryWidget(
                          title: "travel".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResult,
                              extra: "travel".tr(),
                            );
                          },
                        ),
                        CategoryWidget(
                          title: "business".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResult,
                              extra: "business".tr(),
                            );
                          },
                        ),
                        CategoryWidget(
                          title: "technology".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResult,
                              extra: "technology".tr(),
                            );
                          },
                        ),
                        CategoryWidget(
                          title: "entertainment".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResult,
                              extra: "entertainment".tr(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.r),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.r),
                  child: Column(
                    children: [
                      HeadlineWidget(
                        title: topHeadlinesModel.articles![0].title!,
                        authorName:
                            topHeadlinesModel.articles![0].author ??
                            "Unknown Author",
                        date: DateFormat('MMM dd, yyyy').format(
                          DateTime.parse(
                            topHeadlinesModel.articles![0].publishedAt!,
                          ),
                        ),
                        imageUrl: topHeadlinesModel.articles![0].urlToImage,
                      ),
                      SizedBox(height: 24.r),
                    ],
                  ),
                ),
                SizedBox(height: 16.r),
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
