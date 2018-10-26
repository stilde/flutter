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
  List<Activite> mesActivites = [
    new Activite("velo", Icons.directions_bike),
    new Activite("peinture", Icons.palette),
    new Activite("golf", Icons.golf_course),
    new Activite("bricolage", Icons.build),
    new Activite("velo", Icons.directions_bike),
    new Activite("peinture", Icons.palette),
    new Activite("golf", Icons.golf_course),
    new Activite("bricolage", Icons.build),
    new Activite("velo", Icons.directions_bike),
    new Activite("peinture", Icons.palette),
    new Activite("golf", Icons.golf_course),
    new Activite("bricolage", Icons.build),
    new Activite("velo", Icons.directions_bike),
    new Activite("peinture", Icons.palette),
    new Activite("golf", Icons.golf_course),
    new Activite("bricolage", Icons.build),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: mesActivites.length,
          itemBuilder: (context, i) {
            Activite activite = mesActivites[i];
            String key = activite.nom;

            return new Dismissible(
              key: new Key(key),
              child: new ListTile(
                title: new Text(mesActivites[i].nom),
                trailing: new Icon(mesActivites[i].icone),
              ),
              background: new Container(
                padding: EdgeInsets.only(right: 20.0),
                color: Colors.blue[200],
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text(
                      'supprimer',
                      style: new TextStyle(color: Colors.white),
                    ),
                    new Icon(Icons.delete, color: Colors.white),
                  ],
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  print(activite.nom);
                  mesActivites.removeAt(i);
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class Activite {
  String nom;
  IconData icone;

  Activite(String nom, IconData icone) {
    this.nom = nom;
    this.icone = icone;
  }
}
