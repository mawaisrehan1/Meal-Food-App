import 'package:flutter/material.dart';
import 'package:meal_app/routes/routes.dart';
import 'package:meal_app/values/colors.dart';
import 'package:meal_app/values/strings.dart';

import '../model/meal/meal.dart';
import '../values/dimensions.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key? key,
        required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      })
      : super(key: key);

  //selectMeal method for navigation!
  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      Routes.mealsDetailScreen,
      arguments: id,
    ).then((result){
      if(result !=null){
     //   removeItem(result);
      }
    });
  }



  // getter for complexityText!
  String get complexityText{
    switch (complexity) {
      case Complexity.simple:
        return simple;
        break;
      case Complexity.challenging:
        return challenging;
        break;
      case Complexity.hard:
        return hard;
        break;
        default:
          return unknown;
    }
  }


  // getter for affordabilityText!
  String get affordabilityText{
    switch (affordability) {
      case Affordability.affordable:
        return affordable;
        break;
      case Affordability.pricey:
        return pricey;
        break;
      case Affordability.luxurious:
        return expansive;
        break;
      default:
        return unknown;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context /*here we pass build method context */ ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    color: mealTitleColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                        title,
                    style: const TextStyle(
                      fontSize: textLarge,
                      color: whiteColor,
                    ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text('$duration mint'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(complexityText),
                    ],
                  ), Row(
                    children: [
                      const Icon(Icons.attach_money),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
