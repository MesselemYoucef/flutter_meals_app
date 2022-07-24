import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filter_screen.dart';
import './models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

//     isGlutenFree: false,
//     isVegan: true,
//     isVegetarian: true,
//     isLactoseFree: true,

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodySmall: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyLarge: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleSmall:
                const TextStyle(fontSize: 12.0, fontFamily: 'RobotoCondensed'),
            titleMedium: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold),
            titleLarge:
                const TextStyle(fontSize: 36.0, fontFamily: 'RobotoCondensed')),
      ),
      // home: ,
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(saveFilters: _setFilters, currentFilter: _filters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: ((context) => CategoriesScreen()));
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: ((context) => const CategoriesScreen()));
      },
    );
  }
}
