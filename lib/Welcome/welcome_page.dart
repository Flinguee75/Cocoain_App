import 'dart:async';
import 'package:cocaian/Boutique/Vitrine.dart';
import 'package:cocaian/elements/welcome_page_button.dart';
import 'package:cocaian/Welcome/welcome_page_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:ui' as ui;

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final done = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 250,
                  child: Image.asset(
                      "images/BUSHMAN_PICTURES/splash_screen_image.png"),
                ),
                const SizedBox(
                  height: 150,
                ),
                MyButton(
                  text: "S'Identifier",
                  color: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const WelcomePage2(),
                        type: PageTransitionType.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  text: 'Découvrir COCOAÏAN',
                  color: const Color.fromARGB(255, 232, 222, 80),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const HomePage(),
                        type: PageTransitionType.bottomToTop,
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
              .animate(onComplete: (_) => done.complete())
              .fadeIn(duration: 400.ms)
              .then()
              .fadeIn()
        ],
      ),
    );
  }
}
