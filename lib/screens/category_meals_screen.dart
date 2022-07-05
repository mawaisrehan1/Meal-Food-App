import 'package:flutter/material.dart';
import 'package:meal_app/provider/filter_meal_provider.dart';
import 'package:meal_app/widgets/meal_item.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../model/meal/meal.dart';

class CategoryMealScreen extends StatefulWidget {

//  final List<Meal> availableMeals;
  const CategoryMealScreen({Key? key,}) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;
  @override

  void didChangeDependencies() {
    if(!_loadedInitData){

      FilterMealProvider mealProvider = Provider.of<FilterMealProvider>(NavigationService.navigatorKey.currentContext as BuildContext);

      final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['categoryId'];
      categoryTitle = routeArgs['categoryTitle'];
      displayedMeals = mealProvider.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true; 
    }

    super.didChangeDependencies();
  }



  void _removeMeal(String mealId){
    setState((){
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
          itemCount: displayedMeals?.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id:  displayedMeals![index].id,
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              duration: displayedMeals![index].duration,
              complexity: displayedMeals![index].complexity,
              affordability: displayedMeals![index].affordability,
              removeItem: _removeMeal,
            );
          }),
    );
  }
}
