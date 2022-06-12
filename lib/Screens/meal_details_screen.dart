import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class mealDetatailScreen extends StatelessWidget {
  static const route_name = '/mealDetatailScreen';
  final Function addToFavorits;
  final Function isFavoreit ;
  mealDetatailScreen(this.addToFavorits , this.isFavoreit);

  Widget section_title_builder(BuildContext context, String t) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        t,
        style: Theme
            .of(context)
            .textTheme
            .titleLarge,
      ),
    );
  }

  Widget container_builder(Widget child) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute
        .of(context)
        .settings
        .arguments;
    final selected_meal = DUMMY_MEALS.firstWhere((e) => e.id == arg);

    return Scaffold(
      appBar: AppBar(
        title: Text(selected_meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    selected_meal.imageUrl,
                  )),
            ),
            section_title_builder(context, 'ingredients'),
            container_builder(
              ListView.builder(
                itemBuilder: (ctx, indx) =>
                    Card(
                      color: Theme
                          .of(context)
                          .accentColor,
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(selected_meal.ingredients[indx]),
                          )),
                    ),
                itemCount: selected_meal.ingredients.length,
              ),
            ),
            section_title_builder(context, 'Steps'),
            container_builder(
              ListView.builder(
                itemBuilder: (ctx, indx) =>
                    Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Text('${indx + 1}'),),
                          title: Text(selected_meal.steps[indx]),
                        ),
                        Divider()
                      ],
                    ),
                itemCount: selected_meal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(
            isFavoreit(arg) ? Icons.favorite : Icons.favorite_border

        ),
        onPressed: (){


          addToFavorits(arg);

        },
      ),);
  }
}
