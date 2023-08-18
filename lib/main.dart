import 'package:evenodd/num-split-scrn.dart';
import 'package:evenodd/routes/route.dart';
import 'package:evenodd/splash-screen.dart';
import 'package:flutter/material.dart';
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
      getPages: ApplicationRoutes.appRoutes().toList(),
    );
  }
}
