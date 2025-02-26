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
