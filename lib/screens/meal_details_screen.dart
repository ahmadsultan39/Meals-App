import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const namedRoute = '/meal-details';
  final Function _selevtFav;
  final Function _isFav;

  MealDetailsScreen(this._selevtFav, this._isFav);
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    final mediaquery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text(meal.title),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: (mediaquery.size.height -
                      appBar.preferredSize.height -
                      mediaquery.padding.top) *
                  0.6,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Text(
                  'Ingredients :',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white, fontSize: 22),
                )),
            Container(
              height: (mediaquery.size.height -
                      appBar.preferredSize.height -
                      mediaquery.padding.top) *
                  0.2,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      meal.ingredients[index],
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Text(
                  'Steps :',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white, fontSize: 22),
                )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              height: (mediaquery.size.height -
                      appBar.preferredSize.height -
                      mediaquery.padding.top) *
                  0.2,
              width: double.infinity,
              child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${index + 1}'),
                            ),
                            title: Text(meal.steps[index]),
                          ),
                          const Divider()
                        ],
                      ),
                  itemCount: meal.steps.length),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: _isFav(meal.id)
            ? const Icon(Icons.star_rounded)
            : const Icon(Icons.star_outline_rounded),
        onPressed: () => _selevtFav(meal.id),
      ),
    );
  }
}
