import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar'),
            actions: [
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.red),
                label: Text(
                  "Search",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.settings, color: Colors.red),
                label: Text(
                  "Settings",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.favorite_border), text: 'Favorites'),
                Tab(icon: Icon(Icons.person), text: 'Profile'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Home')),
              Center(child: Text('Favorites')),
              Center(child: Text('Profile')),
            ],
          ),
        ),
      );
  }
}
