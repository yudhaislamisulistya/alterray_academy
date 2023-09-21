import 'package:get/get.dart';
import 'package:task_introduction_getx/models/course_model.dart';

class CourseController extends GetxController {
  final _courseList = <CourseModel>[].obs;
  List<CourseModel> get courseList => _courseList;

  void addCourse(CourseModel course) {
    _courseList.add(course);
  }

  void removeCourse(CourseModel course) {
    _courseList.remove(course);
  }

  void updateCourse(CourseModel course) {
    _courseList[_courseList.indexWhere((element) => element.id == course.id)] = course;
  }
}
