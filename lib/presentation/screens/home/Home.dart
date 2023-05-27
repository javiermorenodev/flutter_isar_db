import 'package:flutter/material.dart';
import 'package:flutter_isar_db/presentation/screens/screens.dart';
import 'package:flutter_isar_db/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';
  static const List<Widget> _widgetOptions = [
    ListTeachersScreen(),
    ListCoursesScreen(),
    ListStudentsScreen(),
  ];

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentWidget(
        header: _header(),
        content: HomeScreen._widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profesores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: 'Cursos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Alumnos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _header() {
    return const Text(
      'Isar DB Flutter',
      style: TextStyle(
        color: Color(0xFF33357E),
        fontSize: 20.0,
      ),
    );
  }
}
