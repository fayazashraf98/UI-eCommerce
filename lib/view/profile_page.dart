import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(252, 238, 243, 1),
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: const Center(
          child: Text(
            "Profile Page",
          ),
        ));
  }
}
