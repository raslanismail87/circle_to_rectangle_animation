import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Circle to Rectangle Animation')),
        body: CircleToRectangle(),
      ),
    );
  }
}

class CircleToRectangle extends StatefulWidget {
  @override
  _CircleToRectangleState createState() => _CircleToRectangleState();
}

class _CircleToRectangleState extends State<CircleToRectangle> {
  bool _isRectangle = false;

  void _toggleShape() {
    setState(() {
      _isRectangle = !_isRectangle;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final circleDiameter = screenWidth * 0.3;
    final rectangleWidth = screenWidth * 0.5;

    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          left: _isRectangle
              ? (screenWidth - rectangleWidth) / 2
              : (screenWidth - circleDiameter) / 2,
          top: _isRectangle
              ? (screenHeight - circleDiameter) / 2
              : screenHeight - circleDiameter - 150,
          child: GestureDetector(
            onTap: _toggleShape,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: _isRectangle ? rectangleWidth : circleDiameter,
              height: circleDiameter,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(
                    _isRectangle ? 0 : circleDiameter / 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
