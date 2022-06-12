import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/tabs_screen.dart';
import 'package:flutter_complete_guide/Screens/filter_screen.dart';

class custom_drawer extends StatelessWidget {
  Widget bulidListTiel(String s , IconData icon , Function f){
    return  ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        s,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'
        ),
      ),
      onTap:f,
    );

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.pink,
            child: Center(
              child: Text(
                'Cooking up',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          bulidListTiel('Resturant', Icons.restaurant , (){
            Navigator.of(context).pushReplacementNamed(tabs_screen.route_name);
          }),
          bulidListTiel('Filters', Icons.settings , (){
            Navigator.of(context).pushReplacementNamed(filter_screen.route_name);

          }),


        ],
      ),
    );
  }
}
