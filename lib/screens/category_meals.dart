import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../models/Category.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const namedRoute = '/category-meals';

  final List<Meal> meals;

  CategoryMealsScreen(this.meals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  bool init = false;
  Category category;
  List<Meal> meals;

  void _hideItem(String id) {
    setState(() {
      meals.removeWhere((element) => element.id == id);
    });
  }

  @override
  void didChangeDependencies() {
    if (!init) {
      category = ModalRoute.of(context).settings.arguments;
      meals = widget.meals
          .where((element) => element.categories.contains(category.id))
          .toList();
      init = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meals[index]);
        },
        itemCount: meals.length,
      ),
    );
  }
}
