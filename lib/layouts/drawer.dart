import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_hub/Providers/authenticated_user.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Consumer<UserProvider>(builder: (context, value, child) {
      if (value.user == null) {
        return Container(
            alignment: Alignment.center,
            child: const Text('Please Sign in for amazing experience'));
      }
      return Column(
        children: [
          DrawerHeader(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage({value.user!.photoURL}.toString()),
                      radius: 45,
                    ),
                    Text('${value.user!.displayName}'),
                  ],
                )),
          ),
          const ListTile(leading: Icon(Icons.person), title: Text('Profile')),
          const ListTile(
              leading: Icon(Icons.notifications), title: Text('Notifications')),
          const ListTile(leading: Icon(Icons.message), title: Text('Messages')),
          const ListTile(
              leading: Icon(Icons.bookmark), title: Text('Bookmarks')),
          const ListTile(leading: Icon(Icons.logout), title: Text('Logout')),
        ],
      );
    }));
  }
}
