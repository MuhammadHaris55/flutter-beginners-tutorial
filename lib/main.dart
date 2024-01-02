import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/common/submit_button.dart';
import 'package:myapp/routing/app_router.dart';
import 'package:myapp/second_screen.dart';

import 'common/heading.dart';

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
      // backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const Icon(Icons.arrow_back_ios_new_sharp),
        actions: const [
          Icon(Icons.notifications),
          Icon(Icons.menu),
        ],
        centerTitle: true,
        title: Text(
          widget.title ?? 'Todo App',
        ),
        // flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.fitWidth,
        //     image: AssetImage('assets/images/profile-picture.png'),
        //   ),
        // )),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        width: size.width - 20,
        height: size.height - 20,
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Heading(text: 'Heading'),
              const SizedBox(height: 30),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.go,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.forward_sharp),
                ),
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
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text('Add Task'),
              ),
              // OutlinedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const SecondScreen()),
              //     );
              //   },
              //   child: const Text('update'),
              // ),
              SubmitButton(
                  text: 'update',
                  onpressHandler: () {
                    print('working');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondScreen(),
                      ),
                    );
                  }),
              Heading(text: 'Spacer'),
              SubmitButton(
                text: 'edit',
                onpressHandler: () {},
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
