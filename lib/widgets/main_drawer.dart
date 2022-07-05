import 'package:flutter/material.dart';
import 'package:meal_app/routes/routes.dart';
import 'package:meal_app/values/dimensions.dart';

import '../values/strings.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 1,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: textLarge,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          buildListTile(meals, Icons.restaurant,
                  (){
            Navigator.of(context).pushReplacementNamed(Routes.tabsScreen);
                  }),
          buildListTile(filters, Icons.settings,
                  (){
            Navigator.of(context).pushReplacementNamed(Routes.filtersScreen);
                  }),
        ],
      ),
    );
  }

  //Custom buildListTile!
  Widget buildListTile(String title, IconData icon, Function() tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: textLarge,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: textLarge,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  } //Custom buildListTile widget end here!
}
