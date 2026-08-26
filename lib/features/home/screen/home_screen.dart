import 'package:flutter/material.dart';

import '../../attendance/screen/attendance_screen.dart';
import '../../classes/screen/classes_screen.dart';
import '../../exams/screen/marks_screen.dart';
import '../../fees/screen/fees_screen.dart';
import '../../reports/screen/reports_screen.dart';
import '../../settings/screen/settings_screen.dart';
import '../../students/screen/students_screen.dart';
import '../../teachers/screen/teachers_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> modules = [
      {
        'title': 'Students',
        'subtitle': 'Manage students',
        'icon': Icons.people,
        'color': Colors.blue,
        'screen': const StudentScreen(),
      },
      {
        'title': 'Teachers',
        'subtitle': 'Manage teachers',
        'icon': Icons.person,
        'color': Colors.green,
        'screen': const TeacherScreen(),
      },
      {
        'title': 'Classes',
        'subtitle': 'Manage classes',
        'icon': Icons.class_,
        'color': Colors.orange,
        'screen': const ClassScreen(),
      },
      {
        'title': 'Attendance',
        'subtitle': 'Manage attendance',
        'icon': Icons.check_circle,
        'color': Colors.purple,
        'screen': const AttendanceScreen(),
      },
      {
        'title': 'Fees',
        'subtitle': 'Manage student fees',
        'icon': Icons.payment,
        'color': Colors.red,
        'screen': const FeeScreen(),
      },
      {
        'title': 'Exams / Marks',
        'subtitle': 'Manage exam marks',
        'icon': Icons.school,
        'color': Colors.teal,
        'screen': const MarksScreen(),
      },
      {
        'title': 'Reports',
        'subtitle': 'View school reports',
        'icon': Icons.assessment,
        'color': Colors.indigo,
        'screen': const ReportScreen(),
      },
    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'School Management',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.stretch,

          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },

              icon: const Icon(Icons.settings),

              label: const Text('Settings'),
            ),
            Card(
              elevation: 5,
              color: Colors.blue,

              child: const Padding(
                padding: EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 40,
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Welcome 👋',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'Manage your school easily',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'School Modules',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: modules.length,

                itemBuilder: (context, index) {
                  final module = modules[index];

                  return Card(
                    elevation: 4,

                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ),

                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                        module['color'],

                        child: Icon(
                          module['icon'],
                          color: Colors.white,
                        ),
                      ),

                      title: Text(
                        module['title'],
                        style: const TextStyle(
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        module['subtitle'],
                      ),

                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            module['screen'],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}