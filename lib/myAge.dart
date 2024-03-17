import 'package:flutter/material.dart';

class MyAge extends StatefulWidget {
  const MyAge({super.key});

  @override
  State<MyAge> createState() => _MyAgeState();
}

class _MyAgeState extends State<MyAge> {
  //input data from text filed
  final dateController = TextEditingController();
  //result form age calculation
  late String textAge = '';

  String dateISO(dateISOString) {
    final df = DateTime.parse(dateISOString);
    late String day = df.day.toString();
    late String month = df.month.toString();
    late int year = df.year;
    return '$year-$month-$day';
  }

  calAge(int year, int month, int day) {
    // วันเกิด
    DateTime birthday = DateTime(year, month, day);
    // วันที่ปัจจุบัน
    DateTime now = DateTime.now();
    // คำนวณอายุ
    Duration difference = now.difference(birthday);
    int years = (difference.inDays / 365).floor();
    int months = ((difference.inDays % 365) / 30).floor();
    int days = (difference.inDays % 365) % 30;

    setState(() {
      textAge = 'Age: $years ปี $months เดือน $days วัน';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('My Age'),
        ),
        body: SingleChildScrollView(
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today),
                        labelText: 'Birthday'),
                    onTap: () async {
                      DateTime? pickeDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2101),
                          initialDate: DateTime.now(),
                          initialEntryMode: DatePickerEntryMode.calendarOnly);
                      if (pickeDate != null) {
                        print(pickeDate);
                        calAge(pickeDate.year, pickeDate.month, pickeDate.day);
                        setState(() {
                          dateController.text =
                              dateISO(pickeDate.toIso8601String());
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    textAge,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}
