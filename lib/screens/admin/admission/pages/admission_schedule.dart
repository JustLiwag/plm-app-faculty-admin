import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class AdmissionScheduleScreen extends StatefulWidget {
  const AdmissionScheduleScreen({Key? key}) : super(key: key);

  @override
  AdmissionScheduleScreenState createState() => AdmissionScheduleScreenState();
}

class AdmissionScheduleScreenState extends State<AdmissionScheduleScreen> {
  DateTime plmatStartDate = DateTime(2023, 12, 1);
  DateTime plmatEndDate = DateTime(2024, 3, 31);

  DateTime clatStartDate = DateTime(2024, 12, 2);
  DateTime clatEndDate = DateTime(2024, 4, 1);

  DateTime mcatStartDate = DateTime(2024, 12, 3);
  DateTime mcatEndDate = DateTime(2024, 4, 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Admissions'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 15),
            Text(
              'Schedule',
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
            _buildTestSchedule(
              context,
              'PLMAT',
              plmatStartDate,
              plmatEndDate,
              (DateTime startDate, DateTime endDate) {
                setState(() {
                  plmatStartDate = startDate;
                  plmatEndDate = endDate;
                });
              },
            ),
            _buildTestSchedule(
              context,
              'CLAT',
              clatStartDate,
              clatEndDate,
              (DateTime startDate, DateTime endDate) {
                setState(() {
                  clatStartDate = startDate;
                  clatEndDate = endDate;
                });
              },
            ),
            _buildTestSchedule(
              context,
              'MCAT',
              mcatStartDate,
              mcatEndDate,
              (DateTime startDate, DateTime endDate) {
                setState(() {
                  mcatStartDate = startDate;
                  mcatEndDate = endDate;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestSchedule(
    BuildContext context,
    String testName,
    DateTime startDate,
    DateTime endDate,
    Function(DateTime, DateTime) onSave,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: const Color(0xFFEAB700),
            border: Border.all(
              color: const Color(0xFFEAB700),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            '$testName Schedule',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        const Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF707070),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Text(
                          _getFormattedDate(startDate),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        const Text(
                          'End',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF707070),
                          ),
                        ),
                        const SizedBox(width: 50),
                        Text(
                          _getFormattedDate(endDate),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.edit, color: Colors.black),
                onPressed: () {
                  openDialog(context, testName, startDate, endDate, onSave);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Future<void> openDialog(
    BuildContext context,
    String testName,
    DateTime startDate,
    DateTime endDate,
    Function(DateTime, DateTime) onSave,
  ) async {
    TextEditingController startDateController = TextEditingController(
      text: _getFormattedDate(startDate),
    );
    TextEditingController endDateController = TextEditingController(
      text: _getFormattedDate(endDate),
    );

    DateTime? newStartDate = startDate;
    DateTime? newEndDate = endDate;

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: Text('Edit $testName Schedule',
                  style: const TextStyle(
                      color: Color(0xFFEAB700), fontWeight: FontWeight.bold)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      const Text('Start  '),
                      Expanded(
                        child: TextFormField(
                          controller: startDateController,
                          decoration: InputDecoration(
                            hintText: 'Select start date',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(width: 1),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 10.0),
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                          readOnly: true,
                          onTap: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: startDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (selectedDate != null) {
                              setState(() {
                                newStartDate = selectedDate;
                                startDateController.text =
                                    _getFormattedDate(selectedDate);
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('End    '),
                      Expanded(
                        child: TextFormField(
                          controller: endDateController,
                          decoration: InputDecoration(
                            hintText: 'Select end date',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(width: 1),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 10.0),
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                          readOnly: true,
                          onTap: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: endDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (selectedDate != null) {
                              setState(() {
                                newEndDate = selectedDate;
                                endDateController.text =
                                    _getFormattedDate(selectedDate);
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 194, 193, 193)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(color: Color(0xFFEAB700)),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFEAB700)),
                  ),
                  child:
                      const Text('Save', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    onSave(newStartDate ?? startDate, newEndDate ?? endDate);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _getFormattedDate(DateTime date) {
    return '${_getMonthName(date.month)} ${date.day}, ${date.year}';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
