import 'package:flutter/material.dart';
import 'package:ui_design/services/constant_widgets.dart';
import 'package:ui_design/view/deshboard_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI',
      home: Dashbord(),
    );
  }
}
