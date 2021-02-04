import '../screens/meal_details_screen.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;


  MealItem(this.meal);

  void _ontap(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.namedRoute, arguments: meal)
        .then((value) {
    //  if (value != null) hideItem(value);
    });
  }

  String get complexity {
    if (meal.complexity == Complexity.Simple) {
      return 'Eazy';
    } else if (meal.complexity == Complexity.Challenging) {
      return 'Mid';
    } else if (meal.complexity == Complexity.Hard) {
      return 'Hard';
    } else
      return 'Not Known';
  }

  String get affordability {
    if (meal.affordability == Affordability.Affordable) {
      return 'cheap';
    } else if (meal.affordability == Affordability.Pricey) {
      return 'Mid';
    } else if (meal.affordability == Affordability.Luxurious) {
      return 'Expensive';
    } else
      return 'Not Known';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _ontap(context),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 250,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        meal.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(complexity)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(affordability)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
