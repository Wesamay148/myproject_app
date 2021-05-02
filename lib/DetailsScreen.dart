import 'package:flutter/material.dart';
import 'package:myproject_app/data/locations.dart';
import 'package:url_launcher/url_launcher.dart';
//this requires an edit in pubspec file



class SecondRoute extends StatelessWidget {
  locationsAll location = new locationsAll();
  int i;
  SecondRoute({this.i}){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_on),
        onPressed: () {
          launch(location.listobj[i].locationUrl);

        },
      ),
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const
            EdgeInsets.symmetric(vertical:5.0),
          ),
          Text(location.listobj[i].name, style:TextStyle(fontSize:30.0,fontWeight:FontWeight.bold,
              fontStyle: FontStyle.italic,fontFamily:'sans-serif')),
          Padding(
            padding: const
            EdgeInsets.symmetric(vertical:5.0),
          ),
          Container(height: 240, width: 380,
              child: Image.network(location.listobj[i].imageUrl)),
          Padding(
            padding: const
            EdgeInsets.symmetric(vertical:5.0),
          ),
          Text(location.listobj[i].description, style:TextStyle(fontSize:19.0,fontFamily:'sans-serif'))


        ]

        ),

      ),
    );
  }
}
