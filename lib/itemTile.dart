
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class _ItemState extends State<ItemTile>{
  _ItemState(this.tileName, this.tileType);
  String tileName;
  String tileType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        border: Border.all(
          width: 4,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 300.0,
            child: Row(
              children: <Widget>[
                Text("Count :",style: TextStyle(fontSize: 10.0,color:Colors.black,),),
                Text("Tile Name",style: TextStyle(fontSize: 20.0,color:Colors.black,),)
              ],
            ),

          ),
          Container(
            width: 300.0,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: <Widget>[
                Text("Tile Type",style: TextStyle(fontSize: 30.0))
              ],
            ),

          )
        ],
      ),
    );

  }


}

class ItemTile extends StatefulWidget{
  ItemTile(this.tileName, this.tileType);
  final String tileName;
  final String tileType;
  @override
  State<StatefulWidget> createState() {
    return _ItemState(tileName,tileType);
  }
  // String tileName;
  // String tileType;


}