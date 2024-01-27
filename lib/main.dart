import 'package:flutter/material.dart';
import 'package:myapp/common/bottom_navigation_bar.dart';
import 'package:myapp/features/api_integeration/api_screen.dart';
import 'package:myapp/routing/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          // color: Colors.green,
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
          // elevation: 20.0,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.purple,
            backgroundColor: Colors.cyan,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.red,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          // fillColor: Colors.pink,
          // iconColor: Colors.teal,
          prefixIconColor: Colors.teal,
          suffixIconColor: Colors.black,
          focusColor: Colors.indigoAccent,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: TextStyle(color: Color(0xfff1f2ef), fontSize: 18),
          hintStyle: TextStyle(
            color: Colors.brown,
            // fontFamily: appFontFamily,
          ),
          // isDense: true,
          // contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
        ),
        primarySwatch: Colors.yellow,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      // home: const ApiIntegerationScreen(),
      // home: const MyHomePage(
      //   title: 'Flutter demo app',
      // ),
      // home: const SecondScreen(),
      home: const AppCustomBottomNavigationBar(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, this.title});

//   final String? title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.green,
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         leading: const Icon(Icons.arrow_back_ios_new_sharp),
//         actions: const [
//           Icon(Icons.notifications),
//           Icon(Icons.menu),
//         ],
//         centerTitle: true,
//         title: Text(
//           widget.title ?? 'Todo App',
//         ),
//         // flexibleSpace: Container(
//         //     decoration: const BoxDecoration(
//         //   image: DecorationImage(
//         //     fit: BoxFit.fitWidth,
//         //     image: AssetImage('assets/images/profile-picture.png'),
//         //   ),
//         // )),
//       ),
//       body: Container(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<Widget> bodyWidget = const [
    Text(
      "Home",
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    ),
    Text(
      "Notification",
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    ),
  ];

  _onTapFunc(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: bodyWidget.elementAt(_currentIndex)),
      bottomNavigationBar: const AppCustomBottomNavigationBar(),
      // BottomNavigationBar(
      //   selectedItemColor: Colors.indigo,
      //   // unselectedItemColor: Colors.black,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications),
      //       label: 'Notification',
      //     ),
      //   ],
      //   onTap: _onTapFunc,
      // ),
    );
  }
}
