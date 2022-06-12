

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/category_meals_screen.dart';
import 'package:flutter_complete_guide/Screens/meal_details_screen.dart';
import 'package:flutter_complete_guide/models/Meals.dart';
import 'Screens/categories_screen.dart';
import 'package:flutter_complete_guide/Screens/eroor_404.dart';
import 'package:flutter_complete_guide/Screens/tabs_screen.dart';
import 'package:flutter_complete_guide/Screens/filter_screen.dart';
import 'package:flutter_complete_guide/models/Meals.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favorite = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _availableMeals = DUMMY_MEALS.where((e) {
        if (_filter['gluten'] && !e.isGlutenFree) {
          return false;
        }
        if (_filter['lactose'] && !e.isLactoseFree) {
          return false;
        }
        if (_filter['vegan'] && !e.isVegan) {
          return false;
        }
        if (_filter['vegetarian'] && !e.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final exustingIndex = _favorite.indexWhere((e) => e.id == mealId);
    if (exustingIndex >= 0) {
      setState(() {
        _favorite.removeAt(exustingIndex);
      });
    } else {
      setState(() {
        _favorite.add(DUMMY_MEALS.firstWhere((e) => e.id == mealId));
      });
    }
  }

  bool _isFavorite(String mealId ){
    return _favorite.any((element) => element.id == mealId );


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => tabs_screen(_favorite),
        CategoryMealsScreen.route_name: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        mealDetatailScreen.route_name: (ctx) => mealDetatailScreen(_toggleFavorite ,_isFavorite),
        tabs_screen.route_name: (ctx) => tabs_screen(_favorite),
        filter_screen.route_name: (ctx) => filter_screen(_setFilters, _filter)
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => error_page());
      },
    );
  }
}
