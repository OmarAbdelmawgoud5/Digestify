import 'package:flutter/material.dart';
import 'package:news_app/models/section_model.dart';

class SectionPrefButton extends StatefulWidget {
  const SectionPrefButton(
      {super.key, required this.section, required this.prefmap});
  final SectionModel section;
  final Map<String, String> prefmap;
  @override
  State<SectionPrefButton> createState() => _SectionPrefButtonState();
}

class _SectionPrefButtonState extends State<SectionPrefButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(
          () {
            if (isPressed) {
              widget.prefmap.remove(widget.section.sectionName);
            } else {
              widget.prefmap.addAll({widget.section.sectionName: widget.section.sectionId});
            }
            isPressed = !isPressed;
          },
        );
      },
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        backgroundColor:
            WidgetStatePropertyAll(isPressed ? Colors.blue : Colors.white),
        foregroundColor: WidgetStatePropertyAll(
            isPressed ? Colors.white : Colors.grey.shade400),
      ),
      child: Text(
        widget.section.sectionName,
        style: const TextStyle(fontFamily: "sf", fontSize: 15),
      ),
    );
  }
}
