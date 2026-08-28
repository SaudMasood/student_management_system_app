import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/authcontroler.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
    Get.put(Authcontroler());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Signup',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [
            const SizedBox(height: 30),

            const Icon(
              Icons.admin_panel_settings,
              size: 80,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            const Text(
              'Create Admin Account',

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller:
              controller.nameC,

              decoration:
              const InputDecoration(
                labelText: 'Admin Name',
                border:
                OutlineInputBorder(),
                prefixIcon:
                Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
              controller.emailc,

              keyboardType:
              TextInputType.emailAddress,

              decoration:
              const InputDecoration(
                labelText: 'Email',
                border:
                OutlineInputBorder(),
                prefixIcon:
                Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
              controller.passwordc,

              obscureText: true,

              decoration:
              const InputDecoration(
                labelText: 'Password',
                border:
                OutlineInputBorder(),
                prefixIcon:
                Icon(Icons.lock),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () async {
                  await controller.signup();
                },

                child: const Text(
                  'Create Account',
                ),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [
                const Text(
                  'Already have an account?',
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  child: const Text(
                    'Login',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}