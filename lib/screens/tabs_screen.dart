import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/values/colors.dart';
import 'package:meal_app/values/strings.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

 final List<Map<String, Object>> _pages = [
   {
     'page': const CategoriesScreen(),
     'title': 'Categories',
   },
   {
     'page': const FavoritesScreen(),
     'title': 'Favorite',
   },
  ];

 int _selectedPageIndex = 0;

 void _selectPage(int index){
   setState((){
     _selectedPageIndex = index;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(_pages[_selectedPageIndex]['title'] as String),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: whiteColor,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
       //   type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: categoriesLabel,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: favoritesLabel,
            ),
          ],
    ),
    );
  }
}
