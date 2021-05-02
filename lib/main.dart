import 'package:flutter/material.dart';
import 'package:myproject_app/data/locations.dart';
import 'package:myproject_app/DetailsScreen.dart';
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
  locationsAll location = new locationsAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("favLocations")
      ),
      body: ListView.builder(
    itemCount: 5,
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
    },
    child: Column(children:<Widget>[
    Container(height: 240, width: 380, child:Image.network(location.listobj[index].imageUrl)),
      Padding(
        padding: const
        EdgeInsets.symmetric(vertical:5.0),
      ),
      Text(location.listobj[index].name),
      Text(location.listobj[index].theme,style:TextStyle(color:Colors.grey)),
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

