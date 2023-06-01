import 'package:flutter_isar_db/db/entities/entities.dart';
import 'package:isar/isar.dart';

part 'teacher.g.dart';

@collection
class Teacher {
  Id id = Isar.autoIncrement;

  String? name;
  String? lastName;

  @Index(unique: true, name: 'email')
  String? email;

  String? phone;

  @Backlink(to: 'teacher')
  final courses = IsarLinks<Course>();
}
