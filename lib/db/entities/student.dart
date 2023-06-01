import 'package:flutter_isar_db/db/entities/entities.dart';
import 'package:isar/isar.dart';

part 'student.g.dart';

@collection
class Student {
  Id id = Isar.autoIncrement;

  String? name;
  String? lastName;

  final courses = IsarLinks<Course>();
}
