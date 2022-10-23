import 'package:flutter_elisoft/models/article_model.dart';

import '../models/failure_model.dart';
import '../services/api_service.dart';

class ArticleRepository {
  String path = 'articles';

  Future<List<ArticleModel>>? fetchArticle() async {
    final response = await ApiService().getData(
      path: path,
    );
    if (response['code'] == 200) {
      final data = response['articles'] as List<dynamic>;
      return data.map((article) => ArticleModel.fromMap(article)).toList();
    } else {
      throw const Failure(message: 'There was an error.');
    }
  }
}
