import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_isar_db/db/entities/entities.dart';
import 'package:flutter_isar_db/db/services/teachers.dart';

part 'teachers_event.dart';
part 'teachers_state.dart';

class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  TeacherService teacherService = TeacherService();

  TeachersBloc() : super(const TeachersState()) {
    on<InitTeachers>((event, emit) =>
        emit(state.copyWith(loading: false, add: false, error: '')));

    on<GetAllTeachers>(((event, emit) async {
      emit(state.copyWith(loading: true));

      final resp = await teacherService.getAllTeachers();
      emit(state.copyWith(loading: false, listTeachers: resp));
    }));

    on<SaveTeacher>(((event, emit) async {
      try {
        emit(state.copyWith(loading: true));

        await teacherService.saveTeacher(event.teacher);
        emit(state.copyWith(loading: false, add: true));
      } catch (error) {
        try {
          if (error.toString().contains('Unique index violated.')) {
            emit(state.copyWith(
                loading: false, error: 'Correo ya registrado!!'));
          }
        } catch (e) {
          emit(state.copyWith(loading: false, error: 'Ocurrió un error'));
        }
      }
    }));
  }
}
