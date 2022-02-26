import 'package:flutter/material.dart';
import 'package:presentation/screen/home/home_page.dart';

class PalindromeApp extends StatelessWidget {
  const PalindromeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}
