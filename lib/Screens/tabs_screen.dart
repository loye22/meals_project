import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/categories_screen.dart';
import 'package:flutter_complete_guide/Screens/favoritScreen.dart';
import 'package:flutter_complete_guide/Widgets/custom_drawer.dart';
import 'package:flutter_complete_guide/models/Meals.dart';

class tabs_screen extends StatefulWidget {


  @override
  State<tabs_screen> createState() => _tabs_screenState();
  static const route_name = '/tabs_screen';
  final List<Meal> favorte ;

  tabs_screen(this.favorte);
}

class _tabs_screenState extends State<tabs_screen> {
  List<Map<String, dynamic>> _pages ;
  int _pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pages =  [
      {'page': CategoriesScreen(), 'title': ' Categories Screen'},
      {'page': favoritScreen(widget.favorte), 'title': 'favorit Screen'}
    ];
    super.initState();
  }

  void _selected_page(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_pageIndex]['title']),
        ),
        body: _pages[_pageIndex]['page'],
        drawer: custom_drawer(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selected_page,
          currentIndex: _pageIndex,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          selectedItemColor: Theme.of(context).accentColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                ),
                label: 'category'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'favorite')
          ],
        ),
      ),
    );
  }
}
