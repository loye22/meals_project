

import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../Widgets/meal_items.dart';
import 'package:flutter_complete_guide/models/Meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route_name = '/category_mail_screen';
  final List<Meal> meals ;
  CategoryMealsScreen(this.meals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String title ;
  List<Meal> meals_desplay ;
  var _loadedInitData = false;
 @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
  if(!_loadedInitData){
    final arg =  ModalRoute.of(context).settings.arguments as Map<String, String>;
    title = arg['title'];
    meals_desplay = widget.meals.where((e) {
      return e.categories.contains(arg['id']);
    }).toList();
    _loadedInitData = true ;

  }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      meals_desplay.removeWhere((e) => e.id == mealId);


    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, indx) {
            return meal_item(
              id: meals_desplay[indx].id,
              title: meals_desplay[indx].title,
              affordability: meals_desplay[indx].affordability,
              complexity: meals_desplay[indx].complexity,
              duration: meals_desplay[indx].duration,
              imageUrl: meals_desplay[indx].imageUrl,

            );
          },
          itemCount: meals_desplay.length,
        ));
  }
}
