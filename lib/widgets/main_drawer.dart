import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({IconData icon, String title}) {
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
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Favourite',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          Divider(),
          buildListTile(icon: Icons.restaurant, title: 'Melas'),
          buildListTile(icon: Icons.settings, title: 'Settings'),
        ],
      ),
    );
  }
}
