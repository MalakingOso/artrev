import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:artrev/data/models/article.dart';
import 'package:artrev/data/repositories/article_repository.dart';

part 'article_viewmodel.g.dart';

@riverpod
class ArticleSearchState extends _$ArticleSearchState {
  @override
  FutureOr<List<Article>> build() async {
    return [];
  }

  Future<void> searchArticles(String query) async {
    state = const AsyncLoading();
    
    try {
      final articleRepository = ref.read(articleRepositoryProvider);
      final articles = await articleRepository.searchArticles(query);
      state = AsyncData(articles);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

  Future<void> saveArticle(Article article) async {
    final articleRepository = ref.read(articleRepositoryProvider);
    await articleRepository.saveArticle(article);
  }
}

@riverpod
class SavedArticlesState extends _$SavedArticlesState {
  @override
  FutureOr<List<Article>> build() async {
    return _fetchSavedArticles();
  }

  Future<List<Article>> _fetchSavedArticles() async {
    final articleRepository = ref.read(articleRepositoryProvider);
    return articleRepository.getSavedArticles();
  }

  Future<void> refreshSavedArticles() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetchSavedArticles());
  }
}
