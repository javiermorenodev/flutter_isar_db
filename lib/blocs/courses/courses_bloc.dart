import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_isar_db/db/entities/entities.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursesBloc() : super(const CoursesState()) {
    on<CoursesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
