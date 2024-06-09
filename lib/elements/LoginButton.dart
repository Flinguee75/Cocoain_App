import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLoginButton extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final Color color;
  final Image logo;
  const MyLoginButton({
    super.key,
    this.onTap,
    required this.text,
    required this.color,
    required this.logo,
  });

  @override
  State<MyLoginButton> createState() => _MyLoginButtonState();
}

class _MyLoginButtonState extends State<MyLoginButton> {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.robotoMono(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
                child: widget.logo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
