import 'package:flutter/material.dart';
import 'home_page.dart';

class PalindromeApp extends StatelessWidget {
  const PalindromeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Palindrome check'),
    );
  }
}
