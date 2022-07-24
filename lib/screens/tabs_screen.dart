import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;
  const TabsScreen({Key? key, required this.favoritedMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>>? _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      {"title": "Meals", "page": const CategoriesScreen()},
      {"title": "Favorites", "page": FavoritesScreen(widget.favoritedMeals)}
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]["title"]),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      drawer: const MainDrawer(),
      body: _pages![_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );

    // in case you want to have a tab on the top of the page
    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    //   child: Scaffold(
    //       appBar: AppBar(
    //         title: const Text(
    //           "Meals",
    //           textAlign: TextAlign.right,
    //         ),
    //         bottom: const TabBar(
    //           tabs: [
    //             Tab(
    //               icon: Icon(Icons.category),
    //               text: 'Category',
    //             ),
    //             Tab(
    //               icon: Icon(Icons.star),
    //               text: 'Favorites',
    //             ),
    //           ],
    //         ),
    //       ),
    //       body: const TabBarView(
    //         children: [
    //           CategoriesScreen(),
    //           FavoritesScreen(),
    //         ],
    //       )),
    // );
  }
}
