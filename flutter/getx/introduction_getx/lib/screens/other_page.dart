import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_getx/controllers/counter_controller.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Clicks: ${counterController.count}')),
            ElevatedButton(
              onPressed: () {
                counterController.increment();
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
