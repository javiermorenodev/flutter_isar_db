part of 'courses_bloc.dart';

class CoursesState extends Equatable {
  final bool loading;
  final bool add;
  final String error;
  final List<Course> listCourses;

  const CoursesState({
    this.loading = false,
    this.add = false,
    this.error = '',
    this.listCourses = const [],
  });

  CoursesState copyWith({
    bool? loading,
    bool? add,
    String? error,
    List<Course>? listCourses,
  }) =>
      CoursesState(
        loading: loading ?? this.loading,
        add: add ?? this.add,
        error: error ?? this.error,
        listCourses: listCourses ?? this.listCourses,
      );

  @override
  List<Object> get props => [loading, add, error, listCourses];
}
