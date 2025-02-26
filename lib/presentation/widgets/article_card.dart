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
