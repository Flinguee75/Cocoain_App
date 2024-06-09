import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final Color color;
  const MyButton({
    super.key,
    this.onTap,
    required this.text,
    required this.color,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(8),
          color: widget.color,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: GoogleFonts.robotoMono(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
