import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(.5),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        const SizedBox(width: 20.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
