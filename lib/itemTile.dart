
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_code_base/homeScreen.dart';
import 'package:provider/provider.dart';
import 'main.dart';


class _ItemState extends State<ItemTile>{
  _ItemState(this.tileName, this.tileType);
  String tileName;
  String tileType;

  void getItemInfo(){
   showModalBottomSheet<void>(
      context: context,
      elevation: 2,
      enableDrag: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Center(
            child:
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //
            //
            //
            //
            //     const Text('Modal BottomSheet'),
            //     ElevatedButton(
            //       child: const Text('Close BottomSheet'),
            //       onPressed: () => Navigator.pop(context),
            //     )
            //   ],
            // )
            ListView(
              children: <Widget>[
                RaisedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Icon(Icons.keyboard_arrow_down_outlined)),
            Text(tileName),
                Text(tileType),
            Image.asset("assets/test1.png",width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/3,)
              ],
            )


            ,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xffffff),
          border: Border.all(
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.amber
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  RaisedButton(onPressed: (){
                    getItemInfo();
                  },
                  child:Image.asset("assets/test1.png",width: MediaQuery.of(context).size.width/3,height: MediaQuery.of(context).size.height/3,))
                  ,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("Tile Name",style: TextStyle(fontSize: 20.0,color:Colors.black,),),
                      Text("Count :",style: TextStyle(fontSize: 10.0,color:Colors.black,),),
                      Container(
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
                  )

                ],
              ),

            ),

          ],
        ),
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




class CustomBottomSheet extends BottomSheet{

}