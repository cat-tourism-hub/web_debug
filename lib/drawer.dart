import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/100x100.png?text=Profile Image'),
                    radius: 45,
                  ),
                  Text('Welcome username'),
                ],
              ),
            ),
          ),
          ListTile(leading: Icon(Icons.person), title: Text('Profile')),
          ListTile(
              leading: Icon(Icons.notifications), title: Text('Notifications')),
          ListTile(leading: Icon(Icons.message), title: Text('Messages')),
          ListTile(leading: Icon(Icons.bookmark), title: Text('Bookmarks')),
          ListTile(leading: Icon(Icons.logout), title: Text('Logout')),
        ],
      ),
    );
  }
}
