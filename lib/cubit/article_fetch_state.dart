part of 'article_fetch_cubit.dart';

abstract class ArticleFetchState extends Equatable {
  const ArticleFetchState();

  @override
  List<Object> get props => [];
}

class ArticleFetchInitial extends ArticleFetchState {}

class ArticleFetchLoading extends ArticleFetchState {}

class ArticleFetchSuccess extends ArticleFetchState {
  final List<ArticleModel> articleList;

  const ArticleFetchSuccess({required this.articleList});

  @override
  List<Object> get props => [articleList];
}

class ArticleFetchFailed extends ArticleFetchState {
  final Failure failure;
  const ArticleFetchFailed({
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}
