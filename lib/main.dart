import './dummy_data.dart';
import 'package:flutter/material.dart';

import './screens/tab_bar_screen.dart';
import './screens/category_meals.dart';
import './screens/meal_details_screen.dart';
import './screens/settings_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> settings = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> meals = DUMMY_MEALS;
  List<Meal> _fav = [];

  void _seveSettings(Map<String, bool> filters) {
    setState(() {
      settings = filters;
      meals = DUMMY_MEALS.where((element) {
        if ((!element.isGlutenFree && settings['gluten']) ||
            (!element.isLactoseFree && settings['lactose']) ||
            (!element.isVegan && settings['vegan']) ||
            (!element.isVegetarian && settings['vegetarian'])) return false;
        return true;
      }).toList();
    });
  }

  void _selevtFav(String mealId) {
    final index = _fav.indexWhere((element) => element.id == mealId);
    if (index >= 0)
      setState(() {
        _fav.removeAt(index);
      });
    else
      setState(() {
        _fav.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
  }

  bool _isFav(String mealId)
  {
    return _fav.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Color.fromRGBO(40, 40, 40, 1),
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              //  bodyText1: TextStyle(),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (ctx) => TabBarScreen(_fav),
        CategoryMealsScreen.namedRoute: (ctx) => CategoryMealsScreen(meals),
        MealDetailsScreen.namedRoute: (ctx) => MealDetailsScreen(_selevtFav,_isFav),
        SettingsScreen.namedRoute: (ctx) =>
            SettingsScreen(_seveSettings, settings),
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen()); //not found route screen
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (ctx) =>
                CategoryMealsScreen(meals)); //last fall 404 not found
      },
    );
  }
}
