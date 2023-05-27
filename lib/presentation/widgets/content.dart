import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  final Widget header;
  final Widget content;

  const ContentWidget({
    Key? key,
    required this.content,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFEFFFF),
                  Color(0xFFfbfafe),
                  Color(0xFFfcfcfe),
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                header,
                const SizedBox(height: 20.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: content,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
