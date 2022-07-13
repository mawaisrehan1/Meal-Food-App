import 'package:flutter/material.dart';
import 'package:meal_app/model/meal/meal_data.dart';

import '../model/meal/meal.dart';

class FavoriteMealProvider extends ChangeNotifier{

  List<Meal> favoriteMeals = [];

   toggleFavorite(String mealId){
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      favoriteMeals.removeAt(existingIndex);
      print(favoriteMeals.length);
      notifyListeners();
    }
    else {
      favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      notifyListeners();
    }
  }

   isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
    notifyListeners();
  }

}