import 'package:flutter/material.dart';

class AppCustomBottomNavigationBar extends StatefulWidget {
  const AppCustomBottomNavigationBar({super.key});

  @override
  State<AppCustomBottomNavigationBar> createState() =>
      _AppCustomBottomNavigationBarState();
}

class _AppCustomBottomNavigationBarState
    extends State<AppCustomBottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Bottom Navigation Bar")),
        drawer: Drawer(
          backgroundColor: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
            child: Column(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: const [
                    Text(
                      'Gesture',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_outlined,
                      size: 28,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: const [
                    Text(
                      'InkWell',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_outlined,
                      size: 28,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_outlined,
                    size: 28,
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ]),
          ),
        ),
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
