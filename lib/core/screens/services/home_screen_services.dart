import 'dart:developer';

import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/core/screens/models/top_headlines_model.dart';

class HomeScreenServices {
  getTopHeadLines() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.topHeadlines,
        query: {"country": "us", "apiKey": ApiEndpoints.apiKey},
      );
      if (response.statusCode == 200) {
        TopHeadlinesModel topHeadlinesModel = TopHeadlinesModel.fromJson(
          response.data,
        );
        return topHeadlinesModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}
