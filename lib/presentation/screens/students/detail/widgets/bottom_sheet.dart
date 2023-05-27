import 'package:flutter/material.dart';
import 'package:flutter_isar_db/presentation/widgets/widgets.dart';
import 'package:select_modal_flutter/select_modal_flutter.dart';

class BottomSheetAddCourseWidget extends StatefulWidget {
  const BottomSheetAddCourseWidget({super.key});

  @override
  State<BottomSheetAddCourseWidget> createState() =>
      _BottomSheetAddCourseWidgetState();
}

class _BottomSheetAddCourseWidgetState
    extends State<BottomSheetAddCourseWidget> {
  late bool _errorCourse = false;

  void _save() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Agregar curso',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          color: Theme.of(context).primaryColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5.0,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: SelectModalFlutter(
                  title: 'Curso',
                  onItemSelect: (ItemSelect value) {},
                  listItemSelect: []
                      .map((course) =>
                          ItemSelect(value: course.id, label: course.name))
                      .toList(),
                  boxDecoration: BoxDecoration(
                    color: _errorCourse
                        ? const Color(0xFFf8dfdc)
                        : const Color(0xFFF4F5FE),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  borderTextField: InputBorder.none,
                  icon: Icons.arrow_drop_down,
                  colorIcon: Theme.of(context).primaryColor,
                  error: _errorCourse,
                ),
              ),
              ButtonWidget(onPressed: _save),
            ],
          ),
        ),
      ),
    );
  }
}
