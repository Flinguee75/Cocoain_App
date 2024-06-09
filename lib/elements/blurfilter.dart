import 'package:flutter/material.dart';
import 'dart:ui' as ui;

Widget backdropFilterExample(BuildContext context, Widget child) {
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      child,
      BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 8.0,
          sigmaY: 8.0,
        ),
        child: Container(
          color: Colors.transparent,
        ),
      )
    ],
  );
}
