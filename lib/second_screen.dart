import 'package:flutter/material.dart';
import 'package:myapp/routing/route_path.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  switchCaseExample(int val) {
    switch (val) {
      case 1:
        return print('value is equal to 1');

      case 2:
        return print('value is equal to 2');

      case 3:
        return print('value is equal to 3');
    }
    if (val == 1) {
      print('value is equal to 1');
    } else if (val == 2) {
      print('value is equal to 2');
    } else if (val == 3) {
      print('value is equal to 3');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('learning flutter'),
          OutlinedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const MyHomePage()),
              // );
              // Navigator.pop(context);
              // switchCaseExample(2);
              Navigator.pushNamed(context, RoutePath.homePage);
            },
            child: const Text('Click Me'),
          ),
        ],
      ),
    );
  }
}
