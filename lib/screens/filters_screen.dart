import 'package:flutter/material.dart';
import 'package:meal_app/values/dimensions.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../provider/filter_meal_provider.dart';
import '../values/strings.dart';

class FiltersScreen extends StatefulWidget {
 // final Function() saveFilters;
  const FiltersScreen({Key? key,}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {



  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = filterMealProvider.filters['gluten'] as bool;
    _lactoseFree = filterMealProvider.filters['lactose'] as bool;
    _vegan = filterMealProvider.filters['vegan'] as bool;
    _vegetarian = filterMealProvider.filters['vegetarian'] as bool;
    super.initState();
  }


  FilterMealProvider filterMealProvider = Provider.of<FilterMealProvider>(NavigationService.navigatorKey.currentContext as BuildContext);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){
               final selectedFilters = {
                  'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
               filterMealProvider.getFilters(selectedFilters);
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                adjustYourMealSelection,
                style: TextStyle(
                  fontSize: textLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    glutenFree, onlyIncludeGlutenFreeMeals, _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    lactoseFree, onlyIncludeLactoseFreeMeals, _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    vegetarian, onlyIncludeVegetarianMeals, _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(vegan, onlyIncludeVeganMeals, _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }

  //Custom widget _buildSwitchListTile!
  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      subtitle: Text(
        description,
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  } // end here!

}
