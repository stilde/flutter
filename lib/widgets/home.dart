import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:interactif/models/parser.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
RssFeed feed;

@override
void initState(){
  super.initState();
  parse();
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(),
    );
   
  }
Future parse() async {
  RssFeed recu = await Parser().chargeRSS();
  if (recu != null){
    setState(() {
          feed = recu;
          print('le rss = ${feed.image.toString()}');
        });
  }else{
 print('le rss2 = $recu');
  }
  }
  


}
