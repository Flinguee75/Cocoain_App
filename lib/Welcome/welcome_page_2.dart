import 'dart:async';

import 'package:cocaian/Boutique/Vitrine.dart';
import 'package:cocaian/elements/BackGroundShades.dart';
import 'package:cocaian/elements/LoginButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:ui' as ui;

class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({super.key});

  @override
  State<WelcomePage2> createState() => _WelcomePage2State();
}

class _WelcomePage2State extends State<WelcomePage2> {
  final done = Completer<void>();

  //late VideoPlayerController _controller;
  //@override

  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.asset('images/grunt3.mp4')
  //     ..initialize().then((_) {
  //       _controller.play();
  //       _controller.setLooping(true);
  //       setState(() {});
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return BackgroundShapes(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
          shadowColor: const Color(0xFFEDECF2),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "images/MAGAZIN/creativity.png",
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 50.0,
                sigmaY: 50.0,
              ),
              blendMode: BlendMode.modulate,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(40),
                    child: Image.asset(
                      "images/BUSHMAN_PICTURES/COCOAIAN1.png",
                    ),
                  ),
                  Text(
                    "Just Focus",
                    style: GoogleFonts.lemonada(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Le meilleur commence ici.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoMono(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  MyLoginButton(
                    text: "Connectez-vous avec Apple ",
                    color: Colors.white,
                    logo: Image.asset("images/apple-logo.png"),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const HomePage(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyLoginButton(
                    text: 'Connectez-vous avec Google',
                    color: Colors.white,
                    logo: Image.asset("images/google.png"),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const HomePage(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyLoginButton(
                    text: "Connectez-vous avec Mail",
                    color: Colors.white,
                    logo: Image.asset("images/mail.png"),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const HomePage(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "images/BUSHMAN_PICTURES/splash_screen_image.png",
                    height: 70,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
