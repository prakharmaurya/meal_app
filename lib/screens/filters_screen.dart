import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function _setFilters;
  final Map<String, bool> _currentFilters;

  FiltersScreen(this._currentFilters, this._setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluteenFree = false;
  bool _vegetarian = false;
  bool _vegen = false;
  bool _lactoseFree = false;

  initState() {
    _gluteenFree = widget._currentFilters['gluten'];
    _vegetarian = widget._currentFilters['vegetarian'];
    _vegen = widget._currentFilters['vegen'];
    _lactoseFree = widget._currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String desc,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(desc),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          FlatButton(
            onPressed: () => {
              widget._setFilters({
                'gluten': _gluteenFree,
                'lactose': _lactoseFree,
                'vegen': _vegen,
                'vegetarian': _vegetarian,
              }),
              Navigator.of(context).pushReplacementNamed('/')
            },
            child: Icon(
              Icons.done_all,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Mela Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluteen-free',
                  'Only includes gluteen free meals',
                  _gluteenFree,
                  (newVal) {
                    setState(
                      () {
                        _gluteenFree = newVal;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only includes Lactose free meals',
                  _lactoseFree,
                  (newVal) {
                    setState(
                      () {
                        _lactoseFree = newVal;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only includes Vegetarian meals',
                  _vegetarian,
                  (newVal) {
                    setState(
                      () {
                        _vegetarian = newVal;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vgen',
                  'Only includes vgen meals',
                  _vegen,
                  (newVal) {
                    setState(
                      () {
                        _vegen = newVal;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
