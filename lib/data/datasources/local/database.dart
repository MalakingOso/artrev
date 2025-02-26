import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Articles extends Table {
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

class Flashcards extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get articleId => integer().references(Articles, #id)();
  TextColumn get question => text()();
  TextColumn get answer => text()();
  IntColumn get box => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextReview => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();
}

@DriftDatabase(tables: [Articles, Flashcards])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'artrev.sqlite'));
    return NativeDatabase(file);
  });
}
