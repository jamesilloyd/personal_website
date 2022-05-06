import 'package:flutter/material.dart';
import 'package:flutter_personal_website/main.dart';
import 'package:video_player/video_player.dart';

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
                color: Color(kBackgroundGrey),
                border: Border.all(color: textColor, width: 0.5),
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

class JLPausePlay extends StatefulWidget {
  const JLPausePlay({
    required this.controller,
    required this.onPressed,
  });

  // PasswordErrorSelectableText({this.errorMessage});

  final Function() onPressed;
  final VideoPlayerController controller;

  @override
  State<JLPausePlay> createState() => _JLPausePlayState();
}

class _JLPausePlayState extends State<JLPausePlay> {
  double borderThickness = 0.5;
  Color iconColor = Colors.white;
  bool isPlaying = false;
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
      iconColor = Colors.white;
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      borderThickness = 1;
      iconColor = Colors.red;
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
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        child: Center(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(kBackgroundGrey),
              border: Border.all(
                  color: isPlaying ? Colors.red : iconColor, width: 1),
            ),
            padding: EdgeInsets.all(10),
            child: Center(
              child: isPlaying
                  ? Icon(
                      Icons.pause_circle_filled_outlined,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.play_arrow_outlined,
                      color: iconColor,
                    ),
            ),
          ),
        ),
        onPressed: () {
          isPlaying = !isPlaying;

          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (widget.controller.value.isPlaying) {
              widget.controller.pause();
            } else {
              // If the video is paused, play it.
              widget.controller.play();
            }
          });
        },
      ),
    );
  }
}
