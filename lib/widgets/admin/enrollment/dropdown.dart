import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final Function(String?) onCollegeSelected;
  final List<String> colleges;
  final String title;

  const Dropdown(
      {super.key,
      required this.onCollegeSelected,
      required this.colleges,
      required this.title});

  @override
  CollegeDropdownState createState() => CollegeDropdownState();
}

class CollegeDropdownState extends State<Dropdown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromRGBO(0, 102, 153, 100), width: 3.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            dropdownColor: Colors.white,
            isExpanded: true,
            value: dropdownValue,
            hint: const Center(child: Text("Select College")),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue;
              });
              widget.onCollegeSelected(newValue);
            },
            underline: Container(),
            items:
                widget.colleges.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
