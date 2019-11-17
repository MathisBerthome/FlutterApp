import 'package:flutter/material.dart';
import 'List.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Simple Login Demo',
      theme: new ThemeData(
          primarySwatch: Colors.blue
      ),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _localisationFilter = new TextEditingController();
  final TextEditingController _Etablissement = new TextEditingController();
  String _localisation;

  _LoginPageState() {
    _localisationFilter.addListener(_LocalisationListen);
  }

  void _LocalisationListen() {
    if (_localisationFilter.text.isEmpty) {
      _localisation = "";
    } else {
      _localisation = _localisationFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Accueil"),
      centerTitle: true,
    );
  }



  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _localisationFilter,
              decoration: new InputDecoration(
                  labelText: 'Localisation'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _Etablissement,
              decoration: new InputDecoration(
                  labelText: 'Etablissemennt'
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButton() {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Rechercher'),
              onPressed: _Passage,
            ),
          ],
        ),
      );
  }

  void _Passage () {
    var route = new MaterialPageRoute(
        builder: (BuildContext context) => new ListRecherche(value: _localisationFilter.text, etablissement: _Etablissement.text,)
    );
    Navigator.of(context).push(route);
  }

}