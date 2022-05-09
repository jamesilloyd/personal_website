import 'package:flutter/material.dart';

class JLDivider extends StatelessWidget {
  const JLDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // width: MediaQuery.of(context).size.width -160,
        width: MediaQuery.of(context).size.width -80,
        child: Divider(
          color: Colors.white,
          thickness: 0.5,
        ));
  }
}