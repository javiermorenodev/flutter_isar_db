part of 'teachers_bloc.dart';

class TeachersState extends Equatable {
  final bool loading;
  final String error;
  final bool add;
  final List<Teacher> listTeachers;

  const TeachersState({
    this.loading = false,
    this.error = '',
    this.add = false,
    this.listTeachers = const [],
  });

  TeachersState copyWith({
    bool? loading,
    String? error,
    bool? add,
    List<Teacher>? listTeachers,
  }) =>
      TeachersState(
        loading: loading ?? this.loading,
        error: error ?? this.error,
        add: add ?? this.add,
        listTeachers: listTeachers ?? this.listTeachers,
      );

  @override
  List<Object> get props => [loading, error, add, listTeachers];
}
