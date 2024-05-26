import 'package:flutter/material.dart';

class ResultItem extends StatefulWidget {
  final List<Map<String, String>> passers;

  const ResultItem({
    Key? key,
    required this.passers,
  }) : super(key: key);

  @override
  State<ResultItem> createState() => _ResultItemState();
}

class _ResultItemState extends State<ResultItem> {
  late List<Map<String, String>> filteredPassers;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize filteredPassers with all passers
    filteredPassers = widget.passers;
  }

  void filterPassers(String query) {
    // Update the filteredPassers based on the search query
    if (query.isEmpty) {
      setState(() {
        filteredPassers = widget.passers;
      });
    } else {
      setState(() {
        filteredPassers = widget.passers
            .where((passer) =>
                passer['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam interdum quis quis a integer. Quisque at tristique est vestibulum tincidunt arcu feugiat vel. ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: searchController,
            onChanged: (String value) {
              filterPassers(value);
            },
            decoration: InputDecoration(
              labelText: 'Search Applicant Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color(0xFFFFC909),
              border: Border.all(
                color: const Color(0xFFFFC909),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              'List of Passers',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: filteredPassers.isNotEmpty
                  ? filteredPassers.first.keys
                      .map(
                        (key) => DataColumn(
                          label: Text(
                            key,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                      .toList()
                  : <DataColumn>[],
              rows: filteredPassers
                  .map(
                    (passer) => DataRow(
                      cells: passer.entries
                          .map(
                            (entry) => DataCell(
                              SizedBox(
                                width: double
                                    .infinity, // Adjust the width as necessary.
                                child: Text(
                                  entry.value,
                                  style: const TextStyle(fontSize: 12.0),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
