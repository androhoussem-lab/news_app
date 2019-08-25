import 'package:flutter/material.dart';
import 'package:news_app/api/othors_api.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'home_tabs/favourites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whats_new.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopupMenu { SETTING, HELP, ABOUT, CONTACT }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //for get the states of screen with 60 fps
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: 0); //this = SingleTickerProviderStateMixin
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthorsApi api = AuthorsApi();
    api.fetchAllAuthors();
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          _popOutMenu(context),
        ],
        bottom: TabBar(
          tabs: [
            Tab(
              text: "WHAT'S NEW",
            ),
            Tab(
              text: "POPULARE",
            ),
            Tab(
              text: "FAVORITS",
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [
            WhatsNew(),
            Popular(),
            Favourites(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopupMenu>( //PopupMenu = enum class contain the menu items
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: PopupMenu.SETTING,
            child: Text('SETTING'),
          ),
          PopupMenuItem(
            value: PopupMenu.HELP,
            child: Text('HELP'),
          ),
          PopupMenuItem(
            value: PopupMenu.ABOUT,
            child: Text('ABOUT'),
          ),
          PopupMenuItem(value: PopupMenu.CONTACT, child: Text('CONTACT')),
        ];
      },
      onSelected: (PopupMenu popUpMenu) {},
      icon: Icon(Icons.more_vert),
    );
  }
}
