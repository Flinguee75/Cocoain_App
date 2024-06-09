import 'package:cocaian/Welcome/welcome_page.dart';
import 'package:cocaian/models/cart.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final done = Completer<void>();
  runApp(BigRedOne(done: done));
  await done.future;
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class BigRedOne extends StatelessWidget {
  const BigRedOne({
    required this.done,
    super.key,
  });
  final Completer<void> done;

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: ColoredBox(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  child: Image.asset(
                    'images/BUSHMAN_PICTURES/splash_screen_image.png',
                    filterQuality: FilterQuality.high,
                  ),
                ),
                SizedBox(
                  width: 190,
                  child: Image.asset(
                    'images/BUSHMAN_PICTURES/COCOAIAN1.png',
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ],
            )
                .animate(onComplete: (_) => done.complete())
                .fadeIn(duration: 1000.ms)
                .then()
                .fadeOut(),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const WelcomePage(),
      ),
    );
  }
}
