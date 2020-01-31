import 'dart:convert';

import 'package:first_flutter/data/ApiService.dart';
import 'package:first_flutter/data/model/NewsModel.dart';

class Repository {
  final apiService = ApiService();

  Future<Stream<NewsModel>> getNews() async {
    final stream = await apiService.fetchNews();
    return stream.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => ((data as dynamic)['articles'] as List))
        .map((data) => NewsModel.fromJson(data));
  }
}
