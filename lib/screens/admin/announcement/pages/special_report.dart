import 'package:flutter/material.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import 'package:mysample/widgets/admin/box_with_header_image.dart';
import 'package:mysample/widgets/admin/box_without_header_image.dart';
import 'package:mysample/widgets/admin/new_article_dialog.dart';
import 'package:mysample/data/admin/article_data.dart';
import 'package:mysample/widgets/admin/show_article.dart';

class SpeciaReportScreen extends StatelessWidget {
  const SpeciaReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Announcements'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 15),
          Text(
            'Special Reports',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: const Color(0XFF006699)),
          ),
          const SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\nEget nunc scelerisque viverra mauris in aliquam sem fringilla. Nunc id cursus metus aliquam. ',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppTheme.baseBlack),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: announcements.length,
            itemBuilder: (context, index) {
              final article = announcements[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowArticleScreen(article: article),
                    ),
                  );
                },
                child: Column(
                  children: [
                    article.imagePath != null
                        ? BoxWithHeaderImage(
                            title: article.title,
                            description: article.description,
                            onReadMore: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ShowArticleScreen(article: article),
                                ),
                              );
                            },
                          )
                        : BoxWithoutHeaderImage(
                            title: article.title,
                            description: article.description,
                            onReadMore: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ShowArticleScreen(article: article),
                                ),
                              );
                            },
                          ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 200),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showNewArticleDialog(context);
        },
        label: const Row(
          children: [
            Text(
              'New Article',
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
