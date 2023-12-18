import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
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
    Colors.amber,
    Colors.green,
    Colors.purpleAccent,
  ];

  final _formKey = GlobalKey<FormState>();

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
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/profile-picture.png'),
          ),
        )),
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.go,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.number,
                // readOnly: true,
                // obscureText: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
                decoration: const InputDecoration(hintText: 'Your Name'),
                validator: (value) {
                  print(value);
                  if (value!.length != 5) {
                    return "length must be equal to 5";
                  }
                },
                textInputAction: TextInputAction.done,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('validating');
                  } else {
                    print('not validate');
                  }
                  // print('my controller value === ${nameController.text}');
                  // if (nameController.text.isNotEmpty) {
                  //   setState(() {
                  //     studentList.add(nameController.text);
                  //     nameController.clear();
                  //   });
                  // }
                },
                child: const Text('Add Task'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined button'),
              ),
              const SizedBox(height: 40),

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
      ),
    );
  }
}
