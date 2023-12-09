import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  TextEditingController nameController =
      // TextEditingController(text: 'my profile');
      TextEditingController();

  List studentList = [
    // 'first', 'second', 'third',
    //  'forth', 'fifth', 'sixth'
  ];
  List colorsList = [
    Colors.amber,
    Colors.green,
    Colors.purpleAccent,
    Colors.amber,
    Colors.green,
    Colors.purpleAccent,
    Colors.purpleAccent,
    Colors.amber,
    Colors.green,
    Colors.purpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title ?? 'Todo App',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        width: size.width - 20,
        height: size.height - 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Your Name'),
            ),
            ElevatedButton(
                onPressed: () {
                  print('my controller value === ${nameController.text}');
                  if (nameController.text.isNotEmpty) {
                    setState(() {
                      studentList.add(nameController.text);
                      nameController.clear();
                    });
                  }
                },
                child: const Text('Add Task')),
            const SizedBox(height: 40),

            // // ----------------------------- Simple ListView -----------------------
            // Expanded(
            //   child: ListView(
            //     padding: const EdgeInsets.all(8),
            //     children: <Widget>[
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[600],
            //         child: const Center(child: Text('Entry A')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[500],
            //         child: const Center(child: Text('Entry B')),
            //       ),
            //       Container(
            //         height: 50,
            //         color: Colors.amber[100],
            //         child: const Center(child: Text('Entry C')),
            //       ),
            //     ],
            //   ),
            // ),

            // // ----------------------------- ListView.builder ----------------------
            // Expanded(
            //   child: ListView.builder(
            //     padding: const EdgeInsets.all(8),
            //     itemCount: studentList.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       var lastItem = index == studentList.length - 1;
            //       return Column(
            //         children: [
            //           Container(
            //             height: 50,
            //             color: colorsList[index],
            //             child: Center(
            //                 child: Text('Student Name ${studentList[index]}')),
            //           ),
            //           lastItem
            //               ? const SizedBox()
            //               : const Divider(
            //                   // height: 51,
            //                   thickness: 10,
            //                   color: Colors.black,
            //                   indent: 20,
            //                   endIndent: 20,
            //                 ),
            //         ],
            //       );
            //     },
            //   ),
            // ),

            // ----------------------------- ListView.seprated ----------------------
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: studentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: colorsList[index],
                    child: Center(child: Text('${studentList[index]}')),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  // height: 51,
                  thickness: 10,
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
