import 'package:flutter/material.dart';
import 'package:presentation/application.dart';
import 'di/injector.dart';

void main() {
  setupLocator();
  runApp(const PalindromeApp());
}