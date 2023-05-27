import 'package:flutter/material.dart';
import 'package:flutter_isar_db/presentation/screens/courses/detail/Detail.dart';
import 'package:flutter_isar_db/presentation/screens/screens.dart';

class ListCoursesScreen extends StatefulWidget {
  static String routeName = 'list_courses';

  const ListCoursesScreen({super.key});

  @override
  State<ListCoursesScreen> createState() => _ListCoursesScreenState();
}

class _ListCoursesScreenState extends State<ListCoursesScreen> {
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
            'Lista de cursos',
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
              itemCount: 3,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            Navigator.pushNamed(context, NewCourseScreen.routeName),
        icon: const Icon(Icons.add_circle),
        label: const Text("Nuevo curso"),
      ),
    );
  }

  Widget _item() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CourseDetailScreen(),
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
                    text: 'Profesor: ',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    children: const [
                      TextSpan(
                        text: 'Profesor Apellido',
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
                    text: 'Curso: Curso',
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
                  children: [_studentsIcons(), const Text(' + 2 alumnos')],
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
    return Icon(
      Icons.account_circle_rounded,
      color: color,
    );
  }
}
