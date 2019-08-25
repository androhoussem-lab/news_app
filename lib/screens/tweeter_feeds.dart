import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class TweeterFeeds extends StatefulWidget {
  @override
  _TweeterFeedsState createState() => _TweeterFeedsState();
}

class _TweeterFeedsState extends State<TweeterFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tweeter feeds'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder( padding: EdgeInsets.all(8), itemBuilder: (context, position) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
            child: Column(
              children: <Widget>[
                _drawCardHeader(),
                _drawCardBody(),
                 _drawDivider(),
                _drawCardFooter(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,),
    );
  }

  Widget _drawCardHeader() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 15,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Christina Meyers',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                SizedBox(
                  width: 4,
                ),
                Text('@ch_meyers',
                    style:
                        TextStyle(color: Colors.grey.shade400, fontSize: 14)),
              ],
            ),
            Text('Fry,12 Mai 2019 . 14:30',
                style: TextStyle(color: Colors.grey.shade400)),
          ],
        )
      ],
    );
  }

  Widget _drawCardBody() {
    return Padding(
      padding: EdgeInsets.only(top: 8 , left: 4 , right: 4),
      child: Text(
        'We also talk about the future of work as the robot adcance , and we ask whether a retro phone',
        style: TextStyle(fontSize: 14 , height: 1.5),
      ),
    );
  }

  Widget _drawCardFooter() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.repeat,
                  color: Colors.orange,
                ),
                onPressed: () {},
              ),
              Text('29' , style: TextStyle(color: Colors.grey.shade600),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'SHARE',
                    style: TextStyle(color: Colors.orange),
                  )),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'OPEN',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      margin: EdgeInsets.only(top: 18),
      height: 1,
      color: Colors.grey.shade300,
    );
  }
}
