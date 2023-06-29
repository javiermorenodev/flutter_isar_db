part of 'teachers_bloc.dart';

abstract class TeachersEvent extends Equatable {
  const TeachersEvent();

  @override
  List<Object> get props => [];
}

class InitTeachers extends TeachersEvent {}

class GetAllTeachers extends TeachersEvent {}

class SaveTeacher extends TeachersEvent {
  final Teacher teacher;

  const SaveTeacher({required this.teacher});
}
