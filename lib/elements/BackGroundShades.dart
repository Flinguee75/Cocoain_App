import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundShapes extends StatefulWidget {
  const BackgroundShapes({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<BackgroundShapes> createState() => _BackgroundShapesState();
}

class _BackgroundShapesState extends State<BackgroundShapes>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
    _controller.repeat(reverse: true);
    super.initState();
  }

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: BackgroundPainter(_animation),
                child: Container(),
              );
            },
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
            child: Container(
              color: Colors.black.withOpacity(0.87),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeStatusListener((status) {});
    _controller.dispose();
    super.dispose();
  }
}

class BackgroundPainter extends CustomPainter {
  final Animation<double> animation;

  const BackgroundPainter(this.animation);

  Offset getOffset(Path path) {
    final pms = path.computeMetrics(forceClosed: false).elementAt(0);
    final length = pms.length;
    final offset = pms.getTangentForOffset(length * animation.value)!.position;
    return offset;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.maskFilter = const MaskFilter.blur(
      BlurStyle.normal,
      80,
    );
    drawShape2(canvas, size, paint, Colors.amber);
    drawShape3(canvas, size, paint, Colors.red);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

  void drawShape1(
    Canvas canvas,
    Size size,
    Paint paint,
    Color color,
  ) {
    paint.color = color;
    Path path = Path();

    path.moveTo(size.width, 0);
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 2,
      -100,
      size.height / 4,
    );

    final offset = getOffset(path);
    canvas.drawCircle(offset, 150, paint);
  }

  void drawShape2(
    Canvas canvas,
    Size size,
    Paint paint,
    Color color,
  ) {
    paint.color = color;
    Path path = Path();

    path.moveTo(size.width, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 2,
      size.width * 0.9,
      size.height * 0.9,
    );

    final offset = getOffset(path);
    canvas.drawCircle(offset, 250, paint);
  }

  void drawShape3(
    Canvas canvas,
    Size size,
    Paint paint,
    Color color,
  ) {
    paint.color = color;
    Path path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(
      0,
      size.height,
      size.width / 3,
      size.height / 3,
    );

    final offset = getOffset(path);
    canvas.drawCircle(offset, 250, paint);
  }
}

// @override
// Widget build(BuildContext context) {
//   return BackgroundShapes(
//     child: Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(32.0),
//           child: ...
//           ),
//         ),
//       ),
//     );
//   }

// class BackgroundPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();
//     paint.maskFilter = const MaskFilter.blur(
//       BlurStyle.normal,
//       30,
//     );
//     drawShape1(canvas, size, paint, Colors.orange);
//     drawShape2(canvas, size, paint, Colors.purple);
//     drawShape3(canvas, size, paint, Colors.blue);
//   }

//   void drawShape1() {
//     ...
//   }
// }

// class _BackgroundShapesState extends State<BackgroundShapes>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     ...
//     super.initState();
//   }

//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         return ...
//       },
//     );
//   }
// }
