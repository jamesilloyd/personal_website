import 'package:flutter/material.dart';

class JLButton extends StatefulWidget {
  const JLButton({
    required this.name,
    required this.onPressed,
  });

  // PasswordErrorSelectableText({this.errorMessage});

  final String name;
  final Function() onPressed;

  @override
  State<JLButton> createState() => _JLButtonState();
}

class _JLButtonState extends State<JLButton> {
  double borderThickness = 0.5;
  Color textColor = Colors.white;
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      borderThickness = 0.5;
      textColor = Colors.white;
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      borderThickness = 1;
      textColor = Colors.red;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return MouseCursor();
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: MaterialButton(
        elevation: 10,
        child: SizedBox(
          height: 50,
          child: Center(
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  // border: Border.all(color: Colors.white, width: borderThickness),
                  ),
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    
                  ),
                ),
              ),
            ),
          ),
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
