import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onTogglefavorite});

  final Meal meal;
  final void Function(Meal meal) onTogglefavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                onTogglefavorite(meal);
              },
              icon: Icon(Icons.star)),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(meal.imageUrl),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Ingredients :',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            padding: EdgeInsets.only(left: 30,top: 5),
            shrinkWrap: true,
            itemCount: meal.ingredients.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.ingredients[index],
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(

            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "Steps :",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                  fontSize: 26),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.only(left: 30,top: 5),
            itemCount: meal.steps.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.steps[index],
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
