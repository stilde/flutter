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
  String changed;
  String submitted;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector( //Pour prendre en compte le pavé numérique
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.number,
              onChanged: (String string) {
                setState(() {
                  changed = string;
                });
              },
              onSubmitted: (String string) {
                setState(() {
                  submitted = string;
                });
              },
              decoration: new InputDecoration(labelText: 'entrez votre nom'),
            ),
            new Text(changed ?? 'CHANGED'),
            new Text(submitted ?? 'SUBMITTED'),
          ],
        )),
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
