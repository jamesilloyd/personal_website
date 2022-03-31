import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

class JLIconButton extends StatefulWidget {
  const JLIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Function() onPressed;

  @override
  State<JLIconButton> createState() => _JLIconButtonState();
}

class _JLIconButtonState extends State<JLIconButton> {
  Color iconColor = Colors.white;
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
      iconColor = Colors.white;
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      iconColor = Colors.red;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: MaterialButton(
        minWidth: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.all(0),
        child: Icon(widget.icon, color: iconColor, size: 30),
        onPressed: widget.onPressed
      ),
    );
  }
}