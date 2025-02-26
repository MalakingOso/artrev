# Create Project Structure for ArtRev
# Run this script from the lib folder

# Create directories
$directories = @(
    ".",
    "core/constants",
    "core/exceptions",
    "core/extensions",
    "core/services",
    "core/utils",
    "data/datasources/local",
    "data/datasources/remote",
    "data/models",
    "data/repositories",
    "domain/entities",
    "domain/usecases",
    "presentation/providers",
    "presentation/screens",
    "presentation/viewmodels",
    "presentation/widgets"
)

foreach ($dir in $directories) {
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "Created directory: $dir"
    }
}

# Create files and their content
$files = @{
    "main.dart"                                       = @'
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:artrev/core/constants/app_theme.dart';
import 'package:artrev/presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: ArtRevApp()));
}

class ArtRevApp extends StatelessWidget {
  const ArtRevApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArtRev',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
'@

    "core/constants/app_colors.dart"                  = @'
import 'package:flutter/material.dart';

class AppColors {
  // Main colors
  static const Color background = Color.fromRGBO(236, 232, 219, 1);
  static const Color primary = Color.fromRGBO(50, 32, 113, 1);
  
  // Derived/complementary colors
  static const Color secondary = Color.fromRGBO(69, 123, 157, 1);
  static const Color accent = Color.fromRGBO(168, 132, 36, 1);
  static const Color text = Color.fromRGBO(33, 33, 33, 1);
  static const Color textLight = Color.fromRGBO(117, 117, 117, 1);
  static const Color surface = Color.fromRGBO(252, 250, 242, 1);
  static const Color divider = Color.fromRGBO(189, 189, 189, 0.2);
}
'@

    "core/constants/app_theme.dart"                   = @'
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.background,
        surface: AppColors.surface,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.text,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.text,
        ),
        bodyLarge: GoogleFonts.roboto(
          fontSize: 16,
          color: AppColors.text,
        ),
        bodyMedium: GoogleFonts.roboto(
          fontSize: 14,
          color: AppColors.text,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.text,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: AppColors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
'@

    "data/datasources/local/database.dart"            = @'
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
'@

    "core/services/pubmed_service.dart"               = @'
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:artrev/data/models/article.dart';

part 'pubmed_service.g.dart';

class PubmedService {
  final String baseUrl = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils';
  final String apiKey = ''; // You can add your API key here if you have one

  // ESearch - Search for articles matching a query
  Future<Map<String, dynamic>> searchArticles({
    required String query,
    int retMax = 20,
    int retStart = 0,
  }) async {
    final url = Uri.parse('$baseUrl/esearch.fcgi?db=pubmed&term=$query'
        '&retmax=$retMax&retstart=$retStart&retmode=json'
        '${apiKey.isNotEmpty ? '&api_key=$apiKey' : ''}');
    
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to search articles: ${response.statusCode}');
    }
  }

  // EFetch - Fetch article details by PubMed IDs
  Future<String> fetchArticleDetails(List<String> pmids) async {
    final pmidString = pmids.join(',');
    final url = Uri.parse('$baseUrl/efetch.fcgi?db=pubmed&id=$pmidString'
        '&retmode=xml'
        '${apiKey.isNotEmpty ? '&api_key=$apiKey' : ''}');
    
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch article details: ${response.statusCode}');
    }
  }

  // Parse XML response to get article details
  List<Article> parseArticles(String xmlString) {
    // This is a simplified parser. In a real app, use xml library for proper parsing
    final List<Article> articles = [];
    
    // Basic XML parsing to extract article information
    // In a complete implementation, use a proper XML parser
    final idRegex = RegExp(r'<PMID.*?>(\d+)</PMID>');
    final titleRegex = RegExp(r'<ArticleTitle>(.*?)</ArticleTitle>', dotAll: true);
    final abstractRegex = RegExp(r'<AbstractText.*?>(.*?)</AbstractText>', dotAll: true);
    
    // Extract PMIDs
    final idMatches = idRegex.allMatches(xmlString);
    final titleMatches = titleRegex.allMatches(xmlString);
    final abstractMatches = abstractRegex.allMatches(xmlString);
    
    for (int i = 0; i < idMatches.length; i++) {
      if (i < titleMatches.length) {
        final article = Article(
          pubmedId: idMatches.elementAt(i).group(1) ?? '',
          title: titleMatches.elementAt(i).group(1) ?? '',
          abstract: i < abstractMatches.length 
              ? abstractMatches.elementAt(i).group(1) ?? ''
              : '',
          authors: '', // Need more complex parsing for authors
          journal: '', // Need more complex parsing for journal
          publicationDate: '', // Need more complex parsing for date
          doi: '', // Need more complex parsing for DOI
        );
        
        articles.add(article);
      }
    }
    
    return articles;
  }
}

