import 'package:flutter/material.dart';
import 'package:job_finder/application.dart';
import 'package:job_finder/bookmarks.dart';
import 'package:job_finder/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home>{
  int myIndex=0;

  final List<String> titles = [
    "Home",
    "Bookmarks",
    "Application",
    "My Account"
  ];

  final List<Widget> widgetOptions = const [
    Center(child: Text("Home Screen")),
    Bookmark(),
    Application(),
    Profile()
  ];

  void onItemTapped(int index){
     setState(() {
            myIndex=index;
          });
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
     appBar: AppBar(
        title:Text(
          titles[myIndex],
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Color(0xFF475BD8),
      ),
    body: widgetOptions[myIndex],
    bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Color(0xFF475BD8),
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
      currentIndex: myIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Bookmarks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_open_rounded),
          label: 'Application',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'My Account',
        ),
      ],
    ),
  );
}

}