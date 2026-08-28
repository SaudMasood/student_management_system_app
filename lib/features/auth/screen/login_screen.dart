import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/authcontroler.dart';
import 'signup_screen.dart';
import '../../home/screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
    Get.put(Authcontroler());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Login',
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
              'Admin Login',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

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

              child:

              ElevatedButton(
                onPressed: () async {
                  final login = await controller.sigin();

                  if (login) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const HomeScreen(),
                      ),
                    );
                  }
                },

                child: const Text(
                  'Login',
                ),
              ),
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [
                const Text(
                  "Don't have an account?",
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) =>
                        const SignupScreen(),
                      ),
                    );
                  },

                  child: const Text(
                    'Sign Up',
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