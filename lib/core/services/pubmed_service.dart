import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:artrev/data/models/article.dart';
import 'package:xml/xml.dart';

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
    final List<Article> articles = [];
    final document = XmlDocument.parse(xmlString);
    
    // Find all PubmedArticle elements
    final articleElements = document.findAllElements('PubmedArticle');
    
    for (final articleElement in articleElements) {
      // Extract PMID
      final pmidElement = articleElement.findAllElements('PMID').firstOrNull;
      final pubmedId = pmidElement?.innerText ?? '';
      
      // Extract article title
      final titleElement = articleElement.findAllElements('ArticleTitle').firstOrNull;
      final title = titleElement?.innerText ?? '';
      
      // Extract abstract text
      final abstractElements = articleElement.findAllElements('AbstractText');
      final abstract = abstractElements.map((e) => e.innerText).join(' ');
      
      // Extract authors
      final authorElements = articleElement.findAllElements('Author');
      final authorNames = authorElements.map((author) {
        final lastName = author.findElements('LastName').firstOrNull?.innerText ?? '';
        final firstName = author.findElements('ForeName').firstOrNull?.innerText ?? '';
        return '$lastName $firstName'.trim();
      }).join(', ');
      
      // Extract journal information
      final journalElement = articleElement.findAllElements('Journal').firstOrNull;
      final journal = journalElement?.findElements('Title').firstOrNull?.innerText ?? '';
      
      // Extract publication date
      final pubDateElement = articleElement.findAllElements('PubDate').firstOrNull;
      final year = pubDateElement?.findElements('Year').firstOrNull?.innerText ?? '';
      final month = pubDateElement?.findElements('Month').firstOrNull?.innerText ?? '';
      final publicationDate = '$month $year'.trim();
      
      // Extract DOI
      final articleIdElements = articleElement.findAllElements('ArticleId');
      String doi = '';
      for (final idElement in articleIdElements) {
        if (idElement.getAttribute('IdType') == 'doi') {
          doi = idElement.innerText;
          break;
        }
      }
      
      final article = Article(
        pubmedId: pubmedId,
        title: title,
        abstract: abstract,
        authors: authorNames,
        journal: journal,
        publicationDate: publicationDate,
        doi: doi,
      );
      
      articles.add(article);
    }
    
    return articles;
  }
}


@riverpod
PubmedService pubmedService(Ref ref) {
  return PubmedService();
}
