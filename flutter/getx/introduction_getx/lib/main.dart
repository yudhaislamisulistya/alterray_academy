import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_getx/bindings/counter_binding.dart';
import 'package:introduction_getx/screens/other_page.dart';
import 'controllers/counter_controller.dart';

void main() {
  Get.lazyPut<CounterController>(() => CounterController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Alta - Introduction GetX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: '/other-screen',
          binding: CounterBinding(),
          page: () => const OtherScreen(),
        ),
      ],
      home: const MyHomePage(title: 'Alta - Introduction GetX'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Clicks: ${Get.find<CounterController>().count}')),
            ElevatedButton(
              onPressed: () {
                Get.find<CounterController>().increment();
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/other-screen');
              },
              child: const Text('Go to Other Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
