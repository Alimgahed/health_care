import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/home.dart';
import 'package:health_care/widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              // Logo
              Image.asset(
                'images/images.jpeg',
                height: 120,
              ),
              const SizedBox(height: 30),
              // Welcome Text
              Text(
                'مرحبًا بك في تطبيق الرعاية الصحية',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'يرجى تسجيل الدخول للوصول إلى حسابك',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              // Email Field
              CustomTextField(
                  labelText: "اسم المستخدم", prefixIcon: Icons.person),
              const SizedBox(height: 20),
              // Password Field
              CustomTextField(labelText: "كلمة المرور", prefixIcon: Icons.key),
              const SizedBox(height: 20),
              // Login Button
              ElevatedButton(
                onPressed: () {
                  Get.to(() => HomePage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              // Forgot Password
              TextButton(
                onPressed: () {},
                child: Text(
                  'هل نسيت كلمة المرور؟',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
