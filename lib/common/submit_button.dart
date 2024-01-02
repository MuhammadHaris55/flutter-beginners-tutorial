import 'package:flutter/material.dart';

import '../second_screen.dart';

class SubmitButton extends StatelessWidget {
  String text;
  VoidCallback onpressHandler;
  SubmitButton({
    super.key,
    required this.text,
    required this.onpressHandler,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onpressHandler,
      child: Text(text),
    );
  }
}
