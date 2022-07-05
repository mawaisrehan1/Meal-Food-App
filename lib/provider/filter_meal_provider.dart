
import 'package:flutter/material.dart';
import 'package:meal_app/model/meal/meal_data.dart';

import '../model/meal/meal.dart';

class FilterMealProvider extends ChangeNotifier{


   Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

//  Map<String, bool> filter = filters;

  List<Meal>availableMeals = dummyMeals;


  void getFilters(Map<String, bool> filterData){
    filters = filterData;
    availableMeals = dummyMeals.where((meal) {
      if(filters['gluten'] == true && !meal.isGlutenFree){
        return false;
      }

      if(filters['lactose'] == true && !meal.isLactoseFree){
        return false;
      }

      if(filters['vegan'] == true && !meal.isVegan){
        return false;
      }

      if(filters['vegetarian'] == true && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();
      notifyListeners();

  }
}