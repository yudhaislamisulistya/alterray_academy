import 'package:get/get.dart';
import 'package:task_introduction_getx/bindings/course_binding.dart';
import 'package:task_introduction_getx/screens/course_screen.dart';

final routes = [
  GetPage(
    name: '/courses',
    binding: CourseBinding(),
    page: () => const CourseScreen(),
  ),
];
