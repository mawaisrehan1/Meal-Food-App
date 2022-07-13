import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favorite_meal_provider.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    FavoriteMealProvider favoriteMealProvider =
    Provider.of<FavoriteMealProvider>(
        context, listen: true);
    if(favoriteMealProvider.favoriteMeals.isEmpty) {
      return  const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else
    {
      return Consumer<FavoriteMealProvider>(
        builder: (_, a, __) {
          return ListView.builder(
              itemCount: favoriteMealProvider.favoriteMeals.length,
              itemBuilder: (ctx, index) {
                return MealItem(
                  id:  favoriteMealProvider.favoriteMeals[index].id,
                  title: favoriteMealProvider.favoriteMeals[index].title,
                  imageUrl: favoriteMealProvider.favoriteMeals[index].imageUrl,
                  duration: favoriteMealProvider.favoriteMeals[index].duration,
                  complexity: favoriteMealProvider.favoriteMeals[index].complexity,
                  affordability: favoriteMealProvider.favoriteMeals[index].affordability,
                );
              });
        },

      );
    }
  }
}

