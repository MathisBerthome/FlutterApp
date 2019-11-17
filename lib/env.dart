import 'package:flutter/material.dart';

class Detail extends StatelessWidget {

  final String Titre;
  Detail({Key key, this.Titre}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(Titre),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}