import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(252, 238, 243, 1),
      appBar: AppBar(title: const Text("Menu")),
      body: const Center(
        child: Text(
          "Menu Page",
        ),
      ),
    );
  }
}
