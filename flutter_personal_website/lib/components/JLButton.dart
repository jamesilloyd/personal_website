import 'package:flutter/material.dart';

class JLButton extends StatelessWidget {
  const JLButton({
    required this.name,
    required this.onPressed,
  });

  // PasswordErrorSelectableText({this.errorMessage});

  final String name;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      child: Container(
        // color: Colors.red,
        padding: EdgeInsets.all(10),
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
