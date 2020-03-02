import 'package:flutter/material.dart';
import 'package:foodi_app/dummy_data.dart';
import 'package:foodi_app/models/meal.dart';
import 'package:foodi_app/screens/bottom_bar.dart';
import 'package:foodi_app/screens/category_meal_screen.dart';
import 'package:foodi_app/screens/category_overview_screen.dart';
import 'package:foodi_app/screens/filter_screen.dart';
import 'package:foodi_app/screens/meal_details_screen.dart';
//import 'package:foodi_app/screens/tab_view_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filter['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodi App',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(fontSize: 24, fontFamily: 'Roboto'),
            ),
      ),
      home: BottomBarScreen(),
      routes: {
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilter, _filter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryOverviewScreen());
      },
    );
  }
}
