import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _imageBitcoin = AssetImage("images/bitcoin.png");
  var _valor = "";

  _calculoBitcoin() async {
    var url = "https://blockchain.info/ticker";
    var response = await http.get(url);

    Map<String, dynamic> valores = jsonDecode(response.body);
    setState(() {
      Map<String, dynamic> brl = valores["BRL"];
      this._valor = "R\$ " +brl["last"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.yellow,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: this._imageBitcoin,
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              _valor,
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: RaisedButton(
              color: Colors.amber,
              onPressed: () {
                _calculoBitcoin();
              },
              child: Text(
                "Atualizar",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            /* */
          ),
        ],
      ),
    );
  }
}
