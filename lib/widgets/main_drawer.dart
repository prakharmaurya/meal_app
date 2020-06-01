import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({IconData icon, String title, Function trigger}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: trigger,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          buildListTile(
            icon: Icons.restaurant,
            title: 'Melas',
            trigger: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          buildListTile(
            icon: Icons.settings,
            title: 'Filters',
            trigger: () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
