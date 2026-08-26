import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/seetingcontroller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const Text(
            'School Information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller:
            controller.schoolNameController,
            decoration: const InputDecoration(
              labelText: 'School Name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.school,
              ),
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller:
            controller.phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone',
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.phone,
              ),
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller:
            controller.addressController,
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: 'Address',
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.location_on,
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,

            child: ElevatedButton.icon(
              onPressed: () {
                controller.saveSettings();
              },

              icon: const Icon(
                Icons.save,
              ),

              label: const Text(
                'Save Settings',
              ),
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            'Appearance',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Card(
            elevation: 3,

            child: Obx(
                  () => SwitchListTile(
                secondary: Icon(
                  controller.isDarkMode.value
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),

                title: const Text(
                  'Dark Mode',
                ),

                subtitle: Text(
                  controller.isDarkMode.value
                      ? 'Dark mode enabled'
                      : 'Light mode enabled',
                ),

                value:
                controller.isDarkMode.value,

                onChanged: (value) {
                  controller.changeTheme(
                    value,
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'About',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Card(
            elevation: 3,

            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(
                  Icons.school,
                ),
              ),

              title: const Text(
                'School Management System',
              ),

              subtitle: const Text(
                'Version 1.0.0',
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),

              onTap: () {
                showDialog(
                  context: context,

                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        'School Management System',
                      ),

                      content: const Text(
                        'Offline School Management System\n\n'
                            'Version: 1.0.0',
                      ),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                            );
                          },

                          child: const Text(
                            'OK',
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}