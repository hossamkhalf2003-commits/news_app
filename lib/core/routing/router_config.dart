import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/screens/article_details_screen.dart';
import 'package:news_app/core/screens/home_screen.dart';
import 'package:news_app/core/screens/models/top_headlines_model.dart';
import 'package:news_app/core/screens/search_result_screen.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.search,
        name: AppRoutes.search,
        builder: (context, state) => Container(),
      ),
      GoRoute(
        path: AppRoutes.searchResult,
        name: AppRoutes.searchResult,
        builder: (context, state) {
          final String? qurey = state.extra as String?;
          return SearchResultScreen(qurey: qurey ?? "");
        },
      ),
      GoRoute(
        path: AppRoutes.articleDetails,
        name: AppRoutes.articleDetails,
        builder: (context, state) {
          final Article article = state.extra as Article;
          return ArticleDetailsScreen(article: article);
        },
      ),
    ],
  );
}
