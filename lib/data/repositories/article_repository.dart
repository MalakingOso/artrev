// lib/data/repositories/article_repository.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:artrev/core/services/pubmed_service.dart';
import 'package:artrev/data/datasources/local/database.dart';
import 'package:artrev/data/models/article.dart';

part 'article_repository.g.dart';

class ArticleRepository {
  final PubmedService _pubmedService;
  final AppDatabase _database;

  ArticleRepository(this._pubmedService, this._database);

  // Search methods remain the same
  Future<List<Article>> searchArticles(String query, {int page = 0, int pageSize = 20}) async {
    try {
      final searchResult = await _pubmedService.searchArticles(
        query: query,
        retMax: pageSize,
        retStart: page * pageSize,
      );

      final pmids = List<String>.from(
        searchResult['esearchresult']['idlist'] as List<dynamic>
      );

      if (pmids.isEmpty) {
        return [];
      }

      final xmlResponse = await _pubmedService.fetchArticleDetails(pmids);
      return _pubmedService.parseArticles(xmlResponse);
    } catch (e) {
      // Log error
      rethrow;
    }
  }

  // Update to use the conversion methods
  Future<void> saveArticle(Article article) async {
    await _database.into(_database.articlesTable).insert(
      _database.articleToDbCompanion(article),
    );
  }

  // Update to use the conversion methods
  Future<List<Article>> getSavedArticles() async {
    final results = await _database.select(_database.articlesTable).get();
    return results.map(_database.articleFromDb).toList();
  }
}

@riverpod
ArticleRepository articleRepository(ArticleRepositoryRef ref) {
  final pubmedService = ref.watch(pubmedServiceProvider);
  return ArticleRepository(pubmedService, AppDatabase());
}