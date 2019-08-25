import 'dart:math';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.green,
    Colors.deepOrange,
    Colors.teal,
    Colors.orange,
    Colors.pink,
  ];
  Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _authorRow(),
                _newsItemRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _newsItemRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        //Row 001
        children: <Widget>[
          SizedBox(
            child: Image(
              image: ExactAssetImage('assets/images/imageholder_bg.png'),
              fit: BoxFit.cover,
            ),
            width: 100,
            height: 100,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'The world global warming global summit',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text('We also talk about the future of work as the robot adcance , and we ask whether a retro phone',
                  style: TextStyle(
                      color: Colors.grey.shade600, fontSize: 14, height: 1.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getRandomColor() {
    return _colors[_random.nextInt(_colors.length)];
  }

  Widget _authorRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8),
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/imageholder_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Michal Adams',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '15 min',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(' . '),
                    Text(
                      'Life Style',
                      style: TextStyle(
                          fontSize: 14,
                          color: _getRandomColor(),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          color: Colors.grey.shade500,
          onPressed: () {},
        ),
      ],
    );
  }
}
