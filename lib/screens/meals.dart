import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

import 'meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,required this.title,required this.meals,required this.onTogglefavorite });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onTogglefavorite;

  void selectMeal(BuildContext context,Meal meal){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MealDetailsScreen(meal: meal, onTogglefavorite:  onTogglefavorite)));
  }


  @override
  Widget build(BuildContext context){
    Widget content = ListView.builder(
      itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(meal: meals[index], onSelectMeal: (meal){
          selectMeal(context,  meal);
        }));

    if(meals.isEmpty)
      return Center(
        child: Text('UHhh Ohhh Nothig here!',style: TextStyle(color: Colors.white),),
      );

    if(title==null){
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!),),
      body: content,
    );
  }
}