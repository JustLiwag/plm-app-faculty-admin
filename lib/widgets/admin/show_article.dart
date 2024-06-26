import 'package:flutter/material.dart';
import 'package:mysample/models/admin/article_model.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import 'package:mysample/widgets/admin/edit_article_dialog.dart';

class ShowArticleScreen extends StatelessWidget {
  final Article article;

  const ShowArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Announcements'),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: article.imagePath != null 
                          ? Image.asset(
                              article.imagePath!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200,
                            )
                          : const SizedBox(height: 200, child: Placeholder()),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        article.title,
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
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showEditArticleDialog(context, article);
        },
        label: const Row(
          children: [
            Text(
              'Edit Article',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(width: 5, height: 5),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ],
        ),
        backgroundColor: const Color(0XFF006699),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
