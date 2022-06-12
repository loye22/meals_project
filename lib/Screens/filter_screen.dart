import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Widgets/custom_drawer.dart';

class filter_screen extends StatefulWidget {
  static const route_name = '/filter_screen';
  final Function saveFilter ;
  final Map<String,bool> _filter ;
  filter_screen(this.saveFilter , this._filter);

  @override
  State<filter_screen> createState() => _filter_screenState();
}

class _filter_screenState extends State<filter_screen> {

  bool _glutenFree =false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactroseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget._filter['gluten'];
    _vegetarian = widget._filter['vegetarian'];
    _vegan = widget._filter['vegan'];
    _lactroseFree = widget._filter['lactose'];
    super.initState();
  }



  Widget _buildSwitchListTile(
      String s, String subtitle, bool value, Function f) {
    return SwitchListTile(
      value: value,
      title: Text(s),
      subtitle: Text(subtitle),
      onChanged: f,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Map<String, bool> _filter = {
            'gluten': _glutenFree,
            'lactose': _lactroseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
          };
          widget.saveFilter(_filter);

        }, icon: Icon(Icons.save))],
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              'Adjust your meal',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('gluten free',
                    'Only include gluten free meals', _glutenFree, (x) {
                  setState(() {
                    _glutenFree = x ;
                  });
                    }),
                _buildSwitchListTile('Lactrose Free free',
                    'Only include lactrose free meals', _lactroseFree, (x) {
                      setState(() {
                        _lactroseFree = x ;
                      });
                    }),
                _buildSwitchListTile('Vegan',
                    'Only include vegan meals', _vegan, (x) {
                      setState(() {
                        _vegan = x ;
                      });
                    }),
                _buildSwitchListTile('vegetarian ',
                    'Only include vegetarian meals ', _vegetarian, (x) {
                      setState(() {
                        _vegetarian = x ;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
      drawer: custom_drawer(),
    );
  }
}
