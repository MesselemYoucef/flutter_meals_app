import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryID;
  // final String cateogryTitle;
  // const CategoryMealsScreen({Key? key, required this.categoryID, required this.cateogryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: const Center(
        child: Text("the Recepeis for the category"),
      ),
    );
  }
}
