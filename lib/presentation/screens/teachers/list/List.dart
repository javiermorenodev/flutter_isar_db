import 'package:flutter/material.dart';
import 'package:flutter_isar_db/presentation/screens/screens.dart';
import 'package:flutter_isar_db/presentation/screens/teachers/detail/index.dart';

class ListTeachersScreen extends StatefulWidget {
  const ListTeachersScreen({super.key});

  @override
  State<ListTeachersScreen> createState() => _ListTeachersScreenState();
}

class _ListTeachersScreenState extends State<ListTeachersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Lista de profesores',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF33357E),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return _item();
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 5,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            Navigator.pushNamed(context, NewTeacherScreen.routeName),
        icon: const Icon(Icons.add_circle),
        label: const Text("Nuevo profesor"),
      ),
    );
  }

  Widget _item() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TeacherDetailScreen(),
          ),
        );
      },
      child: Container(
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
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [_studentsIcons(), const Text(' + 2 cursos')],
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(.5),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox _studentsIcons() {
    return SizedBox(
      width: 50.0,
      height: 25.0,
      child: Stack(
        children: [
          Positioned(left: 0, top: 0, child: _studentIcon(Colors.grey)),
          Positioned(left: 30, top: 0, child: _studentIcon(Colors.grey)),
          Positioned(left: 15, top: 0, child: _studentIcon(Colors.black54)),
        ],
      ),
    );
  }

  Widget _studentIcon(Color color) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: color),
        color: color,
      ),
      child: const Center(
        child: Icon(
          Icons.file_copy,
          color: Colors.white,
          size: 12.0,
        ),
      ),
    );
  }
}
