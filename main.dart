import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/firebase_options.dart'; 
import 'register.dart';
import 'login.dart';

void main() async {
  // รอให้ Firebase initialize ก่อนที่จะรันแอป
  WidgetsFlutterBinding.ensureInitialized();  // เพิ่มเพื่อให้ Flutter รู้ว่าต้องรอ Firebase initialize
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // เรียกใช้ตัวเลือกที่กำหนดไว้ใน firebase_options.dart
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าแรก'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // ไปยังหน้าลงทะเบียน
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()), // ใช้ชื่อ RegisterPage แทน registerPage
                );
              },
              child: Text('ลงทะเบียน'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ไปยังหน้าล็อกอิน
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()), // ใช้ชื่อ LoginPage แทน loginPage
                );
              },
              child: Text('เข้าสู่ระบบ'),
             ),
            ],
          ),
        ),
      ),
    );
  }
}