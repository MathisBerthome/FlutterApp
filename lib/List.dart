import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tuto/env.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class ListRecherche extends StatelessWidget {
  final String value;
  final String etablissement;
  Map<String, dynamic> data;
  int nbResult;
  List<String> result = new List<String>();
  bool chargement = true;
  ListRecherche({Key key, this.value, this.etablissement}): super(key: key);

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://api.foursquare.com/v2/venues/search?client_id=XN5IBNYJ0XJJ0G3XRIQGG0VQB0APAMUGXNGLMRJ3FWEKKVOJ&client_secret=R30PUKOMSORQOOMTTYVGC22SZSXB1NX12TJFG0AF5GLYGS3J&v=20180323&limit=1&ll=40.7243,-74.0018&query="+ etablissement + "location=" + value),
        headers: {
          "Accept" : "application/json"
        }
    );
    data = await jsonDecode(response.body);
    nbResult = data["response"]["venues"].length;
    chargement = false;
  }

  @override
  Widget build(BuildContext context) {
    while(chargement){
      return Scaffold(
          appBar: AppBar(
            title: Text("Liste Recherché"),
          ),
          body : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Text("chargement"),
                );
              }
          )
      );
    }
    getData().then((result)
    {
      return Scaffold(
          appBar: AppBar(
            title: Text("Liste Recherché"),
          ),
          body : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: nbResult,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Text(data["response"]["venues"][index + 1]["name"]),
                  onTap: CreateViewDetail,
                );
              }
          )
      );
    });
  }

  void CreateViewDetail() {
    String titre = data["response"]["venues"][0]["name"];
    var route = new MaterialPageRoute(
        builder: (BuildContext context) => new Detail(Titre: titre)
    );
  }
}