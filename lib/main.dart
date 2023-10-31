import 'package:flutter/material.dart';
import 'package:tugas2_httprequest_124210001/users_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 2_HTTP Request_124210001',
      home: UsersPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
