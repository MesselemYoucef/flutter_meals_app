import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail-screen";

  final Function toggleFavorite;
  final Function isMealFavorite;
  const MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(((meal) => meal.id == mealID));
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ingredient", context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.amber,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle("Steps", context),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider()
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavorite(mealID);
        },
        child: Icon(
          isMealFavorite(mealID) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
