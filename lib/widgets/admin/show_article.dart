import 'package:flutter/material.dart';
import 'package:mysample/models/admin/article_model.dart';

class ShowArticleScreen extends StatelessWidget {
  final Article article;

  const ShowArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPresidentMessage(),
          const SizedBox(height: 20),
          _buildHeaderImage(),
          const SizedBox(height: 20),
          _buildStatement1(),
          const SizedBox(height: 20),
          _buildDescription(),
          const SizedBox(height: 20),
          _buildPresidentDetails(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showEditArticleDialog(context);
        },
        label: const Text('Edit Article'),
        backgroundColor: const Color(0xFFFFC909),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        icon: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildPresidentMessage() {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Text(
        article.title,
        style: const TextStyle(
          color: Color(0xFFFFC909),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: Image.asset(
          article.imagePath!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildStatement1() {
    return Text(
      article.statement,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(223, 60, 61, 61),
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      article.description,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 16,
        color: Color.fromARGB(224, 99, 102, 105),
      ),
    );
  }

  Widget _buildPresidentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
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
    );
  }

  void _showEditArticleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Edit Article',
              style: TextStyle(
                color: Color(0xFFFFC909),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Article Title',
                        hintStyle: const TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add functionality for attaching new photo
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: Color.fromARGB(255, 222, 222, 222)),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(5),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.attach_file, color: Color.fromARGB(255, 91, 91, 91)),
                              SizedBox(height: 5),
                              Text(
                                'Attach New Photo',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 91, 91, 91),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Content',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(
                    height: 270,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Article Content',
                        hintStyle: const TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      maxLines: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: SizedBox(
                    height: 30.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 222, 222, 222)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      child: const OverflowBox(
                        minHeight: 0.0,
                        minWidth: 0.0,
                        maxHeight: double.infinity,
                        maxWidth: double.infinity,
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Color.fromARGB(255, 50, 49, 49)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Flexible(
                  child: SizedBox(
                    height: 30.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for Delete button
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red[900]),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      child: const OverflowBox(
                        minHeight: 0.0,
                        minWidth: 0.0,
                        maxHeight: double.infinity,
                        maxWidth: double.infinity,
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Flexible(
                  child: SizedBox(
                    height: 30.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for Save button
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xFFFFC909)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      child: const OverflowBox(
                        minHeight: 0.0,
                        minWidth: 0.0,
                        maxHeight: double.infinity,
                        maxWidth: double.infinity,
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
