import 'package:myproject_app/models/Location.dart';
import 'package:flutter/material.dart';
import 'package:myproject_app/data/locations.dart';

import 'DetailsScreen.dart';

class LocationTile extends StatelessWidget {

  final Location location;
  LocationTile({ this.location });

  @override
  Widget build(BuildContext context) {
    List<Location> listobj =   new locationsAll().listobj;
    return Center(
      child: Card(
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute(i:listobj.length)),
              );
            },
            child: Column(children:<Widget>[
              Container(height: 240, width: 380, child:Image.network(location.imageUrl)),
              Padding(
                padding: const
                EdgeInsets.symmetric(vertical:5.0),
              ),
              Text(location.name),
              Text(location.theme,style:TextStyle(color:Colors.grey)),
              Padding(
                padding: const
                EdgeInsets.symmetric(vertical:5.0),
              ),
            ])
        ),
      ),
    );
  }
}