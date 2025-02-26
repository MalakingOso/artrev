class Article {
  final String pubmedId;
  final String title;
  final String authors;
  final String abstract;
  final String journal;
  final String publicationDate;
  final String doi;
  final String? pdfPath;

  Article({
    required this.pubmedId,
    required this.title,
    required this.authors,
    required this.abstract,
    required this.journal,
    required this.publicationDate,
    required this.doi,
    this.pdfPath,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      pubmedId: json['pubmedId'] as String,
      title: json['title'] as String,
      authors: json['authors'] as String,
      abstract: json['abstract'] as String,
      journal: json['journal'] as String,
      publicationDate: json['publicationDate'] as String,
      doi: json['doi'] as String,
      pdfPath: json['pdfPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pubmedId': pubmedId,
      'title': title,
      'authors': authors,
      'abstract': abstract,
      'journal': journal,
      'publicationDate': publicationDate,
      'doi': doi,
      'pdfPath': pdfPath,
    };
  }
}
