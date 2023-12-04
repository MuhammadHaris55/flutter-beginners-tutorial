import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('learning flutter'),
        OutlinedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const MyHomePage()),
            // );
            Navigator.pop(context);
          },
          child: const Text('Click Me'),
        ),
      ],
    );
  }
}
