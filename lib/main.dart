import 'package:flutter/material.dart';
import 'package:registrar_log_feedback_app/loading_screen.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Registrar Feedback App',
    debugShowCheckedModeBanner: false,
    home: LoadingScreen(),
  ));
}