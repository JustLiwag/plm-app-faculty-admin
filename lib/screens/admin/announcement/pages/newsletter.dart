import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:mysample/widgets/admin/box_with_header_image.dart';
import 'package:mysample/widgets/admin/box_without_header_image.dart';
import 'package:mysample/widgets/admin/edit_article_dialog.dart';

class NewsLetterScreen extends StatelessWidget {
  const NewsLetterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Announcements'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 15),
          Text(
            'Newsletter',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: AppTheme.baseGold),
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
          const BoxWithHeaderImage(
              title: 'Statement on red-tagging of PLM',
              description:
                  'The Pamantasan ng Lungsod ng Maynila (PLM) was once again the unscrupulous allegations made by a high official of the military...'),
          const SizedBox(height: 20),
          const BoxWithoutHeaderImage(
              title: '2021 New Year Message from the University President',
              description:
                  'No one had a 2020 vision of what this year that is about to end would bring. Our experiences have been difficult but we have a lot...'),
          const SizedBox(height: 20),
          const BoxWithoutHeaderImage(
              title: 'Preparations against COVID-19 Pandemic',
              description:
                  'Dear PLM Community, The COVID-19 pandemic has brought difficult times for everybody...'),
          const SizedBox(height: 200),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showEditArticleDialog(context);
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
        backgroundColor: const Color(0xFFFFC909),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
