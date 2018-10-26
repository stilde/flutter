import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int itemSelectionne;
  bool interrupteur = false;

  List<Widget> radios() {
    List<Widget> l = [];
    for (int x = 0; x < 4; x++) {
      Row row = new Row(
        children: <Widget>[
          new Text('choix n° ${x + 1}'),
          new Radio(
              value: x,
              groupValue: itemSelectionne,
              onChanged: (int i) {
                setState(() {
                  itemSelectionne = i;
                });
              }),
        ],
      );
      l.add(row);
    }
    return l;
  }

  Map check = {
    'Carottes': false,
    'Bananes': false,
    'Yaourt': false,
    'Pain': false
  };

  List<Widget> checkList() {
    List<Widget> l = [];
    check.forEach(
      (key, value) {
        Row row = new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(key,
                style: new TextStyle(
                  color: value ? Colors.green : Colors.red,
                )),
            new Checkbox(
              value: value,
              onChanged: (bool b) {
                setState(() {
                  check[key] = b;
                });
              },
            )
          ],
        );
        l.add(row);
      },
    );
    return l;
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      print("nous sommes sur IOS");
    } else {
      print("nous ne sommes pas sur IOS");
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Stilde'),
          new Switch(
            value: interrupteur,
            inactiveTrackColor: Colors.red,
            onChanged: (bool b) {
              setState(() {
                interrupteur = b;
              });
            },
          ),
          new Column(
              // children: checkList(),
              )
        ],
      )),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
