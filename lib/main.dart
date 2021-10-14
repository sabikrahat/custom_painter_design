import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Custom Pain'),
      ),
      body: Center(
        child: SizedBox(
          height: 300.0,
          width: 300.0,
          child: CustomPaint(
            size: const Size(200, 200),
            painter: DrawCustomCanvasUsingPaths(),
            child: const Padding(
              padding: EdgeInsets.only(left: 100.0),
              child: Icon(
                Icons.close,
                size: 40.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawCustomCanvasUsingPaths extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xffaa44aa)
      ..style = PaintingStyle.fill;

    Path path = Path();

    path.lineTo(0, size.height * 1 / 2);
    path.lineTo(size.width * 1 / 3, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 1 / 3, size.height);
    path.lineTo(0, size.height * 1 / 2);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DrawCustomCanvasUsingPoints extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    PointMode pointMode = PointMode.polygon;
    Paint paint = Paint()
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..color = Colors.red;

    final points = [
      Offset(0, size.height * 1 / 2),
      Offset(size.width * 1 / 3, 0),
      Offset(size.width, 0),
      Offset(size.width, size.height),
      Offset(size.width * 1 / 3, size.height),
      Offset(0, size.height * 1 / 2),
    ];

    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DrawCustomCanvasUsingLines extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..color = Colors.amber;

    canvas.drawLine(
      Offset(0, size.height * 1 / 2),
      Offset(size.width * 1 / 3, 0),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height * 1 / 2),
      Offset(size.width * 1 / 3, size.height),
      paint,
    );

    canvas.drawLine(
      Offset(size.width * 1 / 3, 0),
      Offset(size.width, 0),
      paint,
    );

    canvas.drawLine(
      Offset(size.width * 1 / 3, size.height),
      Offset(size.width, size.height),
      paint,
    );

    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
