import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/FiltersSreen';

  final Function setFilters;
  final Map<String,bool> currentFilters;

  FiltersScreen(this.currentFilters , this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree ;
  bool _lactoseFree ;
  bool _vegeterian ;
  bool _vegan ;
  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegeterian = widget.currentFilters['vegeterian'];
    _vegan =  widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool value, Function onChanged) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegeterian': _vegeterian,
              };
              widget.setFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meals',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('Gluten-Free',
                    'Only include Gluten-free meals', _glutenFree, (val) {
                  setState(() {
                    _glutenFree = val;
                  });
                }),
                _buildSwitchListTile('Lactose-Free',
                    'Only include Lactose-free meals', _lactoseFree, (val) {
                  setState(() {
                    _lactoseFree = val;
                  });
                }),
                _buildSwitchListTile(
                    'Vegeterian', 'Only include Vegeterian meals', _vegeterian,
                    (val) {
                  setState(() {
                    _vegeterian = val;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include Vegan meals', _vegan, (val) {
                  setState(() {
                    _vegan = val;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
