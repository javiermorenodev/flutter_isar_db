import 'package:flutter_isar_db/db/entities/entities.dart';
import 'package:flutter_isar_db/db/isar.dart';
import 'package:isar/isar.dart';

class TeacherService {
  late Future<Isar> db;

  TeacherService() {
    db = IsarService().db;
  }

  Future<List<Teacher>> getAllTeachers() async {
    final isar = await db;

    return await isar.teachers.where().findAll();
  }

  Future<bool> saveTeacher(Teacher newTeacher) async {
    try {
      final isar = await db;

      await isar.writeTxn(() async {
        await isar.teachers.put(newTeacher);
      });
      return true;
    } on IsarError catch (error) {
      throw Exception(error.message);
    }
  }
}
