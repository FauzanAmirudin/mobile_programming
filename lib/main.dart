import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const BelajarYukApp());
}

class BelajarYukApp extends StatelessWidget {
  const BelajarYukApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BelajarYuk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}