@riverpod
PubmedService pubmedService(PubmedServiceRef ref) {
  return PubmedService();
}
'@

    "data/models/article.dart"                        = @'
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
'@

    "data/repositories/article_repository.dart"       = @'
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
'@

    "presentation/viewmodels/article_viewmodel.dart"  = @'
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
'@

    "presentation/screens/home_screen.dart"           = @'
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:artrev/core/constants/app_colors.dart';
import 'package:artrev/presentation/screens/search_screen.dart';
import 'package:artrev/presentation/screens/saved_articles_screen.dart';
import 'package:artrev/presentation/screens/flashcards_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    const SearchScreen(),
    const SavedArticlesScreen(),
    const FlashcardsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'ArtRev',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ArtRev',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your urogynecology literature companion',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search Literature'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Saved Articles'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.flash_on),
              title: const Text('Flashcards'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Show about dialog
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
'@

    "presentation/screens/search_screen.dart"         = @'
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:artrev/core/constants/app_colors.dart';
import 'package:artrev/data/models/article.dart';
import 'package:artrev/presentation/viewmodels/article_viewmodel.dart';
import 'package:artrev/presentation/widgets/article_card.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      setState(() {
        _isSearching = true;
      });
      ref.read(articleSearchStateProvider.notifier).searchArticles(query).then((_) {
        setState(() {
          _isSearching = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final articlesState = ref.watch(articleSearchStateProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search Urogynecology Literature',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Enter search terms...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onSubmitted: (_) => _performSearch(),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _isSearching ? null : _performSearch,
                child: _isSearching
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text('Search'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: articlesState.when(
              data: (articles) {
                if (articles.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchController.text.isEmpty
                              ? 'Enter search terms to find articles'
                              : 'No results found',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.grey.shade600,
                              ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ArticleCard(
                        article: articles[index],
                        onSave: () {
                          ref
                              .read(articleSearchStateProvider.notifier)
                              .saveArticle(articles[index]);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Article saved successfully'),
                              backgroundColor: AppColors.primary,
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Text(
                  'Error: ${error.toString()}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
'@

    "presentation/screens/saved_articles_screen.dart" = @'
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:artrev/presentation/viewmodels/article_viewmodel.dart';
import 'package:artrev/presentation/widgets/article_card.dart';

class SavedArticlesScreen extends ConsumerWidget {
  const SavedArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedArticlesState = ref.watch(savedArticlesStateProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saved Articles',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: savedArticlesState.when(
              data: (articles) {
                if (articles.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_border,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No saved articles yet',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.grey.shade600,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Search and save articles to access them here',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey.shade500,
                              ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ArticleCard(
                        article: articles[index],
                        onSave: () {
                          // Already saved, could implement remove functionality here
                        },
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Text(
                  'Error: ${error.toString()}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
'@

    "presentation/screens/flashcards_screen.dart"     = @'
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:artrev/core/constants/app_colors.dart';

class FlashcardsScreen extends ConsumerWidget {
  const FlashcardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Flashcards',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.flash_on,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No flashcards created yet',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Import PDFs to generate flashcards for study',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade500,
                        ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Import PDF'),
                    onPressed: () {
                      // Show PDF import dialog
                      _showImportDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void _showImportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Import PDF'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Drag and drop a PDF file to generate flashcards.'),
            SizedBox(height: 16),
            Center(
              child: Icon(
                Icons.cloud_upload,
                size: 48,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'After importing, our AI will analyze the PDF and generate relevant flashcards for your study.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle PDF import logic
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('PDF import functionality coming soon'),
                ),
              );
            },
            child: const Text('Browse Files'),
          ),
        ],
      ),
    );
  }
}
'@

    "presentation/screens/article_detail_screen.dart" = @'
import 'package:flutter/material.dart';
import 'package:artrev/core/constants/app_colors.dart';
import 'package:artrev/data/models/article.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            tooltip: 'Save article',
            onPressed: () {
              // Save article functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Article saved'),
                  backgroundColor: AppColors.primary,
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            tooltip: 'Import PDF',
            onPressed: () {
              // Import PDF functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('PDF import coming soon'),
                  backgroundColor: AppColors.primary,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              article.authors,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${article.journal} · ${article.publicationDate}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            if (article.doi.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                'DOI: ${article.doi}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
            const SizedBox(height: 24),
            const Text(
              'Abstract',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              article.abstract.isEmpty ? 'No abstract available' : article.abstract,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            const Text(
              'Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  context,
                  Icons.upload_file,
                  'Import PDF',
                  () {
                    // Import PDF functionality
                  },
                ),
                _buildActionButton(
                  context,
                  Icons.flash_on,
                  'Generate Flashcards',
                  () {
                    // Generate flashcards functionality
                  },
                ),
                _buildActionButton(
                  context,
                  Icons.open_in_new,
                  'View on PubMed',
                  () {
                    // Open in PubMed functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
          ),
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
'@

    "presentation/widgets/article_card.dart"          = @'
import 'package:flutter/material.dart';
import 'package:artrev/core/constants/app_colors.dart';
import 'package:artrev/data/models/article.dart';
import 'package:artrev/presentation/screens/article_detail_screen.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final VoidCallback onSave;

  const ArticleCard({
    Key? key,
    required this.article,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailScreen(article: article),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      article.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: AppColors.primary,
                    ),
                    onPressed: onSave,
                    tooltip: 'Save article',
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(8),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                article.authors,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${article.journal} · ${article.publicationDate}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              if (article.abstract.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  article.abstract.length > 200
                      ? '${article.abstract.substring(0, 200)}...'
                      : article.abstract,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.description, size: 16),
                    label: const Text('View Details'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailScreen(article: article),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
'@
}

# Create files
foreach ($file in $files.Keys) {
    $content = $files[$file]
    $filePath = $file
    
    if (!(Test-Path $filePath)) {
        New-Item -ItemType File -Path $filePath -Force | Out-Null
        Set-Content -Path $filePath -Value $content
        Write-Host "Created file: $filePath" -ForegroundColor Green
    }
}

Write-Host "`nProject structure created successfully!" -ForegroundColor Cyan
Write-Host "`nNext steps:" -ForegroundColor Yellow
Write-Host "1. Run 'dart run build_runner build --delete-conflicting-outputs' to generate necessary code files" -ForegroundColor Yellow
Write-Host "2. Run 'flutter run -d windows' to test your app" -ForegroundColor Yellow