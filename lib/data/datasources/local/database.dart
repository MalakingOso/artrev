// lib/data/datasources/local/database.dart
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:artrev/data/models/article.dart';

part 'database.g.dart';

class ArticlesTable extends Table {
  // Rename the table to ArticlesTable but keep the table name 'articles'
  @override
  String get tableName => 'articles';
  
  IntColumn get id => integer().autoIncrement()();
  TextColumn get pubmedId => text()();
  TextColumn get title => text()();
  TextColumn get authors => text()();
  TextColumn get abstract => text().nullable()();
  TextColumn get journal => text()();
  TextColumn get publicationDate => text()();
  TextColumn get doi => text().nullable()();
  TextColumn get pdfPath => text().nullable()();
  DateTimeColumn get savedAt => dateTime().withDefault(currentDateAndTime)();
}

class FlashcardsTable extends Table {
  // Rename the table to FlashcardsTable but keep the table name 'flashcards'
  @override
  String get tableName => 'flashcards';
  
  IntColumn get id => integer().autoIncrement()();
  IntColumn get articleId => integer().references(ArticlesTable, #id)();
  TextColumn get question => text()();
  TextColumn get answer => text()();
  IntColumn get box => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextReview => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();
}

@DriftDatabase(tables: [ArticlesTable, FlashcardsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  
  // Convert database entity to domain model
  Article articleFromDb(ArticlesTableData data) {
    return Article(
      pubmedId: data.pubmedId,
      title: data.title,
      authors: data.authors,
      abstract: data.abstract ?? '',
      journal: data.journal,
      publicationDate: data.publicationDate,
      doi: data.doi ?? '',
      pdfPath: data.pdfPath,
    );
  }
  
  // Convert domain model to database companion
  ArticlesTableCompanion articleToDbCompanion(Article article) {
    return ArticlesTableCompanion.insert(
      pubmedId: article.pubmedId,
      title: article.title,
      authors: article.authors,
      abstract: article.abstract.isEmpty ? const Value.absent() : Value(article.abstract),
      journal: article.journal,
      publicationDate: article.publicationDate,
      doi: article.doi.isEmpty ? const Value.absent() : Value(article.doi),
      pdfPath: article.pdfPath == null ? const Value.absent() : Value(article.pdfPath!),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'urogyneconnect.sqlite'));
    return NativeDatabase(file);
  });
}