import 'package:flutter_isar_db/db/entities/entities.dart';
import 'package:isar/isar.dart';

part 'course.g.dart';

@collection
class Course {
  Id id = Isar.autoIncrement;

  String? name;

  final teacher = IsarLink<Teacher>();

  @Backlink(to: 'courses')
  final students = IsarLinks<Student>();
}
