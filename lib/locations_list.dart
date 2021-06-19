import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myproject_app/models/Location.dart';
import 'package:myproject_app/data/locations.dart';

import 'DetailsScreen.dart';
import 'LocationTile.dart';


class locationsList extends StatefulWidget {
  @override
  locationsListState createState() => locationsListState();
}

class locationsListState extends State<locationsList> {
  static List<Location> listobj =   new locationsAll().listobj;
  @override
  Widget build(BuildContext context) {

    final locations = Provider.of<List<Location>>(context);
    locations.forEach((location) {
      print(location.name);
      print(location.description);
      print(location.theme);
      print(location.imageUrl);
      print(location.locationUrl);
    });
    return ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
      return LocationTile(location: locations[index]);
        },
      /*itemCount: listobj.length,
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
        }*/
    );
  }
}
