import 'package:flutter/material.dart';
import 'package:inharited/inherited/state_controller.dart';
import 'package:inharited/models/user_modal.dart';
import 'package:inharited/pages/home_page.dart';

void main() {
  runApp(
    StateController(
      user: User(name: 'name', email: 'email', password: 'password'),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
