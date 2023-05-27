import 'package:flutter/material.dart';
import 'package:flutter_isar_db/presentation/widgets/widgets.dart';

class TeacherDetailScreen extends StatelessWidget {
  const TeacherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentWidget(
        header: const HeaderWidget(
          title: 'Detalle de profesor',
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _infoCourse(context),
            const SizedBox(height: 20.0),
            Text(
              'Lista de Cursos',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20.0,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const ListTile(title: Text('Curso'));
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _infoCourse(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFEFFFF),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(.1),
            offset: const Offset(.1, 1),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Correo: ',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  children: const [
                    TextSpan(
                      text: 'correo@correo.com',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              RichText(
                text: TextSpan(
                  text: 'Nombre: Profesor Apellido',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
