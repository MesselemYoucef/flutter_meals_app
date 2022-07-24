import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> availableMeals;

  const CategoryMealsScreen({required this.availableMeals});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedList;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedList = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedList?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          // return Text(categoryMeals[index].title);
          return MealItem(
            title: displayedList![index].title,
            imageUrl: displayedList![index].imageUrl,
            duration: displayedList![index].duration,
            complexity: displayedList![index].complexity,
            affordability: displayedList![index].affordability,
            id: displayedList![index].id,
          );
        },
        itemCount: displayedList?.length,
      ),
    );
  }
}
