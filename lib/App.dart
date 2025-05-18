// app_screen.dart
import 'package:flutter/material.dart';
import 'Home.dart';
import 'camara.dart';
import 'history.dart';




class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0; // State variable to keep track of the selected tab

  // List of widgets to display for each tab
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CameraPage(), // This is where your "Camara" related UI will go
    HistoryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the state when an item is tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    // REMOVED Expanded from here. Scaffold is usually a top-level widget for a route.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Object Detection",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan.shade600, Colors.blue.shade800],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
      ),


      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _widgetOptions.elementAt(_selectedIndex),
            Text("bottom",style: TextStyle(color: Colors.amberAccent,fontSize: 20.0,fontWeight: FontWeight.bold)),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt), // Changed to camera_alt for better semantics
            label: "Camera", // Renamed for clarity
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
        ],
        currentIndex: _selectedIndex, // Current selected tab index
        selectedItemColor: Colors.blue.shade800, // Color for selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        onTap: _onItemTapped, // Callback when an item is tapped
      ),
    );
  }
}