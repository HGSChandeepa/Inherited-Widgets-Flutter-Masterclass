import 'package:flutter/material.dart';
import 'package:inharited/inherited/state_controller.dart';
import 'package:inharited/pages/add_user.dart';
import 'package:inharited/pages/user_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Get the data from InheritedWidget
    final user = StateController.of(context).user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
            ElevatedButton(
              onPressed: () {
                // Go to add user page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const UserDataPage();
                    },
                  ),
                );
              },
              child: const Text('User Page'),
            ),
            ElevatedButton(
              onPressed: () {
                // Go to add user page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddUser();
                    },
                  ),
                );
              },
              child: const Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
}
