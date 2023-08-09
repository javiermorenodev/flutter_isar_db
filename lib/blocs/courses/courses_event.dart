part of 'courses_bloc.dart';

abstract class CoursesEvent extends Equatable {
  const CoursesEvent();

  @override
  List<Object> get props => [];
}

class InitCourses extends CoursesEvent {}

class GetAllCourses extends CoursesEvent {}

class SaveCourse extends CoursesEvent {
  final Course course;

  const SaveCourse({required this.course});
}
