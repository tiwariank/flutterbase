

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'base_provider.dart';
import 'package:provider/provider.dart';

class AddTileModal extends StatefulWidget {
  @override
  _AddTileModal createState() {
    return _AddTileModal();
  }
}


class _AddTileModal extends State<AddTileModal> {

  String tileName;
  String tileType;
  void addItemTile(BuildContext context,String tileName,String tileType) {
    Provider.of<UpdatedTileList>(context, listen: false).addTile(tileName,tileType);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
        onSaved: (String value) {
            setState(() {
              tileName =value;
            });
        }
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
              onSaved: (String value) {
                setState(() {
                  tileType =value;
                });
              }
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                // if (_formKey.currentState.validate()) {
                //   // If the form is valid, display a Snackbar.
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(SnackBar(content: Text('Processing Data')));
                // }

                addItemTile(context, tileName, tileType);
                Navigator.pop(context);
              },
              child: Text('Add Tile'),
            ),
          ),
        ],
      ),
    );
  }
}