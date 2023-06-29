import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_isar_db/db/entities/entities.dart';

part 'teachers_event.dart';
part 'teachers_state.dart';

class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  TeachersBloc() : super(const TeachersState()) {
    on<TeachersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
