import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_introduction_getx/controllers/course_controller.dart';
import 'package:task_introduction_getx/models/course_model.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final TextEditingController _courseTitleController = TextEditingController();
  final TextEditingController _courseDescriptionController = TextEditingController();
  final CourseController _courseController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(
            AlertDialog(
              title: const Text('Add Course'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _courseTitleController,
                    decoration: const InputDecoration(
                      labelText: 'Course Name',
                    ),
                  ),
                  TextField(
                    controller: _courseDescriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Course Description',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (_courseTitleController.text.isEmpty || _courseDescriptionController.text.isEmpty) {
                      Get.showSnackbar(
                        const GetSnackBar(
                          message: 'Please fill all fields',
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    _courseController.addCourse(
                      CourseModel(
                        id: DateTime.now().millisecondsSinceEpoch,
                        title: _courseTitleController.text,
                        description: _courseDescriptionController.text,
                      ),
                    );
                    Get.back();
                    Get.showSnackbar(
                      const GetSnackBar(
                        message: 'Course Added',
                        duration: Duration(seconds: 2),
                      ),
                    );
                    _courseTitleController.clear();
                    _courseDescriptionController.clear();
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        // Obx if else
        child: Obx(() {
          if (_courseController.courseList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/data-not-found.svg',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No Courses',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _courseController.courseList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(_courseController.courseList[index].title),
                    subtitle: Text(_courseController.courseList[index].description),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _courseTitleController.text = _courseController.courseList[index].title;
                            _courseDescriptionController.text = _courseController.courseList[index].description;
                            Get.dialog(
                              AlertDialog(
                                title: const Text('Edit Course'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: _courseTitleController,
                                      decoration: const InputDecoration(
                                        labelText: 'Course Name',
                                      ),
                                    ),
                                    TextField(
                                      controller: _courseDescriptionController,
                                      decoration: const InputDecoration(
                                        labelText: 'Course Description',
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (_courseTitleController.text.isEmpty || _courseDescriptionController.text.isEmpty) {
                                        Get.showSnackbar(
                                          const GetSnackBar(
                                            message: 'Please fill all fields',
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                        return;
                                      }

                                      _courseController.updateCourse(
                                        CourseModel(
                                          id: _courseController.courseList[index].id,
                                          title: _courseTitleController.text,
                                          description: _courseDescriptionController.text,
                                        ),
                                      );
                                      Get.back();
                                      Get.showSnackbar(
                                        const GetSnackBar(
                                          message: 'Course Updated',
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                      _courseTitleController.clear();
                                      _courseDescriptionController.clear();
                                    },
                                    child: const Text('Update'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            Get.dialog(
                              AlertDialog(
                                title: const Text('Delete Course'),
                                content: const Text('Are you sure you want to delete this course?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _courseController.removeCourse(_courseController.courseList[index]);
                                      Get.back();
                                      Get.showSnackbar(
                                        const GetSnackBar(
                                          message: 'Course Deleted',
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
