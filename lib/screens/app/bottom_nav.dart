import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mapendo/screens/app/home.dart';

class BottomNavClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _bottomNavClass();
  }
}

class _bottomNavClass extends State<BottomNavClass> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [HomePage(), HomePage(), HomePage()];

// #E0E4E5
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        backgroundColor: const Color(0xffE0E4E5),
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
                Icons.home), // Use the desired icon from Flutter's icon library
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Offers',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment')
        ],
      ),
    );
  }
}
