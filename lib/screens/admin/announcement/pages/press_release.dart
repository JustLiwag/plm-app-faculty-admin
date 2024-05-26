import 'package:flutter/material.dart';

class PressReleaseScreen extends StatelessWidget {
  const PressReleaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPresidentMessage(),
          const SizedBox(height: 20),
          _buildMessageContent(),
          const SizedBox(height: 20),
          _buildBoxWithHeaderImage(title: 'Statement on red-tagging of PLM', description: 'The Pamantasan ng Lungsod ng Maynila (PLM) was once again the unscrupulous allegations made by a high official of the military...'),
          const SizedBox(height: 20),
          _buildBoxWithoutHeaderImage(title: '2021 New Year Message from the University President', description: 'No one had a 2020 vision of what this year that is about to end would bring. Our experiences have been difficult but we have a lot...'),
          const SizedBox(height: 20),
          _buildBoxWithoutHeaderImage(title: 'Preparations against COVID-19 Pandemic', description: 'Dear PLM Community, The COVID-19 pandemic has brought difficult times for everybody...'),
          const SizedBox(height: 200),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
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

  Widget _buildPresidentMessage() {
    return const Text(
      'Press Releases',
      style: TextStyle(
        color: Color(0xFFFFC909),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildMessageContent() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam interdum quis quis a integer. Quisque at tristique est vestibulum tincidunt arcu feugiat vel.',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 10),
        Text(
          'Dictum ut tincidunt quam quis eros turpis. Eu volutpat tincidunt sed sapien ipsum commodo nullam amet, vivamus.',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildBoxWithHeaderImage({required String title, required String description}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/plm.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(223, 60, 61, 61),
                  ),
                ),
                const SizedBox(height: 8), // Add space here
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(224, 99, 102, 105),
                  ),
                ),
                const SizedBox(height: 1),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle Read More button tap
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFFC909)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                        ),
                      ),
                    ),
                    child: const Text(
                      'Read More',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxWithoutHeaderImage({required String title, required String description}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(223, 60, 61, 61),
                  ),
                ),
                const SizedBox(height: 8), // Add space here
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(224, 99, 102, 105),
                  ),
                ),
                const SizedBox(height: 1),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle Read More button tap
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFFC909)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                        ),
                      ),
                    ),
                    child: const Text(
                      'Read More',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
