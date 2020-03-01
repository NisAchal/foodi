import 'package:flutter/material.dart';
import 'package:foodi_app/screens/bottom_bar.dart';
import 'package:foodi_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
//            Container(
//              height: 200,
//              width: double.infinity,
//              color: Theme.of(context).primaryColor,
//              child: Center(
//                child: Text(
//                  'Welcome, Foodies!',
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 32,
//                      fontFamily: 'Roboto',
//                      fontWeight: FontWeight.bold),
//                ),
//              ),
//            ),
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars1.githubusercontent.com/u/49970504?s=460&v=4'),
            ),
            accountName: Text('Nischal Tiwari'),
            accountEmail: Text('nikks068@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('Meals'),
            onTap: () {
              Navigator.pushNamed(context, BottomBarScreen.routeName);
            },
          ),
          Divider(
            thickness: 3,
          ),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Filter'),
              onTap: () {
                Navigator.pushReplacementNamed(context, FilterScreen.routeName);
              }),
        ],
      ),
    );
  }
}
