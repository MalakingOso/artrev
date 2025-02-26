// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ArticlesTable extends Articles with TableInfo<$ArticlesTable, Article> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _pubmedIdMeta =
      const VerificationMeta('pubmedId');
  @override
  late final GeneratedColumn<String> pubmedId = GeneratedColumn<String>(
      'pubmed_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorsMeta =
      const VerificationMeta('authors');
  @override
  late final GeneratedColumn<String> authors = GeneratedColumn<String>(
      'authors', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _abstractMeta =
      const VerificationMeta('abstract');
  @override
  late final GeneratedColumn<String> abstract = GeneratedColumn<String>(
      'abstract', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _journalMeta =
      const VerificationMeta('journal');
  @override
  late final GeneratedColumn<String> journal = GeneratedColumn<String>(
      'journal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _publicationDateMeta =
      const VerificationMeta('publicationDate');
  @override
  late final GeneratedColumn<String> publicationDate = GeneratedColumn<String>(
      'publication_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doiMeta = const VerificationMeta('doi');
  @override
  late final GeneratedColumn<String> doi = GeneratedColumn<String>(
      'doi', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pdfPathMeta =
      const VerificationMeta('pdfPath');
  @override
  late final GeneratedColumn<String> pdfPath = GeneratedColumn<String>(
      'pdf_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _savedAtMeta =
      const VerificationMeta('savedAt');
  @override
  late final GeneratedColumn<DateTime> savedAt = GeneratedColumn<DateTime>(
      'saved_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        pubmedId,
        title,
        authors,
        abstract,
        journal,
        publicationDate,
        doi,
        pdfPath,
        savedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'articles';
  @override
  VerificationContext validateIntegrity(Insertable<Article> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pubmed_id')) {
      context.handle(_pubmedIdMeta,
          pubmedId.isAcceptableOrUnknown(data['pubmed_id']!, _pubmedIdMeta));
    } else if (isInserting) {
      context.missing(_pubmedIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('authors')) {
      context.handle(_authorsMeta,
          authors.isAcceptableOrUnknown(data['authors']!, _authorsMeta));
    } else if (isInserting) {
      context.missing(_authorsMeta);
    }
    if (data.containsKey('abstract')) {
      context.handle(_abstractMeta,
          abstract.isAcceptableOrUnknown(data['abstract']!, _abstractMeta));
    }
    if (data.containsKey('journal')) {
      context.handle(_journalMeta,
          journal.isAcceptableOrUnknown(data['journal']!, _journalMeta));
    } else if (isInserting) {
      context.missing(_journalMeta);
    }
    if (data.containsKey('publication_date')) {
      context.handle(
          _publicationDateMeta,
          publicationDate.isAcceptableOrUnknown(
              data['publication_date']!, _publicationDateMeta));
    } else if (isInserting) {
      context.missing(_publicationDateMeta);
    }
    if (data.containsKey('doi')) {
      context.handle(
          _doiMeta, doi.isAcceptableOrUnknown(data['doi']!, _doiMeta));
    }
    if (data.containsKey('pdf_path')) {
      context.handle(_pdfPathMeta,
          pdfPath.isAcceptableOrUnknown(data['pdf_path']!, _pdfPathMeta));
    }
    if (data.containsKey('saved_at')) {
      context.handle(_savedAtMeta,
          savedAt.isAcceptableOrUnknown(data['saved_at']!, _savedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Article map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Article(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      pubmedId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubmed_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      authors: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}authors'])!,
      abstract: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}abstract']),
      journal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}journal'])!,
      publicationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}publication_date'])!,
      doi: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doi']),
      pdfPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pdf_path']),
      savedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}saved_at'])!,
    );
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(attachedDatabase, alias);
  }
}

class Article extends DataClass implements Insertable<Article> {
  final int id;
  final String pubmedId;
  final String title;
  final String authors;
  final String? abstract;
  final String journal;
  final String publicationDate;
  final String? doi;
  final String? pdfPath;
  final DateTime savedAt;
  const Article(
      {required this.id,
      required this.pubmedId,
      required this.title,
      required this.authors,
      this.abstract,
      required this.journal,
      required this.publicationDate,
      this.doi,
      this.pdfPath,
      required this.savedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pubmed_id'] = Variable<String>(pubmedId);
    map['title'] = Variable<String>(title);
    map['authors'] = Variable<String>(authors);
    if (!nullToAbsent || abstract != null) {
      map['abstract'] = Variable<String>(abstract);
    }
    map['journal'] = Variable<String>(journal);
    map['publication_date'] = Variable<String>(publicationDate);
    if (!nullToAbsent || doi != null) {
      map['doi'] = Variable<String>(doi);
    }
    if (!nullToAbsent || pdfPath != null) {
      map['pdf_path'] = Variable<String>(pdfPath);
    }
    map['saved_at'] = Variable<DateTime>(savedAt);
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      id: Value(id),
      pubmedId: Value(pubmedId),
      title: Value(title),
      authors: Value(authors),
      abstract: abstract == null && nullToAbsent
          ? const Value.absent()
          : Value(abstract),
      journal: Value(journal),
      publicationDate: Value(publicationDate),
      doi: doi == null && nullToAbsent ? const Value.absent() : Value(doi),
      pdfPath: pdfPath == null && nullToAbsent
          ? const Value.absent()
          : Value(pdfPath),
      savedAt: Value(savedAt),
    );
  }

  factory Article.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Article(
      id: serializer.fromJson<int>(json['id']),
      pubmedId: serializer.fromJson<String>(json['pubmedId']),
      title: serializer.fromJson<String>(json['title']),
      authors: serializer.fromJson<String>(json['authors']),
      abstract: serializer.fromJson<String?>(json['abstract']),
      journal: serializer.fromJson<String>(json['journal']),
      publicationDate: serializer.fromJson<String>(json['publicationDate']),
      doi: serializer.fromJson<String?>(json['doi']),
      pdfPath: serializer.fromJson<String?>(json['pdfPath']),
      savedAt: serializer.fromJson<DateTime>(json['savedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pubmedId': serializer.toJson<String>(pubmedId),
      'title': serializer.toJson<String>(title),
      'authors': serializer.toJson<String>(authors),
      'abstract': serializer.toJson<String?>(abstract),
      'journal': serializer.toJson<String>(journal),
      'publicationDate': serializer.toJson<String>(publicationDate),
      'doi': serializer.toJson<String?>(doi),
      'pdfPath': serializer.toJson<String?>(pdfPath),
      'savedAt': serializer.toJson<DateTime>(savedAt),
    };
  }

  Article copyWith(
          {int? id,
          String? pubmedId,
          String? title,
          String? authors,
          Value<String?> abstract = const Value.absent(),
          String? journal,
          String? publicationDate,
          Value<String?> doi = const Value.absent(),
          Value<String?> pdfPath = const Value.absent(),
          DateTime? savedAt}) =>
      Article(
        id: id ?? this.id,
        pubmedId: pubmedId ?? this.pubmedId,
        title: title ?? this.title,
        authors: authors ?? this.authors,
        abstract: abstract.present ? abstract.value : this.abstract,
        journal: journal ?? this.journal,
        publicationDate: publicationDate ?? this.publicationDate,
        doi: doi.present ? doi.value : this.doi,
        pdfPath: pdfPath.present ? pdfPath.value : this.pdfPath,
        savedAt: savedAt ?? this.savedAt,
      );
  Article copyWithCompanion(ArticlesCompanion data) {
    return Article(
      id: data.id.present ? data.id.value : this.id,
      pubmedId: data.pubmedId.present ? data.pubmedId.value : this.pubmedId,
      title: data.title.present ? data.title.value : this.title,
      authors: data.authors.present ? data.authors.value : this.authors,
      abstract: data.abstract.present ? data.abstract.value : this.abstract,
      journal: data.journal.present ? data.journal.value : this.journal,
      publicationDate: data.publicationDate.present
          ? data.publicationDate.value
          : this.publicationDate,
      doi: data.doi.present ? data.doi.value : this.doi,
      pdfPath: data.pdfPath.present ? data.pdfPath.value : this.pdfPath,
      savedAt: data.savedAt.present ? data.savedAt.value : this.savedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('id: $id, ')
          ..write('pubmedId: $pubmedId, ')
          ..write('title: $title, ')
          ..write('authors: $authors, ')
          ..write('abstract: $abstract, ')
          ..write('journal: $journal, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('doi: $doi, ')
          ..write('pdfPath: $pdfPath, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pubmedId, title, authors, abstract,
      journal, publicationDate, doi, pdfPath, savedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.id == this.id &&
          other.pubmedId == this.pubmedId &&
          other.title == this.title &&
          other.authors == this.authors &&
          other.abstract == this.abstract &&
          other.journal == this.journal &&
          other.publicationDate == this.publicationDate &&
          other.doi == this.doi &&
          other.pdfPath == this.pdfPath &&
          other.savedAt == this.savedAt);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<int> id;
  final Value<String> pubmedId;
  final Value<String> title;
  final Value<String> authors;
  final Value<String?> abstract;
  final Value<String> journal;
  final Value<String> publicationDate;
  final Value<String?> doi;
  final Value<String?> pdfPath;
  final Value<DateTime> savedAt;
  const ArticlesCompanion({
    this.id = const Value.absent(),
    this.pubmedId = const Value.absent(),
    this.title = const Value.absent(),
    this.authors = const Value.absent(),
    this.abstract = const Value.absent(),
    this.journal = const Value.absent(),
    this.publicationDate = const Value.absent(),
    this.doi = const Value.absent(),
    this.pdfPath = const Value.absent(),
    this.savedAt = const Value.absent(),
  });
  ArticlesCompanion.insert({
    this.id = const Value.absent(),
    required String pubmedId,
    required String title,
    required String authors,
    this.abstract = const Value.absent(),
    required String journal,
    required String publicationDate,
    this.doi = const Value.absent(),
    this.pdfPath = const Value.absent(),
    this.savedAt = const Value.absent(),
  })  : pubmedId = Value(pubmedId),
        title = Value(title),
        authors = Value(authors),
        journal = Value(journal),
        publicationDate = Value(publicationDate);
  static Insertable<Article> custom({
    Expression<int>? id,
    Expression<String>? pubmedId,
    Expression<String>? title,
    Expression<String>? authors,
    Expression<String>? abstract,
    Expression<String>? journal,
    Expression<String>? publicationDate,
    Expression<String>? doi,
    Expression<String>? pdfPath,
    Expression<DateTime>? savedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pubmedId != null) 'pubmed_id': pubmedId,
      if (title != null) 'title': title,
      if (authors != null) 'authors': authors,
      if (abstract != null) 'abstract': abstract,
      if (journal != null) 'journal': journal,
      if (publicationDate != null) 'publication_date': publicationDate,
      if (doi != null) 'doi': doi,
      if (pdfPath != null) 'pdf_path': pdfPath,
      if (savedAt != null) 'saved_at': savedAt,
    });
  }

  ArticlesCompanion copyWith(
      {Value<int>? id,
      Value<String>? pubmedId,
      Value<String>? title,
      Value<String>? authors,
      Value<String?>? abstract,
      Value<String>? journal,
      Value<String>? publicationDate,
      Value<String?>? doi,
      Value<String?>? pdfPath,
      Value<DateTime>? savedAt}) {
    return ArticlesCompanion(
      id: id ?? this.id,
      pubmedId: pubmedId ?? this.pubmedId,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      abstract: abstract ?? this.abstract,
      journal: journal ?? this.journal,
      publicationDate: publicationDate ?? this.publicationDate,
      doi: doi ?? this.doi,
      pdfPath: pdfPath ?? this.pdfPath,
      savedAt: savedAt ?? this.savedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pubmedId.present) {
      map['pubmed_id'] = Variable<String>(pubmedId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (authors.present) {
      map['authors'] = Variable<String>(authors.value);
    }
    if (abstract.present) {
      map['abstract'] = Variable<String>(abstract.value);
    }
    if (journal.present) {
      map['journal'] = Variable<String>(journal.value);
    }
    if (publicationDate.present) {
      map['publication_date'] = Variable<String>(publicationDate.value);
    }
    if (doi.present) {
      map['doi'] = Variable<String>(doi.value);
    }
    if (pdfPath.present) {
      map['pdf_path'] = Variable<String>(pdfPath.value);
    }
    if (savedAt.present) {
      map['saved_at'] = Variable<DateTime>(savedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('id: $id, ')
          ..write('pubmedId: $pubmedId, ')
          ..write('title: $title, ')
          ..write('authors: $authors, ')
          ..write('abstract: $abstract, ')
          ..write('journal: $journal, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('doi: $doi, ')
          ..write('pdfPath: $pdfPath, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }
}

class $FlashcardsTable extends Flashcards
    with TableInfo<$FlashcardsTable, Flashcard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlashcardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _articleIdMeta =
      const VerificationMeta('articleId');
  @override
  late final GeneratedColumn<int> articleId = GeneratedColumn<int>(
      'article_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES articles (id)'));
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _boxMeta = const VerificationMeta('box');
  @override
  late final GeneratedColumn<int> box = GeneratedColumn<int>(
      'box', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _nextReviewMeta =
      const VerificationMeta('nextReview');
  @override
  late final GeneratedColumn<DateTime> nextReview = GeneratedColumn<DateTime>(
      'next_review', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastReviewedAtMeta =
      const VerificationMeta('lastReviewedAt');
  @override
  late final GeneratedColumn<DateTime> lastReviewedAt =
      GeneratedColumn<DateTime>('last_reviewed_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        articleId,
        question,
        answer,
        box,
        nextReview,
        createdAt,
        lastReviewedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flashcards';
  @override
  VerificationContext validateIntegrity(Insertable<Flashcard> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('article_id')) {
      context.handle(_articleIdMeta,
          articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta));
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('box')) {
      context.handle(
          _boxMeta, box.isAcceptableOrUnknown(data['box']!, _boxMeta));
    }
    if (data.containsKey('next_review')) {
      context.handle(
          _nextReviewMeta,
          nextReview.isAcceptableOrUnknown(
              data['next_review']!, _nextReviewMeta));
    } else if (isInserting) {
      context.missing(_nextReviewMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('last_reviewed_at')) {
      context.handle(
          _lastReviewedAtMeta,
          lastReviewedAt.isAcceptableOrUnknown(
              data['last_reviewed_at']!, _lastReviewedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Flashcard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Flashcard(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      articleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}article_id'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer'])!,
      box: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}box'])!,
      nextReview: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}next_review'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastReviewedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_reviewed_at']),
    );
  }

  @override
  $FlashcardsTable createAlias(String alias) {
    return $FlashcardsTable(attachedDatabase, alias);
  }
}

class Flashcard extends DataClass implements Insertable<Flashcard> {
  final int id;
  final int articleId;
  final String question;
  final String answer;
  final int box;
  final DateTime nextReview;
  final DateTime createdAt;
  final DateTime? lastReviewedAt;
  const Flashcard(
      {required this.id,
      required this.articleId,
      required this.question,
      required this.answer,
      required this.box,
      required this.nextReview,
      required this.createdAt,
      this.lastReviewedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['article_id'] = Variable<int>(articleId);
    map['question'] = Variable<String>(question);
    map['answer'] = Variable<String>(answer);
    map['box'] = Variable<int>(box);
    map['next_review'] = Variable<DateTime>(nextReview);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastReviewedAt != null) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt);
    }
    return map;
  }

  FlashcardsCompanion toCompanion(bool nullToAbsent) {
    return FlashcardsCompanion(
      id: Value(id),
      articleId: Value(articleId),
      question: Value(question),
      answer: Value(answer),
      box: Value(box),
      nextReview: Value(nextReview),
      createdAt: Value(createdAt),
      lastReviewedAt: lastReviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewedAt),
    );
  }

  factory Flashcard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Flashcard(
      id: serializer.fromJson<int>(json['id']),
      articleId: serializer.fromJson<int>(json['articleId']),
      question: serializer.fromJson<String>(json['question']),
      answer: serializer.fromJson<String>(json['answer']),
      box: serializer.fromJson<int>(json['box']),
      nextReview: serializer.fromJson<DateTime>(json['nextReview']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastReviewedAt: serializer.fromJson<DateTime?>(json['lastReviewedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'articleId': serializer.toJson<int>(articleId),
      'question': serializer.toJson<String>(question),
      'answer': serializer.toJson<String>(answer),
      'box': serializer.toJson<int>(box),
      'nextReview': serializer.toJson<DateTime>(nextReview),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastReviewedAt': serializer.toJson<DateTime?>(lastReviewedAt),
    };
  }

  Flashcard copyWith(
          {int? id,
          int? articleId,
          String? question,
          String? answer,
          int? box,
          DateTime? nextReview,
          DateTime? createdAt,
          Value<DateTime?> lastReviewedAt = const Value.absent()}) =>
      Flashcard(
        id: id ?? this.id,
        articleId: articleId ?? this.articleId,
        question: question ?? this.question,
        answer: answer ?? this.answer,
        box: box ?? this.box,
        nextReview: nextReview ?? this.nextReview,
        createdAt: createdAt ?? this.createdAt,
        lastReviewedAt:
            lastReviewedAt.present ? lastReviewedAt.value : this.lastReviewedAt,
      );
  Flashcard copyWithCompanion(FlashcardsCompanion data) {
    return Flashcard(
      id: data.id.present ? data.id.value : this.id,
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
      question: data.question.present ? data.question.value : this.question,
      answer: data.answer.present ? data.answer.value : this.answer,
      box: data.box.present ? data.box.value : this.box,
      nextReview:
          data.nextReview.present ? data.nextReview.value : this.nextReview,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastReviewedAt: data.lastReviewedAt.present
          ? data.lastReviewedAt.value
          : this.lastReviewedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Flashcard(')
          ..write('id: $id, ')
          ..write('articleId: $articleId, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('box: $box, ')
          ..write('nextReview: $nextReview, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastReviewedAt: $lastReviewedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, articleId, question, answer, box,
      nextReview, createdAt, lastReviewedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Flashcard &&
          other.id == this.id &&
          other.articleId == this.articleId &&
          other.question == this.question &&
          other.answer == this.answer &&
          other.box == this.box &&
          other.nextReview == this.nextReview &&
          other.createdAt == this.createdAt &&
          other.lastReviewedAt == this.lastReviewedAt);
}

class FlashcardsCompanion extends UpdateCompanion<Flashcard> {
  final Value<int> id;
  final Value<int> articleId;
  final Value<String> question;
  final Value<String> answer;
  final Value<int> box;
  final Value<DateTime> nextReview;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastReviewedAt;
  const FlashcardsCompanion({
    this.id = const Value.absent(),
    this.articleId = const Value.absent(),
    this.question = const Value.absent(),
    this.answer = const Value.absent(),
    this.box = const Value.absent(),
    this.nextReview = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
  });
  FlashcardsCompanion.insert({
    this.id = const Value.absent(),
    required int articleId,
    required String question,
    required String answer,
    this.box = const Value.absent(),
    required DateTime nextReview,
    this.createdAt = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
  })  : articleId = Value(articleId),
        question = Value(question),
        answer = Value(answer),
        nextReview = Value(nextReview);
  static Insertable<Flashcard> custom({
    Expression<int>? id,
    Expression<int>? articleId,
    Expression<String>? question,
    Expression<String>? answer,
    Expression<int>? box,
    Expression<DateTime>? nextReview,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastReviewedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (articleId != null) 'article_id': articleId,
      if (question != null) 'question': question,
      if (answer != null) 'answer': answer,
      if (box != null) 'box': box,
      if (nextReview != null) 'next_review': nextReview,
      if (createdAt != null) 'created_at': createdAt,
      if (lastReviewedAt != null) 'last_reviewed_at': lastReviewedAt,
    });
  }

  FlashcardsCompanion copyWith(
      {Value<int>? id,
      Value<int>? articleId,
      Value<String>? question,
      Value<String>? answer,
      Value<int>? box,
      Value<DateTime>? nextReview,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastReviewedAt}) {
    return FlashcardsCompanion(
      id: id ?? this.id,
      articleId: articleId ?? this.articleId,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      box: box ?? this.box,
      nextReview: nextReview ?? this.nextReview,
      createdAt: createdAt ?? this.createdAt,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (articleId.present) {
      map['article_id'] = Variable<int>(articleId.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (box.present) {
      map['box'] = Variable<int>(box.value);
    }
    if (nextReview.present) {
      map['next_review'] = Variable<DateTime>(nextReview.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastReviewedAt.present) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardsCompanion(')
          ..write('id: $id, ')
          ..write('articleId: $articleId, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('box: $box, ')
          ..write('nextReview: $nextReview, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastReviewedAt: $lastReviewedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ArticlesTable articles = $ArticlesTable(this);
  late final $FlashcardsTable flashcards = $FlashcardsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [articles, flashcards];
}

typedef $$ArticlesTableCreateCompanionBuilder = ArticlesCompanion Function({
  Value<int> id,
  required String pubmedId,
  required String title,
  required String authors,
  Value<String?> abstract,
  required String journal,
  required String publicationDate,
  Value<String?> doi,
  Value<String?> pdfPath,
  Value<DateTime> savedAt,
});
typedef $$ArticlesTableUpdateCompanionBuilder = ArticlesCompanion Function({
  Value<int> id,
  Value<String> pubmedId,
  Value<String> title,
  Value<String> authors,
  Value<String?> abstract,
  Value<String> journal,
  Value<String> publicationDate,
  Value<String?> doi,
  Value<String?> pdfPath,
  Value<DateTime> savedAt,
});

final class $$ArticlesTableReferences
    extends BaseReferences<_$AppDatabase, $ArticlesTable, Article> {
  $$ArticlesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FlashcardsTable, List<Flashcard>>
      _flashcardsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.flashcards,
          aliasName:
              $_aliasNameGenerator(db.articles.id, db.flashcards.articleId));

  $$FlashcardsTableProcessedTableManager get flashcardsRefs {
    final manager = $$FlashcardsTableTableManager($_db, $_db.flashcards)
        .filter((f) => f.articleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_flashcardsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ArticlesTableFilterComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubmedId => $composableBuilder(
      column: $table.pubmedId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get authors => $composableBuilder(
      column: $table.authors, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get abstract => $composableBuilder(
      column: $table.abstract, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get journal => $composableBuilder(
      column: $table.journal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get publicationDate => $composableBuilder(
      column: $table.publicationDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get doi => $composableBuilder(
      column: $table.doi, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pdfPath => $composableBuilder(
      column: $table.pdfPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get savedAt => $composableBuilder(
      column: $table.savedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> flashcardsRefs(
      Expression<bool> Function($$FlashcardsTableFilterComposer f) f) {
    final $$FlashcardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.flashcards,
        getReferencedColumn: (t) => t.articleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FlashcardsTableFilterComposer(
              $db: $db,
              $table: $db.flashcards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ArticlesTableOrderingComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubmedId => $composableBuilder(
      column: $table.pubmedId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get authors => $composableBuilder(
      column: $table.authors, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get abstract => $composableBuilder(
      column: $table.abstract, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get journal => $composableBuilder(
      column: $table.journal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get publicationDate => $composableBuilder(
      column: $table.publicationDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get doi => $composableBuilder(
      column: $table.doi, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pdfPath => $composableBuilder(
      column: $table.pdfPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get savedAt => $composableBuilder(
      column: $table.savedAt, builder: (column) => ColumnOrderings(column));
}

class $$ArticlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pubmedId =>
      $composableBuilder(column: $table.pubmedId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get authors =>
      $composableBuilder(column: $table.authors, builder: (column) => column);

  GeneratedColumn<String> get abstract =>
      $composableBuilder(column: $table.abstract, builder: (column) => column);

  GeneratedColumn<String> get journal =>
      $composableBuilder(column: $table.journal, builder: (column) => column);

  GeneratedColumn<String> get publicationDate => $composableBuilder(
      column: $table.publicationDate, builder: (column) => column);

  GeneratedColumn<String> get doi =>
      $composableBuilder(column: $table.doi, builder: (column) => column);

  GeneratedColumn<String> get pdfPath =>
      $composableBuilder(column: $table.pdfPath, builder: (column) => column);

  GeneratedColumn<DateTime> get savedAt =>
      $composableBuilder(column: $table.savedAt, builder: (column) => column);

  Expression<T> flashcardsRefs<T extends Object>(
      Expression<T> Function($$FlashcardsTableAnnotationComposer a) f) {
    final $$FlashcardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.flashcards,
        getReferencedColumn: (t) => t.articleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FlashcardsTableAnnotationComposer(
              $db: $db,
              $table: $db.flashcards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ArticlesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ArticlesTable,
    Article,
    $$ArticlesTableFilterComposer,
    $$ArticlesTableOrderingComposer,
    $$ArticlesTableAnnotationComposer,
    $$ArticlesTableCreateCompanionBuilder,
    $$ArticlesTableUpdateCompanionBuilder,
    (Article, $$ArticlesTableReferences),
    Article,
    PrefetchHooks Function({bool flashcardsRefs})> {
  $$ArticlesTableTableManager(_$AppDatabase db, $ArticlesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArticlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> pubmedId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> authors = const Value.absent(),
            Value<String?> abstract = const Value.absent(),
            Value<String> journal = const Value.absent(),
            Value<String> publicationDate = const Value.absent(),
            Value<String?> doi = const Value.absent(),
            Value<String?> pdfPath = const Value.absent(),
            Value<DateTime> savedAt = const Value.absent(),
          }) =>
              ArticlesCompanion(
            id: id,
            pubmedId: pubmedId,
            title: title,
            authors: authors,
            abstract: abstract,
            journal: journal,
            publicationDate: publicationDate,
            doi: doi,
            pdfPath: pdfPath,
            savedAt: savedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String pubmedId,
            required String title,
            required String authors,
            Value<String?> abstract = const Value.absent(),
            required String journal,
            required String publicationDate,
            Value<String?> doi = const Value.absent(),
            Value<String?> pdfPath = const Value.absent(),
            Value<DateTime> savedAt = const Value.absent(),
          }) =>
              ArticlesCompanion.insert(
            id: id,
            pubmedId: pubmedId,
            title: title,
            authors: authors,
            abstract: abstract,
            journal: journal,
            publicationDate: publicationDate,
            doi: doi,
            pdfPath: pdfPath,
            savedAt: savedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ArticlesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({flashcardsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (flashcardsRefs) db.flashcards],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (flashcardsRefs)
                    await $_getPrefetchedData<Article, $ArticlesTable,
                            Flashcard>(
                        currentTable: table,
                        referencedTable:
                            $$ArticlesTableReferences._flashcardsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ArticlesTableReferences(db, table, p0)
                                .flashcardsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.articleId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ArticlesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ArticlesTable,
    Article,
    $$ArticlesTableFilterComposer,
    $$ArticlesTableOrderingComposer,
    $$ArticlesTableAnnotationComposer,
    $$ArticlesTableCreateCompanionBuilder,
    $$ArticlesTableUpdateCompanionBuilder,
    (Article, $$ArticlesTableReferences),
    Article,
    PrefetchHooks Function({bool flashcardsRefs})>;
typedef $$FlashcardsTableCreateCompanionBuilder = FlashcardsCompanion Function({
  Value<int> id,
  required int articleId,
  required String question,
  required String answer,
  Value<int> box,
  required DateTime nextReview,
  Value<DateTime> createdAt,
  Value<DateTime?> lastReviewedAt,
});
typedef $$FlashcardsTableUpdateCompanionBuilder = FlashcardsCompanion Function({
  Value<int> id,
  Value<int> articleId,
  Value<String> question,
  Value<String> answer,
  Value<int> box,
  Value<DateTime> nextReview,
  Value<DateTime> createdAt,
  Value<DateTime?> lastReviewedAt,
});

final class $$FlashcardsTableReferences
    extends BaseReferences<_$AppDatabase, $FlashcardsTable, Flashcard> {
  $$FlashcardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ArticlesTable _articleIdTable(_$AppDatabase db) =>
      db.articles.createAlias(
          $_aliasNameGenerator(db.flashcards.articleId, db.articles.id));

  $$ArticlesTableProcessedTableManager get articleId {
    final $_column = $_itemColumn<int>('article_id')!;

    final manager = $$ArticlesTableTableManager($_db, $_db.articles)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_articleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$FlashcardsTableFilterComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get answer => $composableBuilder(
      column: $table.answer, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get box => $composableBuilder(
      column: $table.box, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextReview => $composableBuilder(
      column: $table.nextReview, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastReviewedAt => $composableBuilder(
      column: $table.lastReviewedAt,
      builder: (column) => ColumnFilters(column));

  $$ArticlesTableFilterComposer get articleId {
    final $$ArticlesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableFilterComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FlashcardsTableOrderingComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get answer => $composableBuilder(
      column: $table.answer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get box => $composableBuilder(
      column: $table.box, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextReview => $composableBuilder(
      column: $table.nextReview, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastReviewedAt => $composableBuilder(
      column: $table.lastReviewedAt,
      builder: (column) => ColumnOrderings(column));

  $$ArticlesTableOrderingComposer get articleId {
    final $$ArticlesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableOrderingComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FlashcardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<String> get answer =>
      $composableBuilder(column: $table.answer, builder: (column) => column);

  GeneratedColumn<int> get box =>
      $composableBuilder(column: $table.box, builder: (column) => column);

  GeneratedColumn<DateTime> get nextReview => $composableBuilder(
      column: $table.nextReview, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReviewedAt => $composableBuilder(
      column: $table.lastReviewedAt, builder: (column) => column);

  $$ArticlesTableAnnotationComposer get articleId {
    final $$ArticlesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableAnnotationComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FlashcardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FlashcardsTable,
    Flashcard,
    $$FlashcardsTableFilterComposer,
    $$FlashcardsTableOrderingComposer,
    $$FlashcardsTableAnnotationComposer,
    $$FlashcardsTableCreateCompanionBuilder,
    $$FlashcardsTableUpdateCompanionBuilder,
    (Flashcard, $$FlashcardsTableReferences),
    Flashcard,
    PrefetchHooks Function({bool articleId})> {
  $$FlashcardsTableTableManager(_$AppDatabase db, $FlashcardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FlashcardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FlashcardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FlashcardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> articleId = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<String> answer = const Value.absent(),
            Value<int> box = const Value.absent(),
            Value<DateTime> nextReview = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastReviewedAt = const Value.absent(),
          }) =>
              FlashcardsCompanion(
            id: id,
            articleId: articleId,
            question: question,
            answer: answer,
            box: box,
            nextReview: nextReview,
            createdAt: createdAt,
            lastReviewedAt: lastReviewedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int articleId,
            required String question,
            required String answer,
            Value<int> box = const Value.absent(),
            required DateTime nextReview,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastReviewedAt = const Value.absent(),
          }) =>
              FlashcardsCompanion.insert(
            id: id,
            articleId: articleId,
            question: question,
            answer: answer,
            box: box,
            nextReview: nextReview,
            createdAt: createdAt,
            lastReviewedAt: lastReviewedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FlashcardsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({articleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (articleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.articleId,
                    referencedTable:
                        $$FlashcardsTableReferences._articleIdTable(db),
                    referencedColumn:
                        $$FlashcardsTableReferences._articleIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$FlashcardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FlashcardsTable,
    Flashcard,
    $$FlashcardsTableFilterComposer,
    $$FlashcardsTableOrderingComposer,
    $$FlashcardsTableAnnotationComposer,
    $$FlashcardsTableCreateCompanionBuilder,
    $$FlashcardsTableUpdateCompanionBuilder,
    (Flashcard, $$FlashcardsTableReferences),
    Flashcard,
    PrefetchHooks Function({bool articleId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ArticlesTableTableManager get articles =>
      $$ArticlesTableTableManager(_db, _db.articles);
  $$FlashcardsTableTableManager get flashcards =>
      $$FlashcardsTableTableManager(_db, _db.flashcards);
}
