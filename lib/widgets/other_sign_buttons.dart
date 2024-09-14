import 'package:flutter/material.dart';

class OtherSignButtons extends StatelessWidget {
  const OtherSignButtons({
    super.key,
    required this.text,
    required this.logoPath,
    required this.ontap,
  });
  final String text;
  final String logoPath;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(
          color: Colors.blue.shade100,
        ),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            logoPath,
            height: 35,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "sf",
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
