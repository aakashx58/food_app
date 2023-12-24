enum Complexity { simple, challenging, hard }

enum Affordability { affordable, pricey, luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String imageUrl;
  final String title;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final bool isGlutenFree;
  final Affordability affordability;
  final bool isLactoseFree;
  final bool isVegan;
  final bool  isVegetarian;

  const Meal(
     {
    required this.title,
    required this.id,
    required this.affordability,
    required this.categories,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isGlutenFree,
    required this. isVegetarian,
  });
}
