import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_isar_db/blocs/blocs.dart';
import 'package:flutter_isar_db/db/entities/entities.dart';
import 'package:flutter_isar_db/presentation/widgets/widgets.dart';
import 'package:flutter_isar_db/utils/utils.dart';

class NewTeacherScreen extends StatefulWidget {
  static String routeName = 'new_teacher';

  const NewTeacherScreen({super.key});

  @override
  State<NewTeacherScreen> createState() => _NewTeacherScreenState();
}

class _NewTeacherScreenState extends State<NewTeacherScreen> {
  final _nameTextEditingController = TextEditingController();
  final _lastNameTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();
  final _phoneTextEditingController = TextEditingController();

  late bool _errorName = false;
  late bool _errorLastName = false;
  late bool _errorEmail = false;

  void _save() {
    bool band = false;

    if (!Validators.validateEmail(_emailTextEditingController.text.trim())) {
      band = true;
      _errorEmail = true;
    } else {
      _errorEmail = false;
    }

    if (!Validators.validateText(_lastNameTextEditingController.text.trim())) {
      band = true;
      _errorLastName = true;
    } else {
      _errorLastName = false;
    }

    if (!Validators.validateText(_nameTextEditingController.text.trim())) {
      band = true;
      _errorName = true;
    } else {
      _errorName = false;
    }

    setState(() {});

    if (band) return;

    final teacher = Teacher()
      ..email = _emailTextEditingController.text.trim()
      ..name = _nameTextEditingController.text
      ..lastName = _lastNameTextEditingController.text
      ..phone = _phoneTextEditingController.text;

    context.read<TeachersBloc>().add(SaveTeacher(teacher: teacher));
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _phoneTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersBloc, TeachersState>(
      builder: (context, state) {
        if (state.add) {
          Future.delayed(Duration.zero, () {
            context.read<TeachersBloc>()
              ..add(InitTeachers())
              ..add(GetAllTeachers());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Profesor agregado con éxito'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          });
        }
        if (state.error != '') {
          Future.delayed(Duration.zero, () {
            context.read<TeachersBloc>().add(InitTeachers());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: const Color(0xFFc89a94),
              ),
            );
          });
        }
        return Scaffold(
          body: ContentWidget(
            header: const HeaderWidget(
              title: 'Nuevo profesor',
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldWidget(
                    label: 'Nombre',
                    hintText: 'Nombre del profesor',
                    icon: Icons.school,
                    controller: _nameTextEditingController,
                    error: _errorName,
                  ),
                  const SizedBox(height: 20.0),
                  TextFieldWidget(
                    label: 'Apellido',
                    hintText: 'Apellido del profesor',
                    icon: Icons.school,
                    controller: _lastNameTextEditingController,
                    error: _errorLastName,
                  ),
                  const SizedBox(height: 20.0),
                  TextFieldWidget(
                    label: 'Correo',
                    hintText: 'Correo del profesor',
                    icon: Icons.email,
                    controller: _emailTextEditingController,
                    error: _errorEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20.0),
                  TextFieldWidget(
                    label: 'Teléfono',
                    hintText: 'Teléfono del profesor',
                    icon: Icons.call,
                    controller: _phoneTextEditingController,
                    error: false,
                    keyboardType: TextInputType.number,
                  ),
                  ButtonWidget(onPressed: _save),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
