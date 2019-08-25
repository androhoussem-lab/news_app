import 'package:flutter/material.dart';
import 'package:news_app/screens/onboarding.dart';
import 'screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utilities/app_theme.dart';


main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();//SharedPreferences to save an small value like int string bool
  bool seen = prefs.getBool( 'seen' ); //get saved value named 'seen'
  Widget _screen;
  if( seen == null || seen == false ){
    _screen = OnBoarding();
  }else{
    _screen = HomeScreen();
  }
  runApp( NewsApp( _screen ) );
}

class NewsApp extends StatelessWidget {
  final Widget _screen;
  NewsApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.myAppTheme,
      home: this._screen,
    );
  }
}
