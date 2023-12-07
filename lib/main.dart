import 'package:flutter/material.dart';
import 'package:myapp_json/add_user.dart';
import 'package:myapp_json/default_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultPage()
    );
  }
}