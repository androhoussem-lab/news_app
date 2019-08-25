import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
        ],
      ),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 14),
            child: _drawSectionTitle('Top stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Column(
                children: <Widget>[
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                    child: _drawSectionTitle('Recent updates'),
                  ),
                  _drawRecentUpdateCard(Colors.red),
                  _drawRecentUpdateCard(Colors.green),
                  SizedBox(height: 48),
                ],
              )),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _titleStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    TextStyle _descriptionStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage('assets/images/imageholder_bg.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Text(
                'How terriers & Royals Gatecreashed Final',
                textAlign: TextAlign.center,
                style: _titleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
              child: Text(
                'Lorem epsum dolor slt amet , Consectetor adipicing elit , sed du eiudmod ',
                textAlign: TextAlign.center,
                style: _descriptionStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }

  Widget _drawSingleRow() {
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
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Michal Adams',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.timer),
                        Text(
                          '15 min',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade300,
    );
  }

  Widget _drawRecentUpdateCard(Color color) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width * 0.30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/imageholder_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Container(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Sports',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Text(
              'Vettel is ferrari number one - Hamilton',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16 , bottom: 16),
            child: Row(
              children: <Widget>[
                Icon(Icons.timer , color:Colors.grey,size: 14,),
                SizedBox(width: 5),
                Text('15 min' , style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
