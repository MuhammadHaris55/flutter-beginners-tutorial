import 'package:flutter/material.dart';
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
      home: const MyHomePage(
        title: 'Flutter demo app',
      ),
      // home: const SecondScreen(),
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
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    getSharedPrefVal();
  }

  getSharedPrefVal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('counter') ?? 0;
    setState(() {});
  }

  void updateValueInSharedPreference(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('previous value ==> ${prefs.getInt('counter')}');
    await prefs.setInt('counter', value);
    print('updated value ==> ${prefs.getInt('counter')}');
  }

  void _incrementCounter() {
    setState(() => _counter++);
    updateValueInSharedPreference(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 400,
                height: 200,
                color: Colors.red,
              ),
              Container(
                width: 200,
                height: 100,
                color: Colors.blue,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('You have pushed the button this many times:'),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.yellow,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
