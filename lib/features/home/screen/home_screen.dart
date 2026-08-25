import 'package:flutter/material.dart';

import '../../fees/screen/fees_screen.dart';
import '../../students/screen/students_screen.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Management'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Text(
              'School Management System',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentScreen(),
                  ),
                );              },
              child: const Text('Students'),
            ),

            // const SizedBox(height: 10),
            //
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) =>
            //         const TeacherScreen(),
            //       ),
            //     );
            //   },
            //   child: const Text('Teachers'),
            // ),
            //
            // const SizedBox(height: 10),
            //
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) =>
            //         const ClassScreen(),
            //       ),
            //     );
            //   },
            //   child: const Text('Classes'),
            // ),
            //
            // const SizedBox(height: 10),
            //
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) =>
            //         const AttendanceScreen(),
            //       ),
            //     );
            //   },
            //   child: const Text('Attendance'),
            // ),
            //
            // const SizedBox(height: 10),
            //
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const FeeScreen(),
                  ),
                );
              },
              child: const Text('Fees'),
            ),

            // const SizedBox(height: 10),
            //
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) =>
            //         const MarksScreen(),
            //       ),
            //     );
            //   },
            //   child: const Text('Exams / Marks'),
            // ),
            //
            // const SizedBox(height: 10),
            //
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) =>
            //         const ReportScreen(),
            //       ),
            //     );
            //   },
            //   child: const Text('Generate Report'),
            // ),
          ],
        ),
      ),
    );
  }
}