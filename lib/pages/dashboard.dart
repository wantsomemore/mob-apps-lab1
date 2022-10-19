import 'package:flutter/material.dart';
import '../data/data.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    String selectedGroup = arguments['selectedGroup'];
    ScheduleData scheduleData = ScheduleData();
    Schedule schedule = scheduleData.getScheduleForGroup(selectedGroup);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Text(
              'Привіт, ${arguments['userName']}! Ось розклад групи ${selectedGroup} '),
          Expanded(
              child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              String dayName = scheduleData.getDayName(index);
              List<List<String>> subjects = [];
              schedule.dayToSubjects[dayName]?.subjects.forEach(
                  (key, value) => subjects.add([key.toString(), value]));

              return ExpansionTile(
                  title: Text(dayName),
                  children: subjects
                      .map((value) =>
                          ListTile(title: Text(value[0] + '. ' + value[1])))
                      .toList());
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ))
        ]),
      ),
    );
  }
}
