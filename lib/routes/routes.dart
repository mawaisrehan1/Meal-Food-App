

import 'package:flutter/material.dart';
import 'package:meal_app/provider/filter_meal_provider.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';


 //BuildContext? context;

class Routes{



  static String tabsScreen = '/tabsScreen';
  static String categoriesScreen = "/categoriesScreen";
  static String favoritesScreen = '/favoritesScreen';
  static String categoryMealsScreen = '/categoryMealsScreen';
  static String mealsDetailScreen = '/mealsDetailScreen';
  static String filtersScreen = '/filtersScreen';

   static getRoutes(){
    return {
      tabsScreen:(context) => const TabsScreen(),
      categoriesScreen:(context) => const CategoriesScreen(),
      favoritesScreen:(context) => const FavoritesScreen(),
      categoryMealsScreen:(context) =>  CategoryMealScreen(),
      mealsDetailScreen:(context) =>  const MealDetailScreen(),
      filtersScreen:(context) =>   FiltersScreen(),
    };
  }

}




