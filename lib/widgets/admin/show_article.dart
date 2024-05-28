import 'package:flutter/material.dart';
import 'package:mysample/models/admin/article_model.dart';

class ShowArticleScreen extends StatelessWidget {
  final Article article;

  const ShowArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                article.imagePath!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              article.statement,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(223, 60, 61, 61),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              article.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(224, 99, 102, 105),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              article.presidentName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              article.presidentTitle,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 1),
            Text(article.date),
          ],
        ),
      ),
    );
  }
}
