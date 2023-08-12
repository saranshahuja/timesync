import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        bottomNavigationBar: BottomNavigationBar(

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black,),

              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,color: Colors.black,),
              label: 'Home',
            ),

          ],
        ));
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text(
      'Overview',
      style: TextStyle(color: Colors.black),
    ),
  );
}
