import 'package:DeliMeaks/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilteresScreen extends StatefulWidget {
  static const routName = '/filteres-screen';
  final Map<String, bool> _filters;

  final Function saveFilters;

  FilteresScreen(this.saveFilters, this._filters);

  @override
  _FilteresScreenState createState() => _FilteresScreenState();
}

class _FilteresScreenState extends State<FilteresScreen> {
  bool _gluetenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String desctiption, bool currentValue, Function function) {
    return SwitchListTile.adaptive(
        title: Text(title),
        value: currentValue,
        subtitle: Text(desctiption),
        onChanged: function);
  }

  @override
  void initState() {
    _lactoseFree = widget._filters['lactose'];
    _gluetenFree = widget._filters['gluten'];
    _vegan = widget._filters['vegan'];
    _vegetarian = widget._filters['vegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filteres'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters({
                'gluten': _gluetenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten-free', 'Only include gluten-free meals', _gluetenFree,
                  (value) {
                setState(() {
                  _gluetenFree = value;
                });
              }),
              _buildSwitchListTile('Lactose-free',
                  'Only include Lactose-free meals', _lactoseFree, (value) {
                setState(() {
                  _lactoseFree = value;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include Vegetarian meals', _vegetarian,
                  (value) {
                setState(() {
                  _vegetarian = value;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only include Vegan meals', _vegan,
                  (value) {
                setState(() {
                  _vegan = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
