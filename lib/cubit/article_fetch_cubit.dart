import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_elisoft/models/article_model.dart';
import 'package:flutter_elisoft/repo/article_repo.dart';

import '../models/failure_model.dart';

part 'article_fetch_state.dart';

class ArticleFetchCubit extends Cubit<ArticleFetchState> {
  ArticleFetchCubit() : super(ArticleFetchInitial());
  Future<void> fetchArticle() async {
    emit(ArticleFetchLoading());
    try {
      final List<ArticleModel>? articleList =
          await ArticleRepository().fetchArticle();
      emit(ArticleFetchSuccess(articleList: articleList ?? []));
    } on Failure catch (err) {
      emit(ArticleFetchFailed(failure: err));
    } catch (err) {
      rethrow;
    }
  }
}
