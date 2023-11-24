import 'package:alexapp_task/presentation/screens/register_screen.dart';
import 'package:alexapp_task/const/utlis/themes.dart';
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
      locale: const Locale("ar", "AE"),
      title: 'AlexApp Task',
      theme: Themes.getAppTheme(),
      home: ResgisterScreen(),
    );
  }
}
