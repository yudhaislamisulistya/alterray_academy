import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:task_introduction_getx/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Alta - Task GetX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      initialRoute: '/courses',
      getPages: routes,
    );
  }
}
