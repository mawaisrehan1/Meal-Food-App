import 'package:flutter/material.dart';
import 'package:meal_app/model/meal/meal_data.dart';
import 'package:meal_app/values/colors.dart';
import 'package:meal_app/values/dimensions.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../provider/favorite_meal_provider.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteMealProvider favoriteMealProvider =
        Provider.of<FavoriteMealProvider>(
            NavigationService.navigatorKey.currentContext as BuildContext, listen: false);

    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    final appbar = AppBar(
      title: Text(selectedMeal.title),
      centerTitle: true,
    );

    final height = (MediaQuery.of(context).size.height -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: (height - appbar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.5,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildContainer(
              context,
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 05),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            buildSectionTitle('Steps'),
            buildContainer(
              context,
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider()
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          favoriteMealProvider.toggleFavorite(mealId);

        },
        child: Consumer<FavoriteMealProvider>(
          builder: (_, a, __) {
            return  Icon(
              favoriteMealProvider.isMealFavorite(mealId) ? Icons.star : Icons.star_border,
            );
          },
        ),


      ),
    );
  }

  //Custom widget for title!
  Widget buildSectionTitle(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: textLarge,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  } // buildSectionTitle widget end here!

  Widget buildContainer(BuildContext context, Widget child) {
    final height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      width: width * 0.5,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: greyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
