import 'package:flutter/material.dart';
import 'package:foodi_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filter_screen';
  final Function setFilter;
  final Map<String, bool> currentFilter;
  FilterScreen(this.setFilter, this.currentFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _LactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _vegan = widget.currentFilter['vegan'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _LactoseFree = widget.currentFilter['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final filterData = {
                  'gluten': _glutenFree,
                  'lactose': _LactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.setFilter(filterData);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Adjust your filters here!',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                      'Gluten Free',
                      'Only Gluten free meals are selected',
                      _glutenFree, (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  }),
                  _buildSwitchListTile(
                      'Lactose Free',
                      'Only Lactose free meals are selected',
                      _LactoseFree, (value) {
                    setState(() {
                      _LactoseFree = value;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan', 'Only Vegan meals are selected', _vegan,
                      (value) {
                    setState(() {
                      _vegan = value;
                    });
                  }),
                  _buildSwitchListTile(
                      'vageterian',
                      'Only vageterian meals are selected',
                      _vegetarian, (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
