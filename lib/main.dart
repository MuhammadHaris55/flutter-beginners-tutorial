import 'package:flutter/material.dart';
import 'package:myapp/second_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
          // title: 'Flutter demo app',
          ),
      // home: const SecondScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<int> studentList = [0, 1];

  void _incrementCounter() {
    print('btn press');
    setState(() {
      _counter++;
    });
  }

  TextEditingController nameController = TextEditingController();
  List myList = ['first', 'second', 'third'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print('print value ${nameController.text}');
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text(
          // widget.title != null ? widget.title! : 'my name',
          widget.title ?? 'my name',
        ),
      ),
      body: Container(
        // padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        width: size.width - 20,
        height: size.height - 20,
        // height: 200.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              // initialValue: 'profile pic',
              controller: nameController,
              decoration: InputDecoration(hintText: 'Your Name'),
            ),
            const SizedBox(height: 20),
            const Text('Profile Picture'),
            Image.asset('assets/images/profile-picture.png'),
            const SizedBox(height: 20),
            // // Image.asset('assets/images/profile.jpeg'),
            // // const SizedBox(height: 20),
            // Image.network(
            //     'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
            // Image.network('https://picsum.photos/250?image=9'),
            // // CircleAvatar(
            // //   backgroundImage: Image(image: ''),
            // // ),
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  // Image.asset('assets/images/profile-picture.png'),

                  // AssetImage('assets/images/profile-picture.png'),
                  NetworkImage('https://picsum.photos/250?image=9'),
            )
          ],
        ),
      ),

      // Center(
      //   child: Column(
      //     // mainAxisAlignment: MainAxisAlignment.center,
      //     // crossAxisAlignment: CrossAxisAlignment.end,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '${studentList[1]}',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //       ElevatedButton(
      //         // style: style,
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => const SecondScreen()),
      //           );
      //         },
      //         child: const Text('Enabled'),
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
