import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal,required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;


  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: (){
            onSelectMeal(meal);
          },
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200,
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                        SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.shopping_bag, label: complexityText),
                        SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.attach_money, label: affordabilityText),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
