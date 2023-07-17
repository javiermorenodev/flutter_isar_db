import 'package:flutter_isar_db/db/entities/entities.dart';
import 'package:flutter_isar_db/db/isar.dart';
import 'package:isar/isar.dart';

class CourseServices {
  late Future<Isar> db;

  CourseServices() {
    db = IsarService().db;
  }

  Future<List<Course>> getAllCourses() async {
    final isar = await db;
    return await isar.courses.where().findAll();
  }

  Future<bool> saveCourse(Course newCourse) async {
    try {
      final isar = await db;
      await isar.writeTxn(() async {
        await isar.courses.put(newCourse);
        await newCourse.teacher.save();
      });
      return true;
    } on IsarError catch (error) {
      throw Exception(error.message);
    }
  }
}
