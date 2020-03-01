import 'package:flutter/material.dart';
import 'package:foodi_app/screens/favorites_screen.dart';

import 'category_overview_screen.dart';

class TabViewScreen extends StatefulWidget {
  @override
  _TabViewScreenState createState() => _TabViewScreenState();
}

class _TabViewScreenState extends State<TabViewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Foddi'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourites',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoryOverviewScreen(),
            FavouritesScreen(),
          ],
        ),
      ),
      length: 2,
      initialIndex: 0,
    );
  }
}
