import 'package:flutter/material.dart';
import 'package:news_app/models/pageModel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List pages;
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);
  void _addPages() {
    pages = List<PageModel>();
    pages.add(PageModel(
        'assets/images/bg.png',
        'Welcome!',
        'Making freinds is easy as waving your hand back and forth in easy step',
        Icons.dvr));
    pages.add(PageModel('assets/images/bg02.png', '24/24-7/7',
        'Whats the news to day in last minute?', Icons.access_time));
    pages.add(PageModel('assets/images/bg03.png', 'Notification',
        'Beep Beep the news is comming', Icons.add_alert));
    pages.add(PageModel('assets/images/bg04.png', 'Share',
        'Share your interests with your freinds', Icons.share));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return Stack(
      children: <Widget>[
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                //because its containe 2 layer (for background & for Column)
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: ExactAssetImage(
                        pages[index].image,
                      ),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0, -80),
                          child: Icon(
                            pages[index].icon,
                            color: Colors.white,
                            size: 88,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            pages[index].title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            pages[index].description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
          ),
        ),
        Transform.translate(
          offset: Offset(0, 160),
          child: Align(
            alignment: Alignment.center,
            child: _displayPageIndicators(pages.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                color: Colors.red.shade800,
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1.5,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ));
                  _updateSeenState();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
  void _updateSeenState()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }

  Widget _displayPageIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
