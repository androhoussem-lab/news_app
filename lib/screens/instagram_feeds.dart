import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  TextStyle _hashTagStyle = TextStyle(color: Colors.orange);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram feeds'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, position) {
          return Card(
            margin: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _drawHeader(),
                  _drawTitle(),
                  _drawHashTags(),
                  _drawBody(),
                  _drawFooter(),
                ],
              ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left : 8 , right: 8),
          child: Row(
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
                  Text(
                    'Christina Meyers',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Fry,12 Mai 2019 . 14:30',
                      style: TextStyle(color: Colors.grey.shade400)),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey.shade400,
                ),
                onPressed: () {}),
            Transform.translate(
              offset: Offset(-8, 0),
              child: Text(
                '23',
                style: TextStyle(color: Colors.grey.shade400),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8 , top: 8),
      child: Text(
        'We also talk about the future of work,the future ',
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }

  Widget _drawHashTags() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text('#advance', style: _hashTagStyle,),
          ),
          FlatButton(
            onPressed: () {},
            child: Text('#advance', style: _hashTagStyle,),
          ),
          FlatButton(
            onPressed: () {},
            child: Text('#advance', style: _hashTagStyle,),
          ),
          
        ],
      ),
    );
  }

  Widget _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image(image: ExactAssetImage('assets/images/imageholder_bg.png'),fit: BoxFit.cover,),
    );
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(onPressed: (){}, child: Text('10 COMMENTS' , style: _hashTagStyle,)),
        Row(
          children: <Widget>[
            FlatButton(onPressed: (){}, child: Text('SHARE' , style: _hashTagStyle,)),
            FlatButton(onPressed: (){}, child: Text('OPEN' , style: _hashTagStyle,)),
          ],
        )
      ],
    );
  }
}
