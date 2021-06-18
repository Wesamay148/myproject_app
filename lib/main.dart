import 'package:flutter/material.dart';
import 'package:myproject_app/FormScreen.dart';
import 'package:myproject_app/data/locations.dart';
import 'package:myproject_app/DetailsScreen.dart';
import 'package:myproject_app/models/Location.dart';
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
  ListViewBuilder(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView.builder(
    itemCount: listobj.length,

    itemBuilder: (BuildContext context,int index){
    return Center(
    child: Card(
    child: InkWell(
    splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute(i:index)),
          );
          //
          /*

          * */
    },
    child: Column(children:<Widget>[
    Container(height: 240, width: 380, child:Image.network(listobj[index].imageUrl)),
      Padding(
        padding: const
        EdgeInsets.symmetric(vertical:5.0),
      ),
      Text(listobj[index].name),
      Text(listobj[index].theme,style:TextStyle(color:Colors.grey)),
      Padding(
        padding: const
        EdgeInsets.symmetric(vertical:5.0),
      ),
    ])
    ),
    ),
    );
    }
    ));
  }
}

