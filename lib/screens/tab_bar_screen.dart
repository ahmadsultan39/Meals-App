import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourites_screen.dart';
import './drawer_screen.dart';
import '../models/meal.dart';

class TabBarScreen extends StatefulWidget {
  final List<Meal> fav;

  TabBarScreen(this.fav);
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  List<Map<String, Object>> tabs;
  @override
  void initState() {
    tabs = [
      {'tab': CategoriesScreen(), 'title': 'Categories'},
      {'tab': FavouritesScreen(widget.fav), 'title': 'Favourites'},
    ];
    super.initState();
  }

  int _selectedIndex = 0;
  void _selectCat(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
// DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//               title: Text('Meals'),
//               bottom: TabBar(tabs: [
//                 Tab(icon: Icon(Icons.category),text: 'Categories',),
//                 Tab(icon: Icon(Icons.star),text: 'Favorites',),
//               ])),
//               body: TabBarView(children: [
//                 CategoriesScreen(),
//                 FavouritesScreen()
//               ]),
//         ))
    return Scaffold(
      appBar: AppBar(
        title: Text(tabs[_selectedIndex]['title']),
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      body: tabs[_selectedIndex]['tab'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_rounded), label: 'Favourites'),
        ],
        onTap: _selectCat,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
