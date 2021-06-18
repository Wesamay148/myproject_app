import 'package:flutter/material.dart';
import 'package:myproject_app/models/Location.dart';
import  'package:myproject_app/main.dart';
class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  final nameController = TextEditingController();
  final themeController = TextEditingController();
  final desController = TextEditingController();
  final imgController = TextEditingController();
  final locUrlController = TextEditingController();
  //controllers for each of the textFields


  String _locationName;
  String _theme;
  String _fulldescription;
  String _imageurl;
  String _locationurl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Widget _buildlocationName() {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(labelText: 'Location name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Location name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _locationName = value;
      },
    );
  }

  Widget _buildtheme() {
    return TextFormField(
      //theme
      controller: themeController,
      decoration: InputDecoration(labelText: 'Theme'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Theme is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _theme = value;
      },
    );
  }

  Widget _buildfulldescription() {
    return TextFormField(
      //description

      decoration: InputDecoration(labelText: 'full description'),
      controller: desController,
      //description controller
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'full description is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _fulldescription = value;
      },
    );
  }

  Widget _buildimageurl() {
    return TextFormField(
      //image
      controller: imgController,
      decoration: InputDecoration(labelText: 'image url'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'image url is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _imageurl = value;
      },
    );
  }

  Widget _buildlocationurl() {
    return TextFormField(
      //locationURL
      controller: locUrlController,
      decoration: InputDecoration(labelText: 'location url'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'location url is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _locationurl = value;

      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("form")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildlocationName(),
                _buildtheme(),
                _buildfulldescription(),
                _buildimageurl(),
                _buildlocationurl(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'add',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }



                    _formKey.currentState.save();
                    //here calling some widget
                    //but first we need to create a new location
                    Location l=new Location(id:ListViewBuilder.listobj.length,name: _locationName,theme: _theme,
                    description:_fulldescription,imageUrl:_imageurl
                        ,locationUrl: _locationurl
                    );
                    ListViewBuilder.listobj.add(l);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>ListViewBuilder()),
                    );

                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form'),
      ),
    );
  }

