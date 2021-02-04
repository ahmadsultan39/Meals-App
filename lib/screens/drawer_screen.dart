import 'package:flutter/material.dart';

import './settings_screen.dart';

class DrawerScreen extends StatelessWidget {
  Widget _buildListTile(String title, IconData icon, Function tapHandler) =>
      ListTile(
        leading: Icon(
          icon,
          size: 26,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed', fontSize: 24, color: Colors.white),
        ),
        onTap: tapHandler,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 150,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              ),
            ),
          ),
          _buildListTile('Home', Icons.restaurant_rounded, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          _buildListTile('Settings', Icons.settings_rounded, () {
            Navigator.of(context).pushReplacementNamed(SettingsScreen.namedRoute);
          }),
        ],
      ),
    );
  }
}
