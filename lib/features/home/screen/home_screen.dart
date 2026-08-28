import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../attendance/screen/attendance_screen.dart';
import '../../auth/screen/login_screen.dart';
import '../../classes/screen/classes_screen.dart';
import '../../exams/screen/marks_screen.dart';
import '../../fees/screen/fees_screen.dart';
import '../../reports/screen/reports_screen.dart';
import '../../settings/controller/seetingcontroller.dart';
import '../../settings/screen/settings_screen.dart';
import '../../students/screen/students_screen.dart';
import '../../teachers/screen/teachers_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller =
    Get.find<SettingsController>();

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

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const SettingsScreen(),
                ),
              );
            },

            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],

      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
        
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.indigo,
                    ],
                  ),
                ),
        
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
        
                  children: [
                    const CircleAvatar(
                      radius: 32,
        
                      backgroundColor:
                      Colors.white,
        
                      child: Icon(
                        Icons.school,
                        size: 38,
                        color: Colors.blue,
                      ),
                    ),
        
                    const SizedBox(height: 10),
        
                    const Text(
                      'School Management',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
        
                    const Text(
                      'Offline School System',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
        
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
        
                title: const Text(
                  'Home',
                ),
        
                onTap: () {
                  Navigator.pop(context);
                },
              ),
        
              ListTile(
                leading: const Icon(
                  Icons.people,
                ),
        
                title: const Text(
                  'Students',
                ),
        
                onTap: () {
                  Navigator.push(
                    context,
        
                    MaterialPageRoute(
                      builder: (context) =>
                      const StudentScreen(),
                    ),
                  );
                },
              ),
        
              ListTile(
                leading: const Icon(
                  Icons.person,
                ),
        
                title: const Text(
                  'Teachers',
                ),
        
                onTap: () {
                  Navigator.push(
                    context,
        
                    MaterialPageRoute(
                      builder: (context) =>
                      const TeacherScreen(),
                    ),
                  );
                },
              ),
        
              ListTile(
                leading: const Icon(
                  Icons.class_,
                ),
        
                title: const Text(
                  'Classes',
                ),
        
                onTap: () {
                  Navigator.push(
                    context,
        
                    MaterialPageRoute(
                      builder: (context) =>
                      const ClassScreen(),
                    ),
                  );
                },
              ),
        
              ListTile(
                leading: const Icon(
                  Icons.check_circle,
                ),
        
                title: const Text(
                  'Attendance',
                ),
        
                onTap: () {
                  Navigator.push(
                    context,
        
                    MaterialPageRoute(
                      builder: (context) =>
                      const AttendanceScreen(),
                    ),
                  );
                },
              ),
        
              ListTile(
                leading: const Icon(
                  Icons.payment,
                ),
        
                title: const Text(
                  'Fees',
                ),
        
                onTap: () {
                  Navigator.push(
                    context,
        
                    MaterialPageRoute(
                      builder: (context) =>
                      const FeeScreen(),
                    ),
                  );
                },
              ),
        
              ListTile(
                leading: const Icon(
                  Icons.school,
                ),
        
                title: const Text(
                  'Exams / Marks',
                ),
        
                onTap: () {
                  Navigator.push(
                    context,
        
                    MaterialPageRoute(
                      builder: (context) =>
                      const MarksScreen(),
                    ),
                  );
                },
              ),
        
              ListTile(
                leading: const Icon(
                  Icons.description,
                ),
        
                title: const Text(
                  'Reports',
                ),
        
                onTap: () {
                  Navigator.push(
                    context,
        
                    MaterialPageRoute(
                      builder: (context) =>
                      const ReportScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
        
                title: const Text(
                  'Logout',
                ),
        
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
        
                    MaterialPageRoute(
                      builder: (context) =>
                      const LoginScreen(),
                    ),
        
                        (route) => false,
                  );
                },
              ),
        
              const Divider(),
        
              ListTile(
                leading: const Icon(
                  Icons.settings,
                ),
        
                title: const Text(
                  'Settings',
                ),
        
                onTap: () {
                  Navigator.push(
                    context,
        
                    MaterialPageRoute(
                      builder: (context) =>
                      const SettingsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.info_outline,
                ),
        
                title: const Text(
                  'About',
                ),
        
                onTap: () {
                  showDialog(
                    context: context,
        
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'About',
                        ),
        
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
        
                          children: [
                            Icon(
                              Icons.school,
                              size: 50,
                              color: Colors.blue,
                            ),
        
                            SizedBox(height: 15),
        
                            Text(
                              'School Management System',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
        
                            SizedBox(height: 8),
        
                            Text(
                              'Version 1.0.0',
                            ),
        
                            SizedBox(height: 10),
        
                            Text(
                              'Offline School Management System '
                                  'built with Flutter.',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
        
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
        
                            child: const Text(
                              'Close',
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.stretch,

          children: [

            Card(
              elevation: 5,

              child: Container(
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.indigo,
                    ],
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [
                      const Icon(
                        Icons.school,
                        color: Colors.white,
                        size: 40,
                      ),

                      const SizedBox(height: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome To 👋\n'
                                '${controller.schoolNameController.text} Management System',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Phone: ${controller.phoneController.text}",
                            style: const TextStyle(
                              color: Colors.white,
                             fontSize: 16,
                             ),
                          ),
                        SizedBox(height: 10,),
                           Text(
                            "Address: ${controller.addressController.text}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                        const SizedBox(height: 5),

                      const Text(
                        'Manage your school easily with easy and user friendly interface',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
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