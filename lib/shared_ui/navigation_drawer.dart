import 'package:flutter/material.dart';
import 'package:news_app/models/nav_menu.dart';
import 'package:news_app/screens/facebook_feeds.dart';
import 'package:news_app/screens/headline_news.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/instagram_feeds.dart';
import 'package:news_app/screens/tweeter_feeds.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem> _navigationMenu = [
    NavMenuItem('Explore', () => HomeScreen()),
    NavMenuItem('Headline news', () => HeadLineNews()),
    NavMenuItem('tweeter feed', () => TweeterFeeds()),
    NavMenuItem('Instagram feed' , () => InstagramFeed()),
    NavMenuItem('Facebook feeds' , () => FacebookFeeds()),
  ];
 /*
 List<String> navMenu = [
    'Explore',
    'Headline news',
    'Read later',
    'Videos',
    'Photos',
    'Settings',
    'Logout'
  ];
  */

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 52, left: 8),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  _navigationMenu[position].title,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {

                        return _navigationMenu[position].destination();
                      },
                    ),
                  );
                },
              ),
            );
          },
          itemCount: _navigationMenu.length,
        ),
      ),
    );
  }
}
