import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final bool error;
  final TextInputType keyboardType;

  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.error,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            color: error ? const Color(0xFFf8dfdc) : const Color(0xFFF4F5FE),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              style: TextStyle(color: Theme.of(context).primaryColor),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                    color: error
                        ? const Color(0xFFc89a94)
                        : const Color(0xFF9499C0)),
                suffixIcon: Icon(
                  icon,
                  color: error
                      ? const Color(0xFFc76a5e)
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
