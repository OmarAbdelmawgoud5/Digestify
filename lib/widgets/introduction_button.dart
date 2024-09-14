import 'package:flutter/material.dart';

class IntroductionButton extends StatelessWidget {
  const IntroductionButton({
    super.key,
    required this.ontap,
    required this.text,
  });
  final VoidCallback ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blue),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 55)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          )),
      child: Text(text),
    );
  }
}
