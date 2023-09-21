import 'package:get/instance_manager.dart';
import 'package:task_introduction_getx/controllers/course_controller.dart';

class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseController>(
      () => CourseController(),
    );
  }
}
