import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:artrev/core/services/pubmed_service.dart';
import 'package:artrev/data/datasources/local/database.dart';
import 'package:artrev/data/models/article.dart';

part 'article_repository.g.dart';

class ArticleRepository {
  final PubmedService _pubmedService;
  final AppDatabase _database;

  ArticleRepository(this._pubmedService, this._database);

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

  Future<void> saveArticle(Article article) async {
    await _database.into(_database.articles).insert(
      ArticlesCompanion.insert(
        pubmedId: article.pubmedId,
        title: article.title,
        authors: article.authors,
        abstract: article.abstract.isEmpty ? Value.absent() : Value(article.abstract),
        journal: article.journal,
        publicationDate: article.publicationDate,
        doi: article.doi.isEmpty ? Value.absent() : Value(article.doi),
        pdfPath: article.pdfPath == null ? Value.absent() : Value(article.pdfPath!),
      ),
    );
  }

  Future<List<Article>> getSavedArticles() async {
    final results = await _database.select(_database.articles).get();
    return results.map((row) => Article(
      pubmedId: row.pubmedId,
      title: row.title,
      authors: row.authors,
      abstract: row.abstract ?? '',
      journal: row.journal,
      publicationDate: row.publicationDate,
      doi: row.doi ?? '',
      pdfPath: row.pdfPath,
    )).toList();
  }
}

@riverpod
ArticleRepository articleRepository(ArticleRepositoryRef ref) {
  final pubmedService = ref.watch(pubmedServiceProvider);
  return ArticleRepository(pubmedService, AppDatabase());
}
