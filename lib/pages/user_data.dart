import 'package:flutter/material.dart';
import 'package:inharited/inherited/state_controller.dart';

class UserDataPage extends StatelessWidget {
  const UserDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the data from InheritedWidget
    final user = StateController.of(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Name: ${user.name}'),
            const SizedBox(height: 10),
            Text('Email: ${user.email}'),
            const SizedBox(height: 10),
            Text('Password: ${user.password}'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
