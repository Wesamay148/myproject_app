import 'package:flutter/material.dart';
import 'package:myproject_app/FormScreen.dart';
import 'package:myproject_app/data/locations.dart';
import 'package:myproject_app/DetailsScreen.dart';
import 'package:myproject_app/models/Location.dart';
import 'package:provider/provider.dart';
import 'package:myproject_app/services/database.dart';

import 'locations_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "favLocations",
        theme: new ThemeData(
            primarySwatch: Colors.blue
        ),
        debugShowCheckedModeBanner: false,
        home: new ListViewBuilder()
    );
  }
}
class ListViewBuilder extends StatelessWidget {
  static List<Location> listobj =   new locationsAll().listobj;
  ListViewBuilder();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Location>>.value(
      value: DatabaseService().locations,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormScreen()),
            );
          },

        ),
        appBar: AppBar(
            title:Text("favLocations")
        ),
        body : locationsList(),
      ),
    );
  }
}

