import 'package:flutter/material.dart';
import 'package:flutter_isar_db/presentation/screens/students/detail/index.dart';
import 'package:flutter_isar_db/presentation/screens/students/new/New.dart';

class ListStudentsScreen extends StatefulWidget {
  static String routeName = 'list_students';

  const ListStudentsScreen({super.key});

  @override
  State<ListStudentsScreen> createState() => _ListStudentsScreenState();
}

class _ListStudentsScreenState extends State<ListStudentsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Lista de alumnos',
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
              itemCount: 2,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewStudentScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add_circle),
        label: const Text("Nuevo alumno"),
      ),
    );
  }

  Widget _item() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StudentDetailScreen(),
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
                const SizedBox(height: 10.0),
                RichText(
                  text: TextSpan(
                    text: 'Nombre: Alumno Apellido',
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
                  children: [
                    _studentsIcons(),
                    const Text(' + 2 cursos'),
                  ],
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
