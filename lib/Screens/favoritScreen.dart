import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/Meals.dart';
import 'package:flutter_complete_guide/Widgets/meal_items.dart';

class favoritScreen extends StatefulWidget {
  final List<Meal> f;

  favoritScreen(this.f);

  @override
  State<favoritScreen> createState() => _favoritScreenState();
}

class _favoritScreenState extends State<favoritScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.f.isEmpty ){
      return Center(child: Text('you have not add favorite meals yet'),);
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, indx) {
          return meal_item(
            id: widget.f[indx].id,
            title: widget.f[indx].title,
            affordability: widget.f[indx].affordability,
            complexity: widget.f[indx].complexity,
            duration: widget.f[indx].duration,
            imageUrl: widget.f[indx].imageUrl,

          );
        },
        itemCount: widget.f.length,
      );

    }

  }
}
