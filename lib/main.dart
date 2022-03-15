import 'package:flutter/material.dart';
import 'package:team_matching/models/filter.dart';
import 'package:team_matching/screens/project_detail_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';

import 'screens/category_meals_screen.dart';
import 'screens/tabs_screen.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FilterObject _filterObject = FilterObject(
    status: "",
    filter: Filter(""),
  );

  void _setFilters(FilterObject filterData) {
    setState(() {
      _filterObject = filterData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Matching App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.pink,
              secondary: Colors.amber,
            ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                  fontSize: 20, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        TabsScreen.routeName: (ctx) => TabsScreen(),
        ProjectDetailScreen.routeName: (ctx) => const ProjectDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              saveFilters: _setFilters,
              filterObject: _filterObject,
            )
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const CategoriesScreen());
      },
    );
  }
}
