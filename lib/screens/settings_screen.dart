import 'package:flutter/material.dart';
import './drawer_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const namedRoute = '/settings';

  final Function saveSettings;
  final Map<String, bool> loadSettings;

  SettingsScreen(this.saveSettings, this.loadSettings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutenfree = widget.loadSettings['gluten'];
    _lactosefree = widget.loadSettings['lactose'];
    _vegetarian = widget.loadSettings['vegetarian'];
    _vegan = widget.loadSettings['vegan'];

    super.initState();
  }

  Widget _buildSwitch(
      String title, String subtitle, bool value, Function change) {
    return SwitchListTile.adaptive(
      activeColor: Theme.of(context).primaryColor,
      value: value,
      onChanged: change,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.save_rounded,
              ),
              onPressed: () {
              Map<String,bool> settings = {
                    'gluten': _glutenfree,
                    'lactos': _lactosefree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
              widget.saveSettings(settings);
              }) 
        ],
      ),
      drawer: DrawerScreen(),
      body: Container(
        color: Theme.of(context).accentColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Filter your meals',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 26, color: Colors.white),
              ),
            ),
            _buildSwitch('Gluten-free', 'Show gluten-free meals', _glutenfree,
                (value) {
              setState(() {
                _glutenfree = value;
              });
            }),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            _buildSwitch('Locus-free', 'Show locus-free meals', _lactosefree,
                (value) {
              setState(() {
                _lactosefree = value;
              });
            }),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            _buildSwitch('vegetarian', 'Show vegetarian meals', _vegetarian,
                (value) {
              setState(() {
                _vegetarian = value;
              });
            }),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            _buildSwitch('vegan', 'Show vegan meals', _vegan, (value) {
              setState(() {
                _vegan = value;
              });
            }),
          ],
        ),
      ),
    );
  }
}
